# Contributor: Zephyr
# Contributor: vitamin1980 <vitamin.novgorod @ yandex.ru>

pkgname=lib32-oxygen-gtk3-git
pkgver=20151007_vgtk3_1.4.1_12_g705b7
pkgrel=1
pkgdesc="Port of the default KDE widget theme (Oxygen) to GTK3"
arch=('x86_64')
url="https://projects.kde.org/projects/playground/artwork/oxygen-gtk"
license=('LGPL')
depends=('oxygen-gtk3-git' 'lib32-gtk3')
makedepends=('git' 'cmake')
conflicts=('lib32-oxygen-gtk3')
provides=('lib32-oxygen-gtk3')
#options=('!strip')
source=("git://anongit.kde.org/oxygen-gtk#branch=gtk3")
md5sums=('SKIP')

#_gitroot="git://anongit.kde.org/oxygen-gtk"
_gitname="oxygen-gtk"

pkgver() {
    cd "$srcdir/$_gitname"

    echo "$(LANG=C date '+%Y%m%d')_$(git describe --tags --always --abbrev=5 | sed 's/-/_/g')"
}

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  #cmake -DCMAKE_INSTALL_PREFIX=/usr \
        #-DCMAKE_BUILD_TYPE=debugfull \
        #../${_gitname}
  #make

  cd "${srcdir}/${_gitname}"
  mkdir build && cd build

  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=debugfull \
        -DINSTALL_PATH_GTK_ENGINES=/usr/lib32/gtk-3.0/3.0.0/theming-engines \
        ..

  make
}

package () {
  cd "${srcdir}/${_gitname}/build"
  make DESTDIR=${pkgdir} install
  rm -rf "${pkgdir}/usr/bin"
  rm -rf "${pkgdir}/usr/share"
}
