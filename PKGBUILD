# Maintainer: Yardena Cohen <yardenack at gmail dot com>

gitname=alpine
pkgname=$gitname-git
pkgver=2.20.999.202.6278103
pkgrel=1
pkgdesc="Fork of the PINE mail client (git)"
arch=('i686' 'x86_64')
url='http://patches.freeiz.com/alpine/'
license=('APACHE')
depends=(
    'gettext'
    'krb5'
    'libldap'
    'pam'
)
makedepends=('git')
provides=('alpine' 'pine' 're-alpine')
conflicts=('alpine' 'pine' 're-alpine')
replaces=('alpine' 'pine' 're-alpine')
source=("git+http://repo.or.cz/${gitname}.git")
sha512sums=('SKIP')

pkgver() {
   cd "${srcdir}/${gitname}"
   local ver="$(cat VERSION).$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
   printf "%s" "${ver//-/.}"
}
build() {
   cd "${srcdir}/${gitname}"
   LIBS+="-lpam -lkrb5 -lcrypto" ./configure --prefix=/usr \
        --without-passfile --without-tcl --disable-shared \
        --with-system-pinerc=/etc/${pkgname}.d/pine.conf \
        --with-system-fixed-pinerc=/etc/${pkgname}.d/pine.conf.fixed
  make
}
package() {
   cd "${srcdir}/${gitname}"
   make DESTDIR="${pkgdir}" install
}
