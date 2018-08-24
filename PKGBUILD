# $Id: PKGBUILD 317536 2018-02-26 03:06:37Z arojas $
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgname=kdebase-runtime
pkgver=17.08.3
pkgrel=4
pkgdesc="Plugins and applications necessary for the running of KDE applications"
arch=('x86_64')
url='https://www.kde.org/'
license=('GPL' 'LGPL')
makedepends=('pkg-config' 'cmake' 'automoc4' 'doxygen' 'networkmanager' 'boost')
depends=('kdelibs' 'smbclient' 'libssh' 'libcanberra' 'oxygen-icons' 'xorg-xauth' 'libwebp' 'exiv2' 'gpgme')
optdepends=('drkonqi: crash report tool' 'khelpcenter: to display applications documentation')
provides=(notification-daemon)
conflicts=(kdesu4)
replaces=(kdesu4)
source=("https://download.kde.org/Attic/applications/$pkgver/src/kde-runtime-$pkgver.tar.xz"{,.sig}
        kdebase-runtime-no-html-thumbnails.patch kdebase-runtime-no-kdewebkit.patch)
sha256sums=('682c18afb11cda41288c4508831cb59797417b9d81ea916e0e99722ebe9bce96'
            'SKIP'
            '5ce434f25759215ed2b6f71ec82a9118ee76e7428ef1af8a5495133a76c9c2df'
            '93d5ddf78c784b3d79486813bdfb43debba271b389bfc46ca79aabdb0bca14db')
validpgpkeys=(CA262C6C83DE4D2FB28A332A3A6A4DB839EAA6D7  # Albert Astals Cid <aacid@kde.org>
              F23275E4BF10AFC1DF6914A6DBD2CE893E2D1C87) # Christoph Feck <cfeck@kde.org>

prepare() {
  mkdir -p build

# Don't link to kactivities
  sed -e '/plasmaextracomponents/d' -i kde-runtime-$pkgver/plasma/declarativeimports/CMakeLists.txt
# Drop HTML thumbnailer, uses insecure QtWebKit
  cd kde-runtime-$pkgver
  patch -p1 -i ../kdebase-runtime-no-html-thumbnails.patch
  patch -p1 -i ../kdebase-runtime-no-kdewebkit.patch
}

build() {
  cd build
  cmake ../kde-runtime-$pkgver \
    -DCMAKE_BUILD_TYPE=Release \
    -DKDE4_BUILD_TESTS=OFF \
    -DCMAKE_SKIP_RPATH=ON \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DWITH_QNtrack=OFF \
    -DSAMBA_INCLUDE_DIR=/usr/include/samba-4.0 \
    -DWITH_NepomukCore=OFF \
    -DBUILD_khelpcenter=OFF \
    -DBUILD_kglobalaccel=OFF \
    -DBUILD_kuiserver=OFF \
    -DBUILD_drkonqi=OFF \
    -DBUILD_doc=OFF
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install

  rm "$pkgdir"/usr/share/icons/hicolor/index.theme
  ln -s /usr/lib/kde4/libexec/kdesu "$pkgdir"/usr/bin/kdesu4

# Use KF5 drkonqi
  ln -s /usr/lib/drkonqi "$pkgdir"/usr/lib/kde4/libexec/

# FS#36668
  chown :nobody "$pkgdir"/usr/lib/kde4/libexec/kdesud
  chmod g+s "$pkgdir"/usr/lib/kde4/libexec/kdesud
}
