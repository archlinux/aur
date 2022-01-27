# Maintainer: Yardena Cohen <yardenack at gmail dot com>

gitname=alpine
pkgname=$gitname-git
pkgver=2.25.1.637.9a7f844
pkgrel=1
pkgdesc="Fork of the PINE mail client (git)"
arch=(i686 x86_64 aarch64)
url='http://alpine.x10host.com/'
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

    # we recently went
    # from 2.21.204.5117359
    # to   2.21.1.209.a9d7a00
    # which rightfully confused pacman's version ordering
    # so let's add a .0 to versions with only one dot
    local v=$(cat VERSION)
    [[ "$v" =~ ^[^\.]+\.[^\.]+\..*$ ]] || v=$v.0

    local ver="${v}.$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
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
