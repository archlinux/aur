# shellcheck shell=bash
# AUR Maintainer: Shadichy <shadichy@blisslabs.org>

pkgbase=ntfsplus-dkms-git
pkgname=("$pkgbase" "ntfsplus-udev")
pkgver=2025.10.20.r32.d76784df4
pkgrel=1
# epoch=1
pkgdesc="A new NTFS driver for Linux promised to be better than NTFS3. These patches are directly taken from the maintainer's mailing list posts. Backported to 6.17."
arch=('any')
url="https://lore.kernel.org/all/20251020021227.5965-6-linkinjeon@kernel.org"
license=('GPL-2.0-only')
makedepends=('git')
optdepends=(
  'ntfsprogs-plus: Recommended NTFS utilities'
)
options=('!strip' '!emptydirs')

# Using custom download agent to shallow clone the repo
cat <<'EOF' >DLAGENTS
#!/bin/sh

ORIGIN=${1#shallowclone+}
DEST=${2}
REAL_DEST=${DEST%.part}

# Verify if destination already exists and is a valid git repository with the correct remote URL

verify_dest() {
  local dest=$1 current_url
  if [ -d "${dest}/.git" ]; then
    cd "${dest}"
    current_url=$(git config --get remote.origin.url)
    if [ "${current_url}" = "${ORIGIN}" ]; then

      # # Abort any in-progress tasks
      git am --abort || true
      git merge --abort || true
      git rebase --abort || true

      # Update the existing shallow clone
      git fetch --depth 1
      git reset --hard FETCH_HEAD
      exit 0
    fi
  fi
}

verify_dest "${DEST}"
verify_dest "${REAL_DEST}"

# If not, perform a fresh shallow clone
rm -rf "${DEST}"
git clone --depth 1 --branch master --single-branch --no-tags "${ORIGIN}" "${DEST}"

echo ${REAL_DEST}
EOF
chmod +x DLAGENTS
export DLAGENTS="shallowclone::$(realpath "./DLAGENTS") %u %o"

source=(
  'linux::shallowclone+https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git'
  'ntfsplus-00-05.mbox.gz::https://lore.kernel.org/all/20251020020749.5522-1-linkinjeon@kernel.org/t.mbox.gz'
  'ntfsplus-06-11.mbox.gz::https://lore.kernel.org/all/20251020021227.5965-6-linkinjeon@kernel.org/t.mbox.gz'
  '0001-fs-ntfsplus-inode.c-Resolve-import-for-inode_generic.patch'
  '0002-ntfsplus-Resolve-iomap_-arguments-temporarily-for-ke.patch'
  '0003-ntfsplus-Backport-ntfs_iomap.c-functions-to-kernels-.patch'
  '0004-ntfsplus-file.c-Using-mmap-instead-of-mmap_prepare-f.patch'
  '0005-ntfsplus-compress.c-using-page-index-instead-of-page.patch'
  '0099-fs-ntfsplus-Makefile-DKMS-patch.patch'
  'dkms.conf'
  '90-udev-prefer-ntfsplus.rules'
)
sha256sums=(
  SKIP
  03b57c05e6f9fbf5b5bf34507aa212f6491967f21c53a73352e7f78ebfaf66a8
  bede30ed663dada47c946f74a314b8e25817c4cd8b6c39e0cd5810bbd1cddca2
  13f17e71c2c81332c3931ff587cc6224a65a5c670e15ba318fb48e3271cdc17a
  db0add66c82e5709cc3c96940dbb9dedeedebd60756eac47a01f97e55259be8c
  628687495499e6ab9269a6c27271061e417825fddfa77603902cbf931c34131c
  f32e8cbb55c2799be918fed82037baf56b7ac31ad3c1b11b330ceaeb64893904
  d3935300534ce7b8f548c27c5376d110f8fce283e727cc51bdf4042ea01fe8f9
  e217fa145f507b1e07e228e746528554f705f44fd5744f293b302b29df764b96
  ed9db8ec0caa09c977529c7ae89b808ee8c238331ec0fdf873525c115fcdfb7c
  e3866cac3d71da15740159c89b233d4d1f61981dbf737d4e3bc9a4c56bfa24be
)

_mailbox_last_date=

prepare() {
  if [ ! -e "$srcdir/linux" ]; then
    ln -s ../linux "$srcdir/linux"
  fi

  cd "$srcdir/linux"

  # Get the experimental ntfsplus driver from the mailing lists
  git am --empty=keep "$srcdir/ntfsplus-00-05.mbox" "$srcdir/ntfsplus-06-11.mbox"
  _mailbox_last_date=$(git log -1 --format='%ad' --date=iso-strict)

  # Apply patches
  git am "$srcdir"/0*.patch
}

pkgver() {
  cd "$srcdir/linux"

  # Version format: YYYY.MM.DD.r<commitcount>.<commitsha>
  # with date from _mailbox_last_date
  local commit_count commit_sha
  commit_count=$(git rev-list --count origin/master..HEAD)
  commit_sha=$(git rev-parse --short HEAD)
  date +'%Y.%m.%d.r'"${commit_count}"'.'"${commit_sha}" -d "$_mailbox_last_date"
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
