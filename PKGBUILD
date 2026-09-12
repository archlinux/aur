# shellcheck shell=bash
# AUR Maintainer: Shadichy <shadichy@blisslabs.org>

_pkg=kernelsu
pkgname=${_pkg}-dkms
pkgver=3.3.0+7+gfde078c9
_ver=$pkgver
pkgrel=1
_branch=waydroid-experimental
pkgdesc="A Kernel based root solution for Android. DKMS module for Container-based solutions such as Waydroid."
arch=('any')
url="https://github.com/supechicken/KernelSU"
_upstream="https://github.com/tiann/$_pkg.git"
license=('GPL-2.0-only')
depends=('dkms')
makedepends=('git' 'rust' 'cargo')
options=('!strip' '!emptydirs')

# Using custom download agent to shallow clone the repo
cat <<'EOF' >DLAGENTS
#!/bin/sh

PWD=$(pwd)

ORIGIN=${1#shallowclone+}
ORG_URL=${ORIGIN%%'?'*}
ORG_ARGS=${ORIGIN#*'?'}

DEST=${2}
REAL_DEST=${DEST%.part}

### Parse url parameters

arg_parser() {
  local args=$1
  shift

  IFS='&'
  set -- ${args}
  unset IFS

  BRANCH=
  COMMIT=
  TAG=
  RECURSE_SUBMODULES=
  DEPTH=1

  while [ $# -gt 0 ]; do
    case $1 in
      branch=*) BRANCH=${1#branch=} ;;
      commit=*) COMMIT=${1#commit=} ;;
      tag=*) TAG=${1#tag=} ;;
      recurse=true) RECURSE_SUBMODULES=1 ;;
      depth=*) DEPTH=${1#depth=} ;;
      *) : ;;
    esac
    shift
  done

  export BRANCH COMMIT TAG RECURSE_SUBMODULES DEPTH
}

arg_parser "${ORG_ARGS}"

update_src() {
  git fetch \
    --depth 1 \
    ${RECURSE_SUBMODULES:+'--recurse-submodules'} \
    origin "${COMMIT:-${BRANCH:-${TAG}}}"
}

### Verify if destination already exists and is a valid git repository with the correct remote URL

verify_dest() {
  local dest=$1 current_url
  [ -d "${dest}/.git" ] || return
  echo "Source dest exists, updating..."

  cd "${dest}"
  git remote set-url origin "${ORG_URL}"
  
  { # Abort any in-progress tasks
    git merge --abort ||
      git rebase --abort ||
      git cherry-pick --abort || :
  } 2>/dev/null

  # Update the existing shallow clone
  update_src
  git reset --hard FETCH_HEAD
  cd "${PWD}"

  ln -s "../${dest}" "../src/${dest}"
  echo ${dest}
  exit 0
}

verify_dest "${DEST}"
verify_dest "${REAL_DEST}"

### If not, perform a fresh shallow clone

rm -rf "${DEST}"
mkdir -p "${DEST}"

cd "${DEST}"
git init --quiet
git remote add origin "${ORG_URL}"

update_src
git reset --hard FETCH_HEAD

cd "${PWD}"

ln -s "../${REAL_DEST}" "../src/${REAL_DEST}"
echo ${REAL_DEST}
EOF
chmod +x DLAGENTS
export DLAGENTS="shallowclone::$(realpath "./DLAGENTS") %u %o"

source=(
	"${_pkg}::git+${url}#branch=${_branch}"
	'Makefile'
	'dkms.conf'
	'00-kernelsu.conf'
)

sha256sums=(
	'SKIP'
	'd71e7580f548e48f234c403ba9a06baa5504473901b65f54a6cbea3b0219c5ca'
	'3eaeaf5a2a5442204ae0cad3c4c25855a90e4e683da56579cc7eb2bada42ccb9'
	'05feaafbbac794a68c7eeea8c0a4c5616fc9f6ef7e4b7540baf3f5d43fad5fb0'
)

pkgver() {
	cd "$srcdir/$_pkg"

	{
		if ! git remote add upstream "${_upstream}" 2>/dev/null; then
			git remote set-url upstream "${_upstream}"
		fi
		git fetch --tags upstream v${_ver%%'+'*}
		git fetch --unshallow --no-tags origin "$_branch" || :
	} >/dev/null 2>&1

	git describe --long --tags | sed 's#v##;s#-RC#.rc#;s#-#+#g'
}

build() {
	cd "$srcdir/$_pkg/userspace/ksuinit"
	cargo build --release --target-dir .
}

package() {
	local dest="$pkgdir/usr/src/kernelsu-${pkgver}"
	mkdir -p "$dest"

	cd "$srcdir"
	cp -rpt "$dest" "${_pkg}/kernel/."

	cd "$_pkg"

	local _major _count _realver
	_major=${pkgver%%.*}
	_count=$(git rev-list --count HEAD 2>/dev/null)
	_realver=$((_major * 10000 + _count))

	local buildfile=kernel/Kbuild
	if [ ! -f "$buildfile" ]; then
		buildfile=kernel/Makefile
	fi

	cd "$srcdir"

	sed "s|@PKGVER@|${pkgver}|g;\
    s|@KSU_GIT_VERSION@|${_count}|g;" "$(readlink -f dkms.conf)" >"$dest/dkms.conf"

	install -Dm644 "$(readlink -f Makefile)" "$dest/Makefile"

	# Install module config
	mkdir -p "$pkgdir/etc/modprobe.d"
	install -Dm644 "$(readlink -f 00-kernelsu.conf)" "$pkgdir/etc/modprobe.d/"

	# Install loader
	cd "$srcdir/$_pkg/userspace/ksuinit"
  install -Dm755 release/ksuinit "$pkgdir/usr/bin/kernelsu-loader"
}
