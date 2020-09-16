# Maintainer: Tiberiu Telcean <tiberiu.telcean@gmail.com>

pkgbase=open-supaplex
pkgname=open-supaplex
pkgver=7.1.2
pkgrel=2
pkgdesc="Supaplex is a game released in the early nineties. OpenSupaplex is a 1:1 reimplementation of the original game in C and SDL"
url="https://www.github.com/sergiou87/open-supaplex"
license=('GPL3')
depends=(sdl2 sdl2_gfx sdl2_mixer)
source=(
    "https://github.com/sergiou87/open-supaplex/archive/v${pkgver}.zip"
)
noextract=("v${pkgver}.zip")
sha1sums=(
    "4817eaebfb50452763466dfec8d14898aa2095db"
)
arch=('x86_64')

prepare() {
    unzip v${pkgver}.zip
    cp open-supaplex-${pkgver}/* $srcdir -r
    desktop-file-validate ../open-supaplex.desktop && cp ../open-supaplex.desktop $srcdir/
    cd $srcdir/linux
    sed "s/^CFLAGS.*\$/& -DFILE_FHS_XDG_DIRS -DFILE_DATA_PATH=\/usr\/share\/OpenSupaplex\//" Makefile -i # Compile with data dir in /usr/share
}
build() {
    cd $srcdir/linux/
    make -j$(nproc)
}

package() {
    cd $srcdir/
    mkdir -p $pkgdir/usr/bin
    mkdir -p $pkgdir/usr/share/OpenSupaplex
    mkdir -p $pkgdir/usr/share/icons/hicolor/256x256/apps
    install -m 0755	$srcdir/linux/opensupaplex			$pkgdir/usr/bin/opensupaplex
    install -m 0644	$srcdir/switch/resources/launcher-icon.jpg	$pkgdir/usr/share/icons/hicolor/256x256/apps/open-supaplex.png
    cp		-r	$srcdir/resources/*				$pkgdir/usr/share/OpenSupaplex/
    desktop-file-install $srcdir/open-supaplex.desktop		  --dir=$pkgdir/usr/share/applications/
}

#vim: syntax=sh
