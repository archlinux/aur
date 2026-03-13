#shellcheck shell=bash
# AUR package maintainer: Shadichy <shadichy@blisslabs.org>

pkgbase=clang-android
pkgname=${pkgbase}-bin
pkgver=22.0.0
pkgrel=1
pkgdesc="LLVM's C language family frontend for compiling Android components, prebuilt by Google for Android NDK."
arch=('x86_64' 'aarch64')
case "$(uname -m)" in
x86_64) 
	BRANCH=main-kernel
	SUFFIX=x86
	;;
aarch64) 
	BRANCH=main-kernel
	SUFFIX=arm64
	;;
esac

url="https://android.googlesource.com/platform/prebuilts/clang/host"
license=('custom:Apache 2.0 with LLVM Exception')
depends=()
provides=('clang-android')
conflicts=('clang-android')
replaces=('clang-android')
options=('!strip' '!debug')
source=("clang::shallowclone+${url}/linux-${SUFFIX}?branch=${BRANCH}")

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

sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/../clang"

	local latest rev
	latest=0
	for ver in clang-r*/; do
		rev=$(basename "${ver##*r}")

		if [ "$rev" -gt "$latest" ]; then
			latest=$rev
		fi
	done
	rev=$latest
	export pkgrel=$rev

	./clang-r$latest/bin/clang --version | grep version | awk -F " clang version " '{print $2}' | cut -d' ' -f1

	mv clang-r$latest $srcdir/build
}

package() {
	local TARGET=$(realpath $pkgdir)/opt/android/clang
	mkdir -p "$TARGET"

	cd "$srcdir"

	cp -rt "$TARGET" build/.
}
