# Maintainer: Luca Weiss <WEI16416 (at) spengergasse (dot) at>

pkgname=kde1-kdebase
pkgver=1.1.2
pkgrel=2
pkgdesc="Historical copy of the base applications module of KDE 1, adapted to compile on modern systems (circa. 2016)"
arch=('i686' 'x86_64')
url="https://github.com/KDE/kde1-kdebase"
license=("GPL2")
groups=("kde1")
depends=("qt1" "kde1-kdelibs" "libjpeg" "libtiff" "perl")
makedepends=("cmake")
_commit="07492489711904daf165c633549883000a71295a"
source=("https://github.com/KDE/$pkgname/archive/$_commit.zip"
        "kfm_CMakeLists.patch"
        "kwm_CMakeLists.patch")
sha256sums=('8f2f84b941af1b018ae4a86d41e6ff3a7e952254cfae32bc959c797fe49ae128'
            'fd73241c7f1ee4847b431c5515fc74828aab50831118d9d2a99916c3b256ef86'
            '82a0fff5971adb92c9140b16a4b6b13c832ff7b7b6e3217fe9edf0dd3505d304')

prepare() {
  cd $srcdir/$pkgname-$_commit
  patch -p1 kfm/pics/CMakeLists.txt < $srcdir/kfm_CMakeLists.patch
  patch -p1 kwm/pics/CMakeLists.txt < $srcdir/kwm_CMakeLists.patch
}

build() {
  cd $srcdir/$pkgname-$_commit
  mkdir -p build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX='/usr' -DCMAKE_LIBRARY_PATH='/opt/kde1/lib64'
  make
}

package() {
  # TODO : Fix icons missing
  cd $srcdir/$pkgname-$_commit
  cd build
  make DESTDIR="$pkgdir/" install
  cd ..  
  install -Dm644 COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING
}

# vim:set ts=2 sw=2 et:
