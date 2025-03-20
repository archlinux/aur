# Contributor: Sapphira Armageddos <shadowkyogre.public+aur@gmail.com>
pkgname=magicseteditor
pkgver=2.1.2
pkgrel=3
pkgdesc="A program to help create Magic: the Gathering cards and sets. Comes with no game support."
arch=('i686' 'x86_64')
url="https://github.com/twanvl/MagicSetEditor2"
license=('GPL-2.0-or-later')
depends=('hunspell' 'wxwidgets-gtk3' 'wxwidgets-common' 'boost-libs')
makedepends=('boost' 'cmake' 'gendesk')
provides=("magicseteditor")
source=("https://github.com/twanvl/MagicSetEditor2/archive/refs/tags/v${pkgver}.tar.gz" "compilefix.patch")
install=$pkgname.install
options=()
md5sums=('10a4d10e326f05c32a3e8f7be1842562' 'ceca30d280ed4f46037f727e877d6958')

prepare()
{
gendesk -n -f --pkgname="MagicSetEditor2" --pkgdesc="A program to help create Magic: the Gathering cards and sets." --exec="magicseteditor"
cd "MagicSetEditor2-${pkgver}"
patch -p1 < ../compilefix.patch
}

build()
{
cmake -B build -S "MagicSetEditor2-${pkgver}" -DwxWidgets_CONFIG_EXECUTABLE:FILEPATH="/usr/bin/wx-config" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX='/usr'
cmake --build "build"
}

package()
{
	install -Dm755 "MagicSetEditor2.desktop" "${pkgdir}/usr/share/applications/MagicSetEditor.desktop"
    install -Dm755 "./build/magicseteditor" "${pkgdir}/usr/bin/magicseteditor"
	mkdir -p $pkgdir/usr/share/magicseteditor/{resource,data}
	cp -r ./MagicSetEditor2-${pkgver}/data/*.mse-locale "${pkgdir}/usr/share/magicseteditor/data"
	cp -r ./MagicSetEditor2-${pkgver}/resource/* "${pkgdir}/usr/share/magicseteditor/resource"
	install -Dm755 "./MagicSetEditor2-${pkgver}/resource/installer_program.png" "${pkgdir}/usr/share/pixmaps/MagicSetEditor2.png"
}

# vim:set ts=2 sw=2 et:
