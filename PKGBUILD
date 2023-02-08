# Maintainer: SpotlightKid <aur -at- chrisarndt -dot- de>

_pkgname=rezound
pkgname=$_pkgname-qt-git
pkgver=v0.13.1beta.r44.ge29a29a8
pkgrel=1
pkgdesc='A graphical audio file editor (Qt git version)'
arch=(x86_64)
url='http://rezound.sourceforge.net/'
license=(GPL)
depends=(
  audiofile
  desktop-file-utils
  fftw
  jack
  libpulse
  portaudio
  qt6-base
  soundtouch
)
makedepends=(git)
optdepends=(
  'cdrdao: For burn-to-CD-feature.'
)
provides=($_pkgname)
conflicts=($_pkgname $_pkgname-git $_pkgname-svn)
source=("$_pkgname-qt::git+https://github.com/ddurham2/rezound.git#branch=dev/qt"
        "$_pkgname.png"
        "$_pkgname-jack.desktop"
)
sha256sums=('SKIP'
            '5a33ebae3f38bf9b824c262696ea67febc66ee2ef68fa22e976409041a08a489'
            '50827f9b942d8ec5b951a50e5b0651c62fd31e9bba3c9bbf04a07155454bdd93')

pkgver() {
  cd $_pkgname-qt
  git describe --tags --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B $pkgname-build -S $_pkgname-qt \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX='/usr'
  cmake --build $pkgname-build

  # fix desktop file
  sed "s|\(Icon=/usr/share/\).*|\1pixmaps/$_pkgname.png|" \
    $_pkgname-qt/packaging/generic_rpm/kde/$_pkgname.desktop > \
    $pkgname-build/$_pkgname.desktop
}

package() {
  DESTDIR="$pkgdir" cmake --install $pkgname-build
  # remove conflicting gmock and gtest stuff
  rm -rf "$pkgdir"/usr/lib/ "$pkgdir"/usr/include/

  cd $_pkgname-qt
  ### icon
  install -Dvm644 "$srcdir"/$_pkgname.png \
    -t "$pkgdir"/usr/share/pixmaps
  ### desktop files
  install -Dvm644 packaging/generic_rpm/kde/x-rez.desktop \
    -t "$pkgdir"/usr/share/applications
  install -Dvm644 "$srcdir"/$pkgname-build/$_pkgname.desktop \
    -t "$pkgdir"/usr/share/applications
  install -Dvm644 "$srcdir"/$_pkgname-jack.desktop \
    -t "$pkgdir"/usr/share/applications
  ### man page
  install -Dvm644 packaging/debian/$_pkgname.1 \
    -t "$pkgdir"/usr/share/man/man1
  ### documentation
  install -Dvm644 TODO.txt \
    -t "$pkgdir"/usr/share/doc/$pkgname
  mv "$pkgdir"/usr/doc/$_pkgname/* "$pkgdir"/usr/share/doc/$pkgname
  rmdir "$pkgdir"/usr/doc/$_pkgname
}
