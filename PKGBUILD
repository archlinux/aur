# shellcheck shell=bash
# AUR Maintainer: Shadichy <shadichy@blisslabs.org>

pkgbase=ntfsplus-dkms-git
pkgname=("$pkgbase" "ntfsplus-udev")
pkgver=2025.11.27.r0.c21e17241
pkgrel=1
# epoch=1
pkgdesc="A new NTFS driver for Linux promised to be better than NTFS3. These patches are directly taken from the maintainer's mailing list posts. Backported to 6.12."
arch=('any')
url="https://github.com/shadichy/ntfsplus-dkms"
license=('GPL-2.0-only')
makedepends=('git')
optdepends=(
  'ntfsprogs-plus: Recommended NTFS utilities'
)
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
    ${TAG:-'--no-tags'} \
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
  
  # Abort any in-progress tasks
  git merge --abort ||
    git rebase --abort ||
    git cherry-pick --abort || :

  # Update the existing shallow clone
  update_src
  git reset --hard FETCH_HEAD
  cd "${PWD}"
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

echo ${REAL_DEST}
EOF
chmod +x DLAGENTS
export DLAGENTS="shallowclone::$(realpath "./DLAGENTS") %u %o"

source=(
  'linux::shallowclone+https://git.kernel.org/pub/scm/linux/kernel/git/linkinjeon/ntfs.git?branch=ntfs-next'
  '0001-fs-ntfsplus-inode.c-Resolve-import-for-inode_generic.patch'
  '0002-ntfsplus-Resolve-iomap_-arguments-temporarily-for-ke.patch'
  '0003-ntfsplus-Backport-ntfs_iomap.c-functions-to-kernels-.patch'
  '0004-ntfsplus-file.c-Using-mmap-instead-of-mmap_prepare-f.patch'
  '0005-ntfsplus-compress.c-using-page-index-instead-of-page.patch'
  '0006-ntfsplus-Update-iomap_zero_range-iomap_page_mkwrite-.patch'
  '0007-ntfsplus-Backport-ntfs_mkdir-for-kernels-older-than-.patch'
  '0099-fs-ntfsplus-Makefile-DKMS-patch.patch'
  'dkms.conf'
  '90-udev-prefer-ntfsplus.rules'
)
sha256sums=(
  SKIP
  868519f029a18eb0b563020386fc9ab55fc31ed611e19f2eb446894a2677d416
  4bdb0d5c97bd676ee077d9ffccbaf67eadf232b23c3e9fe060780df6420e9513
  78353b18ad7e37d390d79bc22f424a8042351e30eb01a17e4e7ffadafb6c7dce
  f8dbf89bfa7891adcba1c9900a8b4f31c59a6e32bf3c4b1b290073eed048e8d9
  0e971dcea24f447ee4349cab0764a55c8311cf668ce56343d1c1b325777e624d
  42d1b84476b71fb5cce03273cb1075698639c788b4307374c166d163370dbcc8
  89d0665e7e6ebabce544d008e6a18e8c2182e1c21692ac17fd5d466bed9591b2
  e217fa145f507b1e07e228e746528554f705f44fd5744f293b302b29df764b96
  99e3d34a646c13fd207b3d88265fb3fc2b7a0b88fd3461f0dc75669e7260ffc4
  e3866cac3d71da15740159c89b233d4d1f61981dbf737d4e3bc9a4c56bfa24be
)

_upstream_last_commit_date=

prepare() {
  if [ ! -e "$srcdir/linux" ]; then
    ln -s ../linux "$srcdir/linux"
  fi

  # Apply patches
  cd "$srcdir/linux"
  git apply --whitespace=fix "$srcdir"/0*.patch
}

pkgver() {
  cd "$srcdir/linux"

  # Version format: YYYY.MM.DD.r<commitcount>.<commitsha>
  # with date from _upstream_last_commit_date
  local commit_count commit_sha head_date
  commit_count=$(git rev-list --count FETCH_HEAD..HEAD)
  commit_sha=$(git rev-parse --short HEAD)
  head_date=$(git show -s --format='%cI' FETCH_HEAD)
  date +'%Y.%m.%d.r'"${commit_count}"'.'"${commit_sha}" -d "${head_date}"
}

build() {
  cd "$srcdir"

  sed -i "s/@PKGVER@/${pkgver}/" dkms.conf
}

package_ntfsplus-dkms-git() {
  pkgdesc="DKMS module for ntfsplus (A new NTFS driver for Linux promised to be better than NTFS3)."
  depends=('dkms')
  optdepends+=("ntfsplus-udev: udev rules for ntfsplus")
  provides=('ntfsplus' 'NTFSPLUS-MODULE')
  conflicts=('ntfsplus')

  cd "$srcdir"

  local dest="$pkgdir/usr/src/ntfsplus-${pkgver}"
  install -Dm644 "$(readlink -f dkms.conf)" "$dest/dkms.conf"
  cp -rpT "$srcdir/linux/fs/ntfsplus" "$dest"
  install -Dm644 "$srcdir/linux/include/uapi/linux/ntfs.h" "$dest/include/uapi/linux/ntfs.h"
}

package_ntfsplus-udev() {
  pkgdesc="udev rules for ntfsplus."
  depends=('udev')

  cd "$srcdir"

  local rule='90-udev-prefer-ntfsplus.rules'
  install -Dm644 "$(readlink -f "$rule")" "$pkgdir/usr/lib/udev/rules.d/$rule"
}
