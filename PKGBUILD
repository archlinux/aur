# Maintainer: José Luis Lafuente <jl@lafuente.me>
# Original maintainer: Michael Louis Thaler <michael.louis.thaler@gmail.com>
pkgname=watchman
pkgver=4.7.0
pkgrel=0
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

sha256sums=('77c7174c59d6be5e17382e414db4907a298ca187747c7fcb2ceb44da3962c6bf'
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
