# Maintainer: William Gathoye <william + aur at gathoye dot be>
# Maintainer: Corey Richardson <corey at octayn dot net>

pkgname=asciidocfx
pkgver=1.5.5
pkgrel=1
pkgdesc="Asciidoc Editor and Toolchain written with JavaFX 8"
arch=('any')

url="http://asciidocfx.com/"
license=('Apache')

makedepends=('maven>=3.3.9' 'java-environment-openjdk=8' 'gendesk')
depends=('java-environment=8' 'java-openjfx>=8.u76')

source=(
    "https://github.com/asciidocfx/AsciidocFX/archive/v$pkgver.tar.gz"
    'https://cdn.rawgit.com/asciidocfx/AsciidocFX/ea3c14d4b2d03ce94b93b7dce0985c5c5bbc4206/src/main/resources/logo.png'
    'asciidocfx')
sha512sums=(
'26d6e0255d47327fa6323f09abddfd0e237d75a1339672ec907c36bb2c2305a8a963d218da10a4b38e1aaf740188ad97c5142c7dcf6524c0e9aae90692c46717'
'71e7a0598000a0574b9edbfddf70d9c4ab2c6930aadc8e6256fc4d18ded0757e0ab9f2411da8b26a5ecff1505c6e0ece0ee9b80a73a4c130ccba45331a112fac'
'338ee0d004724d5eef8cd44fe7f6d89bb4d48b37143240d4d65258ab4c571f9e931821d9bf52a64c87b6e83165bb9c571541bc4142c73485bcdcc105de0f1ea7'
)

prepare() {

    # Generate a desktop entry
    # -f: forces and overrides the file if any
    # -n: do not download an icon
    # This tool assumes the icon has the same name as pkgname.
    # For categories see https://standards.freedesktop.org/menu-spec/latest/apa.html
    gendesk -f -n \
        --pkgname "$pkgname" \
        --pkgdesc "$pkgdesc" \
        --name "AsciidocFX" \
        --exec "/usr/bin/asciidocfx" \
        --categories "Development;Office;WordProcessor;TextTools;ComputerScience;Documentation;Java"
}

build() {
    cd "AsciidocFX-$pkgver"

    # "install" seemingly means "build and ready for installation"
    mvn clean install
}

package() {
    cd "AsciidocFX-$pkgver"

    install -dm755 "$pkgdir/usr/share/java/asciidocfx"
    install -dm755 "$pkgdir/usr/bin"
    mv -t "$pkgdir/usr/share/java/asciidocfx" target/appassembler/{conf,lib}
    install -m755 ../asciidocfx "$pkgdir/usr/bin/asciidocfx"

    install -Dm644 ../$pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -Dm644 "../logo.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
