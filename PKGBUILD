# Maintainer: archplayer
# Contributor: RemiliaForever <remilia AT koumakan DOT cc>
# Contributor: Felix Yan <felixonmars@gmail.com>
# Contributor: Christoph Drexler <chrdr at gmx dot at>
# Contributor: Jelle van der Waa <jellevdwaa@gmail.com>

GTK_VERSION=3
JAVA_VERSION=8
# JAVA_PATH='/usr/lib/jvm/default-runtime/bin/java'

pkgname=xmind
pkgver=3.7.9+8update9
pkgrel=1
pkgdesc="Brainstorming and Mind Mapping Software"
arch=('x86_64')
url="https://www.xmind.net"
license=('EPL' 'LGPL')
depends=('java-runtime>=8')
optdepends=(
    'gtk2: gtk2 or gtk3 must be installed'
    'gtk3: gtk2 or gtk3 must be installed'
    'lame: needed for audio notes'
)
provides=("$pkgname")
install=xmind.install
source=(
    "https://www.xmind.net/xmind/downloads/$pkgname-8-update9-linux.zip"
    'XMind'
    'xmind.desktop'
    'xmind.xml'
    'xmind.png'
    'xmind_file.png'
)
sha256sums=(
    '835f7eaa93e2b7d52f44f02324089363ed65a61e0713e01652871143becb070e'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
)

package() {
    mkdir -p ${pkgdir}/usr/share/${pkgname}
    cp -r ${srcdir}/XMind_amd64   ${pkgdir}/usr/share/${pkgname}/XMind
    cp -r ${srcdir}/configuration ${pkgdir}/usr/share/${pkgname}/
    cp -r ${srcdir}/features      ${pkgdir}/usr/share/${pkgname}/
    cp -r ${srcdir}/plugins       ${pkgdir}/usr/share/${pkgname}/
    cp ${srcdir}/*.xml            ${pkgdir}/usr/share/${pkgname}/

    mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
    cp ${srcdir}/{epl-v10,lgpl-3.0}.html ${pkgdir}/usr/share/licenses/${pkgname}/
    cp ${srcdir}/xpla.txt                ${pkgdir}/usr/share/licenses/${pkgname}/

    mkdir -p ${pkgdir}/usr/share/fonts/${pkgname}
    cp -r ${srcdir}/fonts ${pkgdir}/usr/share/fonts/${pkgname}/

    mkdir -p ${pkgdir}/usr/share/applications
    cp ${srcdir}/xmind.desktop ${pkgdir}/usr/share/applications/

    mkdir -p ${pkgdir}/usr/share/mime/packages
    cp ${srcdir}/xmind.xml ${pkgdir}/usr/share/mime/packages/

    mkdir -p ${pkgdir}/usr/share/pixmaps
    cp ${srcdir}/*.png ${pkgdir}/usr/share/pixmaps/

    mkdir -p ${pkgdir}/usr/bin
    cp ${srcdir}/XMind ${pkgdir}/usr/bin/

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
}
