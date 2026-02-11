# Maintainer: Aikawa Yataro <aikawayataro at protonmail dot com>
# Contributor: Tricia, `creyon` <gtcreyon@gmail.com>
# Contributor: xiliuya <xiliuya@aliyun.com>
# Contributor: Alexandre `Zopieux` Macabies <web+aur@zopieux.com>

pkgname=ffdec
pkgver=25.0.0
pkgrel=2
pkgdesc="Open Source Flash SWF decompiler and editor"
arch=('any')
url="https://github.com/jindrapetrik/jpexs-decompiler"
license=('GPL-3.0-or-later')
depends=('java-runtime>=8')
makedepends=('ant' 'java-environment>=8')
source=("ffdec-$pkgver.tar.gz::https://github.com/jindrapetrik/jpexs-decompiler/archive/refs/tags/version$pkgver.tar.gz"
        'ffdec'
        'ffdec.desktop')
b2sums=('de2b9af4efe95e85e06ea29f7c7faa3ef8c50f5f7b532b1e04a755ed2a76c6a6ec4dc62703f9a9ccc86c694d7577d493cc92af6cee6321b92d197dbb78678aad'
        'b302dde7bb57a21e501ba1bedd104d0c32994019501e92792073459b2c11268e1dcfac4d22783793fbbc839c175151632f0a8889c3b2cc44b197d8924b7327f8'
        '270b3e8285cf78fdeac1932a31d153f068e062ec8c1860796f80b58f7ac77cc42efd2633db0e11dca25565087e000a9930b37fee35cf8d75f660609a49e4830e')

prepare() {
    cd "jpexs-decompiler-version$pkgver"

    IFS='.' read -r major minor release <<< "$pkgver"
    sed -E -ie 's/(name="version.major" value=")0(")/\1'"$major"'\2/g'       build.xml
    sed -E -ie 's/(name="version.minor" value=")0(")/\1'"$minor"'\2/g'       build.xml
    sed -E -ie 's/(name="version.release" value=")0(")/\1'"$release"'\2/g'   build.xml
    sed -E -ie 's/(name="version.debug" value=")true(")/\1false\2/g'         build.xml
}

build() {
    cd "jpexs-decompiler-version$pkgver"
    ant build
}

package() {
    cd "jpexs-decompiler-version$pkgver"

    install -Dm644 "dist/ffdec.jar" -t "$pkgdir/usr/share/java/$pkgname"
    for f in lib/*.jar; do
        install -Dm644 "$f" -t "$pkgdir/usr/share/java/$pkgname/lib"
    done

    install -Dm755 "../ffdec" -t "$pkgdir/usr/bin"

    install -Dm644 "../ffdec.desktop" -t "$pkgdir/usr/share/applications"
    install -Dm644 "resources/icon.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"

    for f in lib/*.license.txt; do
        install -Dm644 "$f" -t "$pkgdir/usr/share/licenses/$pkgname"
    done
    install -Dm644 "resources/license.txt" -t "$pkgdir/usr/share/licenses/$pkgname"
}
