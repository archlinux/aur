# Maintainer: Thor M. K. Høgås <thor alfakrøll roht dott no>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: AndreasBWagner <AndreasBWagner@pointfree.net>
# Contributor: Mark Taylor <skymt0@gmail.com>

pkgname=programmers-dvorak
pkgver=1.2
_linuxrel=1
_pkgver=${pkgver//./_}_$_linuxrel
pkgrel=6
pkgdesc='Variant of the Dvorak keyboard layout designed for programmers'
arch=(any)
url='http://www.kaufmann.no/roland/dvorak/'
license=('custom')
install=programmers-dvorak.install
depends=('libxslt')
source=("http://www.kaufmann.no/downloads/linux/kbddvp-$_pkgver-src-linux.tgz"
        "http://www.kaufmann.no/downloads/linux/dvp-$_pkgver.map.gz"
        'LICENSE')
noextract=("${source[1]##*/}")
sha256sums=('0f56b55432d63a6d81c08ff5f722cf48c6d9a15c34c304f594d02eb2223fc4fa'
            '0e859211cfe16a18a3b9cbf2ca3e280a23a79b4e40b60d8d01d0fde7336b6d50'
            '123675c594fe0349a7c27b124cf03715d293af60047d1916c657ac25d0f86ce8')

prepare() {
  cd "kbddvp-$pkgver"
  # Upstream install script makes too many assumptions about the host system:
  # directories existing, being root, etc. We'll make our own way...
  rm dvp.install.sh
}

package() {
  cd "kbddvp-$pkgver"
  install -Dm755 -t "$pkgdir/usr/share/$pkgname/" dvp.*.sh
  install -Dm644 "../${source[1]##*/}" "$pkgdir/usr/share/kbd/keymaps/i386/dvorak/dvp.map.gz"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" "../${source[2]}"
  # Adapt relevant system installation bits from dvp.install.sh...
  for f in dvp hex atm 102 ops semi; do
    install -Dm644 $f.xkb "$pkgdir/usr/share/X11/xkb/symbols/$f"
  done
  install -Dm644 shift3.xkb "$pkgdir/usr/share/X11/xkb/types/shift3"
}

