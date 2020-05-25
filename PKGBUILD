# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Mikael Eriksson <mikael_eriksson@miffe.org>

pkgname=libjpeg6-turbo
pkgver=1.5.3
pkgrel=2
pkgdesc='libjpeg derivative with accelerated baseline JPEG compression and decompression'
arch=('x86_64')
url="https://libjpeg-turbo.org/"
license=('BSD')
depends=('glibc')
makedepends=('nasm')
provides=('libjpeg6')
conflicts=('libjpeg6')
source=("https://downloads.sourceforge.net/project/libjpeg-turbo/${pkgver}/libjpeg-turbo-${pkgver}.tar.gz"{,.sig})
validpgpkeys=('7D6293CC6378786E1B5C496885C7044E033FDE16') # libjpeg-turbo
sha256sums=('b24890e2bb46e12e72a79f7e965f409f4e16466d00e1dd15d93d73ee6b592523'
            'SKIP')

build() {
  cd libjpeg-turbo-${pkgver}

  ./configure \
    --prefix='/usr' \
    --mandir='/usr/share/man' \
    --without-simd \
    --with-build-date="$(date --utc --date="@${SOURCE_DATE_EPOCH:-$(date +%s)}" +%Y%m%d)"
  make
}

check() {
  cd libjpeg-turbo-${pkgver}
  make test
}

package() {
  cd libjpeg-turbo-${pkgver}

  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{bin,include,lib/pkgconfig,share}
  rm "${pkgdir}"/usr/lib/lib{jpeg.{a,so},turbojpeg.{a,so*}}

  install -Dm 644 LICENSE.md -t "${pkgdir}"/usr/share/licenses/libjpeg6-turbo/
}

# vim: ts=2 sw=2 et:
