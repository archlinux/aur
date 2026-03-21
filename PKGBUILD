# Contributor: René Hickersberger <r@renehsz.com>
# Contributor: Xiaotian Wu <yetist@gmail.com>

pkgname=libffi-static
pkgver=3.5.2
pkgrel=1
pkgdesc='Portable foreign function interface library'
arch=('x86_64')
url='https://sourceware.org/libffi/'
license=('MIT')
depends=('glibc')
checkdepends=('dejagnu')
provides=('libffi.a')
options=('!docs' '!libtool' '!emptydirs' '!strip' 'staticlibs')
source=(https://github.com/libffi/libffi/releases/download/v$pkgver/libffi-$pkgver.tar.gz)
sha256sums=('f3a3082a23b37c293a4fcd1053147b371f2ff91fa7ea1b2a52e335676bac82dc')
b2sums=('35ce590926bcdd2556c30c94bb0fef3f0cfe8f32e809ffad00eb0bc7a8ba1ba40da844b108069c87e86bff278221cc42dc7c7aacd02a7b7bc408ea054085398c')

prepare() {
  cd libffi-$pkgver
  autoreconf -fiv
}

build() {
  cd libffi-$pkgver
  ./configure \
    --prefix=/usr \
    --enable-static \
    --disable-multi-os-directory \
    --enable-exec-static-tramp \
    --enable-pax_emutramp
  make
}

check() {
  make -C libffi-$pkgver check
}

package() {
  cd libffi-$pkgver
  make DESTDIR="$pkgdir" install

  # Only install static library
  rm -rf "$pkgdir"/usr/{include,share,lib/libffi.so*,lib/pkgconfig}

  install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
  install -Dm 644 README.md -t "$pkgdir"/usr/share/doc/$pkgname
}

# vim: ts=2 sw=2 et:
