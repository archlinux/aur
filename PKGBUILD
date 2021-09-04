# Contributor: Michal Wojdyla < micwoj9292 at gmail dot com >
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgname=kdelibs
pkgver=4.14.38
_kdeappver=17.08.3
pkgrel=5
pkgdesc="KDE Core Libraries"
arch=('x86_64')
url='https://www.kde.org/'
license=('GPL' 'LGPL' 'FDL')
depends=('attica-qt4' 'libxss' 'libdbusmenu-qt4' 'polkit-qt4'
        'shared-mime-info' 'enchant' 'giflib' 'jasper' 'openexr'
        'docbook-xsl' 'upower' 'udisks2' 'libxcursor' 'phonon-qt4'
        'media-player-info' 'libutempter' 'icu')
makedepends=('cmake' 'automoc4' 'avahi' 'libgl' 'mesa')
source=("https://download.kde.org/stable/applications/${_kdeappver}/src/$pkgname-$pkgver.tar.xz"
        'kde-applications-menu.patch' 'archlinux-menu.patch' 'qt4.patch'
        'kdelibs-no-kdewebkit.patch' 'kdelibs-openssl-1.1.patch'
        'patch-klocale-kde.cpp.patch' 'ordered.patch')
sha256sums=('37fd43a34e8118406e03a5d0e53f4a03c8aa50b219e8484a5d42349dc0f2c3fe'
            '0eed754cf3e9f41be5ea22314bf49cf5571b421d81b8f525287830bd1b9b684e'
            '877df7357360b70d9f7d6bc8c211f82fd8b00cc2eb34e9993ff6aae20faf1cad'
            'ced10a9a83ff2a7f82edf51f6f399f8338b34ab5a589ef43637517d204843bea'
            '2df372f1bfcef1902349f9ca8820315030d39dd2bb769776b94fd3fcbf9621f5'
            '42f86279515bead6e9f89b1fc3ea58e0a648d41fae343de95297f995dedcdd71'
            'e2e7cf3fe5c82d18609d51d4d224c17a55b0bac77c1fce5e32296381d34a14fa'
            '7b621b8c72ffd662e933601dc6cd7638270cfa2d6d36e0f2deb682dd37c442bd')

prepare() {
  mkdir -p build
  cd $pkgname-$pkgver
  # avoid file conflict with gnome-menus
  patch -p1 -i ../kde-applications-menu.patch
  # add Archlinux menu entry
  patch -p1 -i ../archlinux-menu.patch
  # qmake refers to Qt5
  patch -p1 -i ../qt4.patch
  # disable kdewebkit (Fedora)
  patch -p1 -i ../kdelibs-no-kdewebkit.patch
  # fix build with openSSL 1.1 (OpenMandriva)
  patch -p1 -i ../kdelibs-openssl-1.1.patch
  # https://github.com/n0mAdiNs0mNiaC/RouterProject/commit/6f2c730e6c3319eb2daef860164cf97146eb5497
  patch -p1 -i ../patch-klocale-kde.cpp.patch
  # fix error: ordered comparison of pointer with integer zero 
  patch -p1 -i ../ordered.patch
}

build() {
       cd build
       CXXFLAGS="$CXXFLAGS -fpermissive -Wno-narrowing"
       cmake ../$pkgname-$pkgver \
               -DCMAKE_BUILD_TYPE=Release \
               -DKDE4_BUILD_TESTS=OFF \
               -DCMAKE_SKIP_RPATH=ON \
               -DKDE_DISTRIBUTION_TEXT='Arch Linux' \
               -DCMAKE_INSTALL_PREFIX=/usr \
               -DSYSCONF_INSTALL_DIR=/etc \
               -DLOCALE_INSTALL_DIR=/usr/share/locale/kde4 \
               -DKDE_DEFAULT_HOME='.kde4' \
               -DWITH_FAM=OFF \
               -DWITH_SOLID_UDISKS2=ON \
               -DENCHANT_INCLUDE_DIR=/usr/include/enchant-2 \
               -DENCHANT_LIBRARIES=/usr/lib/libenchant-2.so
       make
}

package() {
       cd build
       make DESTDIR="$pkgdir" install

       # cert bundle seems to be hardcoded
       # link it to the one from ca-certificates
       rm -f "$pkgdir"/usr/share/apps/kssl/ca-bundle.crt
       ln -sf /etc/ssl/certs/ca-certificates.crt "$pkgdir"/usr/share/apps/kssl/ca-bundle.crt
}
