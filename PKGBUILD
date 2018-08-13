# $Id: PKGBUILD 184754 2016-08-01 15:30:30Z felixonmars $
# Maintainer: RemiliaForever <remilia AT koumakan DOT cc>
# Contributor: Felix Yan <felixonmars@gmail.com>
# Contributor: Christoph Drexler <chrdr at gmx dot at>
# Contributor: Jelle van der Waa <jellevdwaa@gmail.com>

# GTK_VERSION 2/3
GTK_VERSION=3
# JAVA_VERSION 8/10
JAVA_VERSION=10
# JAVA_PATH
#JAVA_PATH='/usr/lib/jvm/default-runtime/bin/java'

pkgname=xmind
pkgver=3.7.8+8update8
_filename=$pkgname-8-update8-linux
pkgrel=1
pkgdesc="Brainstorming and Mind Mapping Software"
arch=('i686' 'x86_64')
url="http://www.xmind.net"
license=('EPL' 'LGPL')
depends=('java-runtime>=8')
optdepends=('gtk2: gtk2 or gtk3 must install one'
            'gtk3: gtk2 or gtk3 must install one'
            'lame: needed for the feature audio notes')
install=xmind.install
source=("http://www.xmind.net/xmind/downloads/${_filename}.zip"
'XMind'
'xmind.desktop'
'xmind.xml'
'xmind.png'
'xmind_file.png')
sha512sums=('77c5c05801f3ad3c0bf5550fa20c406f64f3f5fa31321a53786ac1939053f5c4f0d0fb8ab1af0a9b574e3950342325b9c32cf2e9a11bf00a1d74d2be1df75768'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP')

package() {
    mkdir -p ${pkgdir}/usr/share/${pkgname}
    cp -r ${srcdir}/configuration   ${pkgdir}/usr/share/${pkgname}/
    cp -r ${srcdir}/features        ${pkgdir}/usr/share/${pkgname}/
    cp -r ${srcdir}/plugins         ${pkgdir}/usr/share/${pkgname}/
    cp ${srcdir}/*.xml              ${pkgdir}/usr/share/${pkgname}/
    mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
    cp ${srcdir}/{epl-v10,lgpl-3.0}.html    ${pkgdir}/usr/share/licenses/${pkgname}/
    cp ${srcdir}/xpla.txt                   ${pkgdir}/usr/share/licenses/${pkgname}/
    if [[ "$CARCH" == "i686" ]]; then
        cp -r ${srcdir}/XMind_i386  ${pkgdir}/usr/share/${pkgname}/XMind
    else
        cp -r ${srcdir}/XMind_amd64 ${pkgdir}/usr/share/${pkgname}/XMind
    fi
    mkdir -p ${pkgdir}/usr/share/fonts/${pkgname}
    cp -r ${srcdir}/fonts           ${pkgdir}/usr/share/fonts/${pkgname}/
    mkdir -p ${pkgdir}/usr/share/applications
    cp ${srcdir}/xmind.desktop      ${pkgdir}/usr/share/applications/
    mkdir -p ${pkgdir}/usr/share/mime/packages
    cp ${srcdir}/xmind.xml          ${pkgdir}/usr/share/mime/packages/
    mkdir -p ${pkgdir}/usr/share/pixmaps
    cp ${srcdir}/*.png              ${pkgdir}/usr/share/pixmaps/
    # fix configuration
    sed -i "s|^./configuration$|@user.home/.xmind/configuration|" ${pkgdir}/usr/share/${pkgname}/XMind/XMind.ini
    sed -i "s|^../workspace$|@user.home/.xmind/workspace|" ${pkgdir}/usr/share/${pkgname}/XMind/XMind.ini
    if [[ "$GTK_VERSION" != "2" ]]; then
        sed -i "s|^2$|3|" ${pkgdir}/usr/share/${pkgname}/XMind/XMind.ini
    fi
    if [[ "$JAVA_VERSION" != "8" ]]; then
        echo "--add-modules=java.se.ee" >> ${pkgdir}/usr/share/${pkgname}/XMind/XMind.ini
    fi
    if [[ "$JAVA_PATH" != "" ]]; then
        sed -i "s|^-vmargs$|-vm\n${JAVA_PATH}\n-vmargs|" ${pkgdir}/usr/share/${pkgname}/XMind/XMind.ini
    fi
    mkdir -p ${pkgdir}/usr/bin
    cp ${srcdir}/XMind              ${pkgdir}/usr/bin/
}
