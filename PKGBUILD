# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Martin Wimpress <code@flexion.org>

pkgname=bip
pkgver=0.9.0rc1
_pkgver=0.9.0-rc.1
pkgrel=1
pkgdesc="Multiuser IRC proxy that supports replaying of logged conversations."
arch=('x86_64')
url="http://bip.milkypond.org/"
license=('GPL')
depends=('openssl')
source=("https://projects.duckcorp.org/attachments/download/79/bip-$_pkgver.tar.gz"
        "${pkgname}.service")
md5sums=('8c7079d51f13ce4799c750f89ebc1b41'
         'a716f77fc40573cd359d9984a9cc8a66')
install=${pkgname}.install

prepare() {
    cd ${pkgname}-${_pkgver}
    # Don't treat warnings as errors.
    sed -i 's/-Werror//g' Makefile.in
    # Make the sample configuration reflect the PKGBUILD defaults
    sed -i 's:/var/proxy/logs:/var/log/bip:' samples/$pkgname.conf
}

build() {
    cd ${pkgname}-${_pkgver}
    ./configure \
        --prefix=/usr
    make
}

package() {
    cd ${pkgname}-${_pkgver}
    make DESTDIR="${pkgdir}" install
    install -D -m755 ${srcdir}/${pkgname}-${_pkgver}/scripts/bipgenconfig "${pkgdir}"/usr/bin/bipgenconfig
    install -D -m644 ${srcdir}/${pkgname}-${_pkgver}/samples/$pkgname.conf "${pkgdir}"/usr/share/$pkgname/$pkgname.conf.sample
    install -D -m644 ${srcdir}/${pkgname}-${_pkgver}/samples/$pkgname.vim "${pkgdir}"/usr/share/vim/syntax/$pkgname.vim
    install -D -m 0644 ${srcdir}/${pkgname}.service "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
}
