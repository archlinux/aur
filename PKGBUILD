# Maintainer: Edoardo Rosa <edoardo dot rosa90 at gmail dot com>

# RegRipper
pkgname=regripper-git
pkgver=r15.9f2a96a
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
            'b1c590c5ec4e42fb920f7d4089c8acac7cda6d4dbef265ca78ba7bfff4d5118c')

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
