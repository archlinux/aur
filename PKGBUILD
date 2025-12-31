# shellcheck shell=bash
# AUR Maintainer: Shadichy <shadichy@blisslabs.org>

pkgbase=ntfsplus-dkms-git
pkgname=("$pkgbase" "ntfsplus-udev")
pkgver=2025.12.31+c3894f2
pkgrel=1
# epoch=1
pkgdesc="A new NTFS driver for Linux promised to be better than NTFS3. Maintained out-of-tree. Backported to 5.15 LTS."
arch=('any')
url="https://github.com/namjaejeon/linux-ntfs"
license=('GPL-2.0-only')
makedepends=('git')
optdepends=(
  'ntfsprogs-plus: Recommended NTFS utilities'
)
options=('!strip' '!emptydirs')

source=(
  "$pkgbase::git+$url"
  'Makefile'
  'dkms.conf'
  '00-ntfsplus.conf'
  '90-udev-prefer-ntfsplus.rules'
)
sha256sums=(
  SKIP
  8f2e5d3603f70e6939df7d52d2798b2b5a1110fb4153e331a9433638d2461631
  df453137fe0182ab488154dfaccbbb1fc64846c7f2d5d3a3358f12decdbab602
  75133e4f350ee1cdc8bc96b3fea51ab720d7a5dd9c1f5392b386489de3babf70
  25f98d3070e1486d75351c38f5c2e30b4459e9e27cd5fdd45bba09eee94a684a
)

pkgver() {
  cd "$srcdir/$pkgbase"
  git log --format='%cd+%h' -n1 --date=format:'%Y.%m.%d'
}

package_ntfsplus-dkms-git() {
  pkgdesc="DKMS module for ntfs (with aliases)."
  depends=('dkms')
  optdepends+=("ntfsplus-udev: udev rules for ntfsplus")
  provides=('ntfsplus' 'ntfs' 'NTFSPLUS-MODULE' 'NTFS-MODULE')
  conflicts=('ntfsplus' 'ntfs')

  cd "$srcdir"

  local dest="$pkgdir/usr/src/ntfs-${pkgver}"
  mkdir -p "$dest"
  cp -rpt "$dest" "$srcdir/$pkgbase/"*.{h,c} "$srcdir/$pkgbase/Kconfig"
  install -Dm644 "$(readlink -f dkms.conf)" "$dest/dkms.conf"
  install -Dm644 "$(readlink -f Makefile)" "$dest/Makefile"

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
