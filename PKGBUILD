# Maintainer: kevku <kevku@gmx.com>
pkgname=megabasterd-git
pkgver=7.74.r2.77542e971
pkgrel=1
pkgdesc="MEGA.nz downloader/uploader/streaming suite"
arch=("any")
url="https://github.com/tonikelope/megabasterd"
license=('GPL3')
depends=('java-runtime' 'bash')
makedepends=('maven' 'git' 'java-environment')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" "megabasterd-bin")
source=("$pkgname::git+https://github.com/tonikelope/megabasterd.git"
        "${pkgname%%-git}.sh"
        "${pkgname%%-git}.desktop")
sha256sums=('SKIP'
            '67711d7ef6fb46d6da0ad6e770dcd3dc778380f37f9b356af3cddc0a075fc3f0'
            'a85b49dab7f58ab3c3b3e609a1c3c8e0fab2bedf5597a179aae82773681e7753')

pkgver() {
    cd "$srcdir/${pkgname}"
    printf "%s" "$(git describe --tags --long | sed 's/v\([^\.]\)/\1/g;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
    cd "$srcdir/${pkgname}"
    mvn clean package -Dmaven.repo.local="$srcdir/maven-cache"
}

package() {
    cd "$srcdir/${pkgname}"
    mkdir -p "$pkgdir/usr/share/java/${pkgname%-git}"
    find ./target -name \*jar-with-dependencies.jar -type f -print0 | xargs -I jarfile -0 install -Dm644 jarfile "$pkgdir/usr/share/java/${pkgname%-git}/${pkgname%-git}.jar"
    install -Dm755 "$srcdir/${pkgname%-git}.sh" "$pkgdir/usr/bin/${pkgname%-git}"
    install -Dm644 "src/main/resources/images/pica_roja_big.png" "$pkgdir/usr/share/pixmaps/${pkgname%-git}.png"
    install -Dm644 "$srcdir/${pkgname%-git}.desktop" "$pkgdir/usr/share/applications/${pkgname%-git}.desktop"
}
