# shellcheck shell=bash
# AUR Maintainer: Shadichy <shadichy@blisslabs.org>

pkgbase=ntfsplus-dkms-git
pkgname=("$pkgbase" "ntfsplus-udev")
pkgver=2025.10.20.r35.8d8af2b59
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
  '0006-ntfsplus-Update-iomap_zero_range-iomap_page_mkwrite-.patch'
  '0007-ntfsplus-Backport-ntfs_mkdir-for-kernels-older-than-.patch'
  '0008-ntfsplus-Backport-_ntfs_finish_ioend_buffered-and-nt.patch'
  '0099-fs-ntfsplus-Makefile-DKMS-patch.patch'
  'dkms.conf'
  '90-udev-prefer-ntfsplus.rules'
)
sha256sums=(
  SKIP
  03b57c05e6f9fbf5b5bf34507aa212f6491967f21c53a73352e7f78ebfaf66a8
  bede30ed663dada47c946f74a314b8e25817c4cd8b6c39e0cd5810bbd1cddca2
  dd682c4ac17dd2b6cf83b1c9bb72054fe80b3ebfe2811759cacce3f238194435
  e2076bb0aa0ee00b52a07f6158028023af5bcbff9c47060cad35bd37675da841
  b4ebc8c9a4db7293f293a8276f70dc4a7799812a9a73d681b3b732a0beaaa326
  1fcc9a36238d5aa779b8a1b1171c5f2a6b493f5eedaa30815e3793afe68be653
  6a7dd17acf94f2741105c45acc53b04bfe0fd13b9f3c3b79bf4e533db78f7262
  1624bf66ab17ed7fd564ad83b01b172b27dad02087f1e28c024f89024d71ec2a
  3b6f8efd31053e1bdba0a149a97ba2cab9fa7a841b73e08f09116edcbef4971c
  9d75ed62e696e295140c7e61c1e8e781a619406cab9f60f51393dfb763bfd33d
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
  git am --empty=keep --whitespace=fix "$srcdir"/0*.patch
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
