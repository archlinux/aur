# shellcheck shell=bash
# AUR Maintainer: Shadichy <shadichy@blisslabs.org>

_pkg=kernelsu
pkgname=${_pkg}-dkms
pkgver=3.1.0
pkgrel=1
_ver=3.1.0
_upstream_ver=v3.1.0
pkgdesc="A Kernel based root solution for Android. DKMS module for Container-based solutions such as Waydroid."
arch=('any')
url="https://github.com/tiann/KernelSU"
license=('GPL-2.0-only')
depends=('modloader')
makedepends=('git')
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
  "${_pkg}::shallowclone+${url}?tag=${_upstream_ver}"
  '0001-Kbuild-for-DKMS.patch'
  'Makefile'
  'dkms.conf'
  '00-kernelsu.conf'
  'load-kernelsu.in'
)
sha256sums=(
  SKIP
  6f4f51a8b76934402e01f557c947ea84f130075862b1de6ef9069032eb3483a2
  5a81e9d2fe45914338c0c3fa5ba7a6f17b461601556257bfa20b3a54bf891d74
  bf64465ccbf900fdfc9154e149cde13abc3c5651e32328b8b4b5a53d73f65bb7
  05feaafbbac794a68c7eeea8c0a4c5616fc9f6ef7e4b7540baf3f5d43fad5fb0
  ab4be9fc1db0291118b492f24d75bb0d88fa7e3822d9cfdf57e3c6bf126eacb2
)

package() {
  local dest="$pkgdir/usr/src/kernelsu-${pkgver}"
  mkdir -p "$dest"

  cd "$srcdir/.."
  cp -rpt "$dest" "${_pkg}/kernel/."

  cd "$_pkg"

  local _major=${pkgver%%.*}
  local _count=$(git rev-list --count HEAD 2>/dev/null)
  local _realver=$((_major * 10000 + _count))

  local buildfile=kernel/Kbuild
  if [ ! -f "$buildfile" ]; then
    buildfile=kernel/Makefile
  fi

  local app_size app_hash
  app_size=$(grep "KSU_EXPECTED_SIZE := " $buildfile | cut -d' ' -f3)
  app_hash=$(grep "KSU_EXPECTED_HASH := " $buildfile | cut -d' ' -f3)

  cd "$srcdir"

  sed "s|@PKGVER@|${pkgver}|g;\
    s|@KSU_GIT_VERSION@|${_count}|g;\
    s|@KSU_EXPECTED_SIZE@|${app_size}|g;
    s|@KSU_EXPECTED_HASH@|${app_hash}|g" "$(readlink -f dkms.conf)" > "$dest/dkms.conf"

  install -Dm644 "$(readlink -f Makefile)" "$dest/Makefile"

  # Install module config
  mkdir -p "$pkgdir/etc/modprobe.d"
  install -Dm644 "$(readlink -f 00-kernelsu.conf)" "$pkgdir/etc/modprobe.d/"

  # Install load script
  mkdir -p "$pkgdir/usr/bin"
  install -Dm755 "$(readlink -f load-kernelsu.in)" "$pkgdir/usr/bin/load-kernelsu"
}
