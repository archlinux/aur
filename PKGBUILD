# Maintainer: efoundation <dev [at] e -dot- email>
# Maintainer: steadfasterX <steadfasterX [at] binbash -dot- rocks>
pkgname=easy-installer
pkgver=0.18
pkgrel=1
pkgdesc="The Easy Installer is a desktop application which helps users install Android /e/ (https://doc.e.foundation/what-s-e) on supported devices."
arch=('x86_64')
url="https://gitlab.e.foundation/e/tools/${pkgname}"
license=('GPL3')
depends=()
makedepends=('git' 'gradle' 'java-runtime-common' 'ruby-ronn')
optdepends=()
backup=()
source=("${pkgname}-${pkgver}::git+https://gitlab.e.foundation/e/tools/${pkgname}.git#tag=v${pkgver}"
        "${pkgname}.8.md")
md5sums=('SKIP'
         'bc6e92b53daabcee25e57904b3eb1bb6')
BINFIX=usr/local/bin
MANDIR=usr/share/man
MAN8DIR=${MANDIR}/man8
MAN8PAGE=${pkgname}.8

build(){
    cd "$pkgname-$pkgver"
    export JAVA_HOME="$(pwd)/buildSrc/linux/jdk-11.0.2/"
    [ ! -d $JAVA_HOME ] && echo "ERROR: $JAVA_HOME does not exist" && exit 3
    ./gradlew dist
}
package(){
    install -d -m 755 $pkgdir/opt/
    install -d -m 755 $pkgdir/usr/local/bin
    install -d -m 755 $pkgdir/usr/share/applications
    install -d -m 755 $pkgdir/${MAN8DIR}
    
    cp -a $pkgname-$pkgver/build/image/easy-installer-linux-x64 $pkgdir/opt/${pkgname}
    cat > $pkgdir/$BINFIX/${pkgname} << _EOB
#!/bin/bash
####################################
# the binary itself gets its working directory path from
# $0 so a symlink wouldn't work
/opt/${pkgname}/bin/easy-installer
_EOB
    chmod 755 $pkgdir/$BINFIX/${pkgname}
    cat > $pkgdir/usr/share/applications/e.foundation.${pkgname}.desktop << _EOD
[Desktop Entry]
Name=Easy Installer for /e/
Exec=/opt/${pkgname}/bin/${pkgname}
Icon=/opt/${pkgname}/${pkgname}.png
Terminal=false
Type=Application
StartupNotify=false
_EOD
    chmod 755 $pkgdir/usr/share/applications/e.foundation.${pkgname}.desktop

    install -D -m644 $pkgname-$pkgver/snap/gui/${pkgname}.png $pkgdir/opt/${pkgname}/
    install -D -m644 $pkgname-$pkgver/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    ronn -r --pipe ../${MAN8PAGE}.md > $pkgdir/${MAN8DIR}/${MAN8PAGE}
}
