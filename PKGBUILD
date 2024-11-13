# Maintainer: alstruit <alsturit at gmail.com>
# Contributor: Edgar Luque <git@edgarluque.com>
pkgname=digital
pkgver=0.31
pkgrel=5
pkgdesc="A digital logic designer and circuit simulator."
arch=('x86_64')
url="https://github.com/hneemann/Digital"
license=('GPL-3.0-or-later')
makedepends=('git' 'maven' 'ttf-font')
depends=('fontconfig' 'java-runtime')
source=("$pkgname::git+https://github.com/hneemann/Digital.git")
sha256sums=("SKIP")

build() {
    cd "${srcdir}/${pkgname}"

    git checkout v${pkgver%%r*} 2>/dev/null

    mvn package
}

package() {
    cd "${srcdir}/${pkgname}/"

    install -vDm644 "target/${pkgname^}.jar" "$pkgdir/usr/share/java/$pkgname/$pkgname.jar"

    #Point exe to jar
    sed -e  "s,DIR=.*,DIR=/usr/share/java/${pkgname},g" \
        -e  "s,${pkgname^}.jar,${pkgname}.jar,g" \
        -i  "distribution/linux/${pkgname^}.sh"

    #Generate .desktop
    sed -e  "s,<EXEC_LOCATION>,${pkgname},g" \
        -e  "s,<ICON_LOCATION>,${pkgname},g" "distribution/linux/desktop.template" > "distribution/linux/${pkgname}.desktop"

    install -vDm644 "distribution/ReleaseNotes.txt" "$pkgdir/usr/share/doc/$pkgname/changelog.txt"
    install -vDm644 "distribution/linux/${pkgname}-simulator.xml" "$pkgdir/usr/share/mime/packages/${pkgname}-simulator.xml"
    install -vDm644 "distribution/linux/${pkgname}.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -vDm755 "distribution/linux/${pkgname^}.sh" "$pkgdir/usr/bin/$pkgname"
    install -vDm644 "src/main/svg/icon.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
}
