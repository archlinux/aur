# Maintainer: Edoardo Rosa <edoardo dot rosa90 at gmail dot com>

# RegRipper
pkgname=regripper-git
pkgver=r60.5d104c4
pkgrel=2
pkgdesc="RegRipper is an open source forensic software used as a Windows Registry data extraction command line or GUI tool."
arch=('any')
url="https://github.com/keydet89/RegRipper3.0"
depends=('perl' 'perl-parse-registry')
makedepends=('git')
options=('!emptydirs')
source=("$pkgname::git+https://github.com/keydet89/RegRipper3.0"
        "patch.diff")
sha256sums=('SKIP'
            '36a64f4887cd71da9b01956b3c3c4574a3b77164914a660aea44e002a8a79a04')

pkgver() {
  cd "$pkgname"
  (set -o pipefail
   git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
   printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)")
}

build() {
  patch -o "$pkgname/regripper" "$pkgname/rip.pl" < patch.diff
  cd "$pkgname"
  ## Clean windows ^M new lines
  sed -i $'s/\r$//' regripper
}

package() {
  install -p -dm 755 "$pkgdir/usr/bin/"
  install -p -m 755 "$pkgname/regripper" "$pkgdir/usr/bin/"

  install -p -dm 755 "$pkgdir/usr/share/regripper/plugins/"
  install -p -m 755 "$pkgname/plugins/"* "$pkgdir/usr/share/regripper/plugins/"
}
