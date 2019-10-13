# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Térence Clastres <t.clastres@gmail.com>

pkgname=libglvnd-glesv2
_pkgname=${pkgname/-glesv2}
pkgver=1.2.0
pkgrel=1
pkgdesc="The GL Vendor-Neutral Dispatch library patched to add glesv2 and other pkgconfig data removed from mesa 19.1"
arch=('x86_64')
url="https://github.com/NVIDIA/libglvnd"
license=('custom:BSD-like')
depends=('mesa>=19.1')
makedepends=('libxext' 'libx11' 'glproto' 'python')
provides=('libglvnd' 'libgl' 'libegl' 'libgles')
conflicts=('libglvnd')
source=("$pkgname-$pkgver.tar.gz::https://github.com/NVIDIA/libglvnd/archive/v$pkgver.tar.gz"
        LICENSE)
sha512sums=('0e0e9c3f303739c73f5bee4c2aaef9eff56440345f2f1ce285ee98eb94c1e5e740774dd501aeeed1299aa25a449d813a850e95282999a3ca4648d2381d6c8fa6'
            '368b3392d17169efdc3d85b26b418026c4a42aa1ce95779fe763adb96e750e17e61c99f97e99831068e55a126f3279adda9bf70025783e61d7aaa60d37dbe808'
            'bf0f4a7e04220a407400f89226ecc1f798cc43035f2538cc8860e5088e1f84140baf0d4b0b28f66e4b802d4d6925769a1297c24e1ba39c1c093902b2931781a5')

build() {
  cd $_pkgname-$pkgver

  ./autogen.sh
  ./configure --prefix=/usr \
    # --disable-headers
  make
}

package() {
  # libglvnd needs mesa for indirect rendering
  depends=('libxext' 'mesa' 'opengl-driver')

  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" install

  install -Dm644 ../LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

  # FS#64044
  rm "$pkgdir"/usr/lib/pkgconfig/glesv1*
  rm "$pkgdir"/usr/lib/libGLESv1*
}
