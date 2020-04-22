# Maintainer: Zineddine SAIBI <saibi.zineddine@yahoo.com>

_name=deeptags
pkgname=${_name}-git
pkgver=0.5.1.r8.g96fccbe
pkgrel=1
pkgdesc="A Markdown notes manager"
arch=('x86_64')
url="https://github.com/SZinedine/DeepTags"
license=('GPL3')
depends=('qt5-base' 'qt5-svg')
makedepends=('qt5-tools' 'git' 'gcc' 'make')
source=("$_name::git+https://github.com/SZinedine/DeepTags.git")
md5sums=('SKIP')
conflicts=("deeptags")
install=$_name.install

build() {
    cd "$_name"
    git submodule update --init --recursive
    qmake PREFIX=/usr
    # make -j$(nproc) DEFINES=-DDEEPTAGS_VERSION=\\\"$(git describe --tags)-git\\\"
    make -j$(nproc) DEFINES=-DDEEPTAGS_VERSION=\\\"$(git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g')\\\"
}

pkgver() {
  cd "$_name"
  git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd $_name/
    make INSTALL_ROOT=$pkgdir install

    install -Dm 644 packaging/resources/$_name.appdata.xml  $pkgdir/usr/share/metainfo/$_name.appdata.xml;
    install -Dm 644 packaging/resources/$_name.desktop      $pkgdir/usr/share/applications/$_name.desktop
    install -Dm 644 LICENSE                                 $pkgdir/usr/share/licenses/$_name/LICENSE

    for icon in 16x16 32x32 48x48 64x64 80x80 96x96 128x128 192x192 256x256 384x384 512x512; do
        install -Dm 644 packaging/resources/icons/hicolor/$icon/apps/$_name.png  $pkgdir/usr/share/icons/hicolor/$icon/apps/$_name.png
    done
    install -Dm 644 packaging/resources/icons/hicolor/scalable/apps/$_name.svg   $pkgdir/usr/share/icons/hicolor/scalable/apps/$_name.svg
}
