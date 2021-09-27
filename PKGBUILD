# Contributor: Sapphira Armageddos <shadowkyogre.public+aur@gmail.com>
pkgname=magicseteditor
pkgver=2.1.2
pkgrel=1
pkgdesc="A program to help create Magic: the Gathering cards and sets. Comes with no game support."
arch=('i686' 'x86_64')
url="https://github.com/twanvl/MagicSetEditor2"
license=('GPL')
depends=('hunspell' 'libjpeg' 'wxgtk3' 'boost-libs')
makedepends=('boost' 'unzip' 'cmake')
provides=("magicseteditor=${pkgver}")
source=("https://github.com/twanvl/MagicSetEditor2/archive/refs/tags/v${pkgver}.tar.gz" "compilefix.patch" "MagicSetEditor.desktop")
install=$pkgname.install
options=(!strip)
md5sums=('10a4d10e326f05c32a3e8f7be1842562' '650a9afc5faa3d7749267608e1fe17c7' 'fdcacb8841ebdbccd6b443e35276d497')

prepare()
{
patch -p0 < ./compilefix.patch
}

build()
{
cmake -B build -S "MagicSetEditor2-${pkgver}" -DwxWidgets_CONFIG_EXECUTABLE:FILEPATH="/usr/bin/wx-config-gtk3" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX='/usr'
make -C build
}

package()
{
    mkdir -p $pkgdir/usr/share/applications
    cp MagicSetEditor.desktop $pkgdir/usr/share/applications
    cd "$srcdir/build"
    mv magicseteditor ../MagicSetEditor2-2.1.2
	cd "$srcdir/MagicSetEditor2-${pkgver}"
	mkdir -p $pkgdir/usr/bin
	cp magicseteditor $pkgdir/usr/bin/
	mkdir -p $pkgdir/usr/share/magicseteditor/{resource,data}
	cp -r ./data/*.mse-locale $pkgdir/usr/share/magicseteditor/data
	cp -r ./resource/* $pkgdir/usr/share/magicseteditor/resource
	mkdir -p $pkgdir/usr/share/pixmaps
    cp ./resource/installer_program.png $pkgdir/usr/share/pixmaps/MagicSetEditor.png
}

# vim:set ts=2 sw=2 et:
