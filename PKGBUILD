# shellcheck shell=bash
# AUR Maintainer: Shadichy <shadichy@blisslabs.org>

pkgbase=ntfsplus-dkms-git
pkgname=("$pkgbase" "ntfsplus-udev")
pkgver=2025.12.29.r0.8d80646ca301
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
  '0001-fs-ntfs-inode.c-Resolve-import-for-inode_generic_dro.patch'
  '0002-ntfsplus-Resolve-iomap_-arguments-temporarily-for-ke.patch'
  '0003-ntfsplus-Backport-iomap.c-functions-to-kernels-older.patch'
  '0004-ntfsplus-file.c-Using-mmap-instead-of-mmap_prepare-f.patch'
  '0005-ntfsplus-compress.c-using-page-index-instead-of-page.patch'
  '0006-ntfsplus-Update-iomap_zero_range-iomap_page_mkwrite-.patch'
  '0007-ntfsplus-Backport-ntfs_mkdir-for-kernels-older-than-.patch'
  '0008-ntfsplus-Resolve-import-for-newly-declared-6.19-func.patch'
  '0099-fs-ntfsplus-Makefile-DKMS-patch.patch'
  'dkms.conf'
  '00-ntfsplus.conf'
  '90-udev-prefer-ntfsplus.rules'
)
sha256sums=(
  SKIP
  433a26776281fb220a6fe5c720de641c198062a9475f907eef7f49220c06801e
  ccc6607abd5ec87aa40c6191a9cc0369ca3187aac928f14348783157efe8a21d
  b244b486c9e1a192c923b2c43e618eabbb4e07859f0ad415adc3cfe2f30fdd83
  45d5c6984e8be56ec136e5ce5869e4cb2ebfd785a8951584e899eafa449cfa52
  ea976ce482b7064dad4a17df0c6945264f33c4e2346af178dbc7bdf9046240c9
  dd7c90b20a537384fef4acb1ce3ece1d93d3b410fae59235d2cf5606b1afb37e
  18f71b055dc1b0eb901f1493ddd0c09405cd0fce07c9a5e583b349b5e419a484
  003e34bd3f77bde1ef04a1b90aa38ee43ce90b77b37f8746634cbf71275ca6a5
  98253f4fc2307c17c5ca12262f193da1f392507eb8ca1a231a473ba82db66b30
  86bb5907151229bcb05686a432ec3615dcdc4b4395b8b0330205d19a61d930b7
  a557cb5941e0ea786bff0910cbb1cdb70f23823ffdbab4c766621fcff2afc6f8
  25f98d3070e1486d75351c38f5c2e30b4459e9e27cd5fdd45bba09eee94a684a
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
  provides=('ntfsplus' 'ntfs' 'NTFSPLUS-MODULE' 'NTFS-MODULE')
  conflicts=('ntfsplus' 'ntfs')

  cd "$srcdir"

  local dest="$pkgdir/usr/src/ntfs-${pkgver}"
  install -Dm644 "$(readlink -f dkms.conf)" "$dest/dkms.conf"
  cp -rpT "$srcdir/linux/fs/ntfs" "$dest"
  install -Dm644 "$srcdir/linux/include/uapi/linux/ntfs.h" "$dest/include/uapi/linux/ntfs.h"

  # Install module config
  mkdir -p "$pkgdir/etc/modprobe.d"
  install -Dm644 "$(readlink -f 00-ntfsplus.conf)" "$pkgdir/etc/modprobe.d/"
}

package_ntfsplus-udev() {
  pkgdesc="udev rules for ntfsplus."
  depends=('udev')

  cd "$srcdir"

  local rule='90-udev-prefer-ntfsplus.rules'
  install -Dm644 "$(readlink -f "$rule")" "$pkgdir/usr/lib/udev/rules.d/$rule"
}
