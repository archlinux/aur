# shellcheck shell=bash
# AUR Maintainer: Shadichy <shadichy@blisslabs.org>

pkgbase=ntfsplus-dkms-git
pkgname=("$pkgbase" "ntfsplus-udev")
pkgver=2025.10.20.r20.c8a1f11f2
pkgrel=1
# epoch=1
pkgdesc="A new NTFS driver for Linux promised to be better than NTFS3. These patches are directly taken from the maintainer's mailing list posts. Backported to 6.17."
arch=('any')
url="https://lore.kernel.org/all/20251020021227.5965-6-linkinjeon@kernel.org"
license=('GPL-2.0-only')
makedepends=('git')
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
  '00-05.mbox.gz::https://lore.kernel.org/all/20251020020749.5522-1-linkinjeon@kernel.org/t.mbox.gz'
  '06-11.mbox.gz::https://lore.kernel.org/all/20251020021227.5965-6-linkinjeon@kernel.org/t.mbox.gz'
  '0001-fs-ntfsplus-inode.c-Resolve-import-for-inode_generic.patch'
  '0001-fs-ntfsplus-Makefile-DKMS-patch.patch'
  'dkms.conf'
  '90-udev-prefer-ntfsplus.rules'
)
sha256sums=(
  SKIP
  00415c42fa5809da14b84a2ecc6623e3e859fa803dfa7bdfa407a83d21d9b744
  bede30ed663dada47c946f74a314b8e25817c4cd8b6c39e0cd5810bbd1cddca2
  6e65520477bf80c9ac76cfc49e2e65eba0d63f1c846d1876c1874bdf2ac24a6c
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
  git am --empty=keep "$srcdir/00-05.mbox" "$srcdir/06-11.mbox"
  _mailbox_last_date=$(git log -1 --format='%ad' --date=iso-strict)

  # Apply the inode.c import fix patch
  git apply "$srcdir/0001-fs-ntfsplus-inode.c-Resolve-import-for-inode_generic.patch"

  # Apply the dkms Makefile patch
  patch -p1 <"$srcdir/0001-fs-ntfsplus-Makefile-DKMS-patch.patch"
}

pkgver() {
  cd "$srcdir/linux"

  # Version format: YYYY.MM.DD.r<commitcount>.<commitsha>
  # with date from _mailbox_last_date
  local commit_count commit_sha
  commit_count=$(git rev-list --count ORIG_HEAD..HEAD)
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
  opdepends=(
    'ntfsprogs-plus: Recommended NTFS utilities'
    'ntfsplus-udev: udev rules for ntfsplus'
  )
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
