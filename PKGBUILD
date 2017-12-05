# $Id: PKGBUILD 184754 2016-08-01 15:30:30Z felixonmars $
# Maintainer: RemiliaForever <remilia AT koumakan DOT cc>
# Contributor: Felix Yan <felixonmars@gmail.com>
# Contributor: Christoph Drexler <chrdr at gmx dot at>
# Contributor: Jelle van der Waa <jellevdwaa@gmail.com>

# GTK_VERSION 2/3
GTK_VERSION=3
# JAVA_VERSION 8/9
JAVA_VERSION=8

pkgname=xmind
pkgver=3.7.6
_filename=$pkgname-8-update6-linux
pkgrel=1
pkgdesc="Brainstorming and Mind Mapping Software"
arch=('i686' 'x86_64')
url="http://www.xmind.net"
license=('EPL' 'LGPL')
depends=('java-runtime>=8')
optdepends=('gtk2: gtk2 or gtk3 must install one'
            'gtk3: gtk2 or gtk3 must install one'
            'lame: needed for the feature audio notes')
install='xmind.install'
source=("http://www.xmind.net/xmind/downloads/${_filename}.zip"
'XMind'
'XMind.ini'
'XMind.desktop'
'XMind.png')
sha512sums=('0e4871a385c8449da000ee3bcf1a44fe63075af4f592f43a01635e017ab253a996739c63f9c71f098529adf62b5df4018440c7db1c44040488c0e3186abe6248'
'SKIP'
'SKIP'
'SKIP'
'SKIP')

package() {
    mkdir -p ${pkgdir}/usr/share/${pkgname}
    cp -r ${srcdir}/configuration   ${pkgdir}/usr/share/${pkgname}/
    cp -r ${srcdir}/features        ${pkgdir}/usr/share/${pkgname}/
    cp -r ${srcdir}/plugins         ${pkgdir}/usr/share/${pkgname}/
    cp ${srcdir}/*.html              ${pkgdir}/usr/share/${pkgname}/
    cp ${srcdir}/*.xml              ${pkgdir}/usr/share/${pkgname}/
    cp ${srcdir}/*.txt              ${pkgdir}/usr/share/${pkgname}/
    if [[ "$CARCH" == "i686" ]]; then
        cp -r ${srcdir}/XMind_i386  ${pkgdir}/usr/share/${pkgname}/XMind
    else
        cp -r ${srcdir}/XMind_amd64 ${pkgdir}/usr/share/${pkgname}/XMind
    fi
    mkdir -p ${pkgdir}/usr/share/fonts/${pkgname}
    cp -r ${srcdir}/fonts           ${pkgdir}/usr/share/fonts/${pkgname}/
    mkdir -p ${pkgdir}/usr/share/applications
    cp ${srcdir}/XMind.desktop      ${pkgdir}/usr/share/applications/
    mkdir -p ${pkgdir}/usr/share/pixmaps
    cp ${srcdir}/XMind.png          ${pkgdir}/usr/share/pixmaps/
    # fix configuration
    cp ${srcdir}/XMind.ini ${pkgdir}/usr/share/${pkgname}/XMind/
    if [[ "$CARCH" == "i686" ]]; then
        sed -i "s/CARCH/x86/g" ${pkgdir}/usr/share/${pkgname}/XMind/XMind.ini
    else
        sed -i "s/CARCH/x86_64/g" ${pkgdir}/usr/share/${pkgname}/XMind/XMind.ini
    fi
    if [[ "$GTK_VERSION" == "2" ]]; then
        sed -i "s/GTK_VERSION/2/g" ${pkgdir}/usr/share/${pkgname}/XMind/XMind.ini
    else
        sed -i "s/GTK_VERSION/3/g" ${pkgdir}/usr/share/${pkgname}/XMind/XMind.ini
    fi
    if [[ "$JAVA_VERSION" == "8" ]]; then
        sed -i "s/JAVA_VERSION//g" ${pkgdir}/usr/share/${pkgname}/XMind/XMind.ini
    else
        sed -i "s/JAVA_VERSION/--add-modules=java.se.ee/g" ${pkgdir}/usr/share/${pkgname}/XMind/XMind.ini
    fi
    mkdir -p ${pkgdir}/usr/bin
    cp ${srcdir}/XMind ${pkgdir}/usr/bin/
}
