# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Térence Clastres <t.clastres@gmail.com>

pkgname=libglvnd-glesv2
_pkgname=${pkgname/-glesv2}
pkgver=1.1.1
pkgrel=2
pkgdesc="The GL Vendor-Neutral Dispatch library patched to add glesv2 and other pkgconfig data removed from mesa 19.1"
arch=('x86_64')
url="https://github.com/NVIDIA/libglvnd"
license=('custom:BSD-like')
depends=('mesa>=19.1')
makedepends=('libxext' 'libx11' 'glproto' 'python')
provides=('libglvnd' 'libgl' 'libegl' 'libgles')
conflicts=('libglvnd')
source=("$pkgname-$pkgver.tar.gz::https://github.com/NVIDIA/libglvnd/archive/v$pkgver.tar.gz"
        Add-pkgconfig-data-for-libraries-implemented-so-far.patch
        LICENSE)
sha512sums=('f64a481be002b108bc45147f9ecddc97561d09b15dd2fee82e76642f8d298f5b21458042dea3083ade650181d5f937bf550bba2914fbf46a774990abdbc56883'
            'ff685ebc716c13d169202fb8ada979c7f5121e3106897886777e8b54ea5fc35358389412bfcc398a4304463108676c3ed295f905ea8c2dedd3d9145ac2b505af'
            'bf0f4a7e04220a407400f89226ecc1f798cc43035f2538cc8860e5088e1f84140baf0d4b0b28f66e4b802d4d6925769a1297c24e1ba39c1c093902b2931781a5')

build() {
  cd $_pkgname-$pkgver

  # https://bugs.freedesktop.org/show_bug.cgi?id=110141
  patch -Np1 < "$srcdir"/Add-pkgconfig-data-for-libraries-implemented-so-far.patch

  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  # libglvnd needs mesa for indirect rendering
  depends=('libxext' 'mesa' 'opengl-driver')

  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" install

  install -Dm644 ../LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
