# Maintainer: José Luis Lafuente <jl@lafuente.me>
# Original maintainer: Michael Louis Thaler <michael.louis.thaler@gmail.com>
pkgname=watchman
pkgver=4.2.0
pkgrel=2
pkgdesc="An inotify-based file watching and job triggering command line utility"
url="https://facebook.github.io/watchman/"
arch=('x86_64' 'i686')
license=('Apache')
depends=('pcre')
optdepends=()
makedepends=('glibc')
conflicts=()
replaces=()
backup=()
install=$pkgname.install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/facebook/watchman/archive/v${pkgver}.tar.gz"
        "${pkgname}.tmpfiles")

sha256sums=('d8998df9795951d49dce9df82da11eeba384934d5d9d3f0ea2d543a9837e2ddb'
            '2b061865e10578a0477b9c7991a00594bc839c846b98896e93c75743dbf6a379')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./autogen.sh
  ./configure --prefix= --exec-prefix=/usr --localstatedir=/run/${pkgname} --without-python
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  # Docs only online, see https://github.com/facebook/watchman/issues/30
  make DESTDIR="${pkgdir}" install-binPROGRAMS
  install -dm 755 "${pkgdir}"/usr/lib/tmpfiles.d
  install -m 644 "../${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
}

# vim:set ts=2 sw=2 et:
