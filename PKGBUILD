# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Thomas Flucke <tflucke@protonmail.com>
pkgname=magicseteditor-genevensis-fork-git
pkgver=2.5.0
pkgrel=1
epoch=
pkgdesc="The premier open-source desktop environment for building, managing, and rendering custom trading card expansions."
arch=("x86_64" "i686")
url="https://magicseteditor.com/"
license=('GPL-2.0-only')
groups=()
depends=(wxwidgets-gtk3 hunspell glibc libgcc wxwidgets-common libstdc++)
makedepends=(git cmake gendesk boost)
checkdepends=()
optdepends=()
provides=(magicseteditor)
conflicts=(magicseteditor)
replaces=()
backup=()
options=()
install=
changelog=
source=("${pkgname}-${pkgver}.tar.gz::https://codeload.github.com/G-e-n-e-v-e-n-s-i-S/MagicSetEditor2/tar.gz/refs/tags/v$pkgver")
noextract=()
sha256sums=('178e40bbf3fa36a77f523303314b7b46368883c7e5f20d7627a7cfd33ebd10d9')
validpgpkeys=()

prepare() {
	cd "MagicSetEditor2-$pkgver"
    gendesk -n -f --pkgname="$pkgname" --pkgdesc="A program to help create Magic: the Gathering cards and sets." --exec="magicseteditor"
}

build() {
	cd "MagicSetEditor2-$pkgver"
    [ -d build ] || mkdir build
    cmake -B build -DwxWidgets_CONFIG_EXECUTABLE:FILEPATH="/usr/bin/wx-config" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX='/usr'
    cmake --build "build"
}

package() {
	cd "MagicSetEditor2-$pkgver"
	install -Dm755 "$pkgname.desktop" "${pkgdir}/usr/share/applications/$pkgname.desktop"
    install -Dm755 "./build/magicseteditor" "${pkgdir}/usr/bin/magicseteditor"
	mkdir -p $pkgdir/usr/share/magicseteditor/{resource,data}
	cp -r data/*.mse-locale "${pkgdir}/usr/share/magicseteditor/data"
	cp -r resource/* "${pkgdir}/usr/share/magicseteditor/resource"
    # The readme says to put fonts here but there does not seem to be any fonts?
    # cp -r fonts/* "${pkgdir}/usr/local/share/fonts/"
	install -Dm755 "resource/installer_program.png" "${pkgdir}/usr/share/pixmaps/MagicSetEditor2.png"
}
