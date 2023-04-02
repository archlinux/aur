# Maintainer: Mikata Riko <sanbikappa@qq.com>
_PkgName=LabelPlusFX
pkgname=labelplusfx
pkgver=2.3.3
pkgrel=2
epoch=
pkgdesc="Easy tool for comic translation."
arch=(x86_64)
url="https://github.com/Meodinger/LabelPlusFX"
license=('AGPL3')
depends=('jre17-openjdk' 'gsettings-desktop-schemas')
makedepends=('jdk17-openjdk' 'maven' 'dos2unix')
checkdepends=()
optdepends=('ttf-arphic-uming: ttf CJK support')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(
            "$pkgname-$pkgver.tar.gz::https://github.com/Meodinger/$_PkgName/archive/refs/tags/v$pkgver.tar.gz"
            "labelplusfx-2.3.3.patch"
            "labelplusfx"
        )
noextract=()
md5sums=(
            0fb11e8a37c9baacb3e32d02e56c7233
            SKIP
            SKIP
        )
validpgpkeys=()

prepare() {
    cd "$_PkgName-$pkgver"
    # DialogSettings.kt contains CRLF, need to convert it to UNIX format before patch it.
    dos2unix 'src/main/kotlin/ink/meodinger/lpfx/component/properties/DialogSettings.kt'
    # patch the package
	patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"

}

build() {
    cd "$_PkgName-$pkgver"
    mvn package -X

}

package() {
    cd "$_PkgName-$pkgver"

    install -vdm755 "$pkgdir"/opt/labelplusfx/runtime
    install -vm644 'CHANGELOG' "$pkgdir"/opt/labelplusfx/
    install -vm644 'LICENSE' "$pkgdir"/opt/labelplusfx/
    install -vm644 'README.md' "$pkgdir"/opt/labelplusfx/
    mv -v 'target/build'/* "$pkgdir"/opt/labelplusfx/runtime
    ln -sf lpfx-"$pkgver".jar "$pkgdir"/opt/labelplusfx/runtime/labelplusfx.jar

    install -vDm755 "$srcdir"/labelplusfx "$pkgdir"/usr/bin/labelplusfx
    rm -v "$srcdir"/labelplusfx*
}
