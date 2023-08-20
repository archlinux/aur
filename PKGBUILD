# Maintainer: SpotlightKid <aur -at- chrisarndt -dot- de>

_pkgname=rezound
pkgname=$_pkgname-qt-git
pkgver=0.13.1beta.r44.ge29a29a8
pkgrel=1
pkgdesc='A graphical audio file editor (Qt git version)'
arch=(x86_64)
url='http://rezound.sourceforge.net/'
license=(GPL)
depends=(
  gcc-libs
  glibc
  qt6-base
  soundtouch
)
makedepends=(
  audiofile
  fftw
  flac
  git
  jack
  libglvnd
  libogg
  libpulse
  libogg
  libvorbis
  portaudio
)
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
  (
    set -o pipefail
    git describe --long --tags 2>/dev/null | sed -e 's/^v//' -e 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd $_pkgname-qt
  # fix include in src/misc/stdx/stdx.cpp
  sed -i 's/"thread""/"thread"/' src/misc/stdx/stdx.cpp

  # disable building PoolFile test
  sed -i '/src\/PoolFile\/test/d' CMakeLists.txt
}

build() {
  cmake -B $pkgname-build -S $_pkgname-qt \
    -Wno-dev \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DENABLE_ALSA=ON \
    -DENABLE_JACK=ON \
    -DENABLE_LADSPA=ON \
    -DENABLE_OSS=ON \
    -DENABLE_PORTAUDIO=ON \
    -DENABLE_PULSE=ON
  cmake --build $pkgname-build

  # fix desktop file
  sed "s|\(Icon=/usr/share/\).*|\1pixmaps/$_pkgname.png|" \
    $_pkgname-qt/packaging/generic_rpm/kde/$_pkgname.desktop > \
    $pkgname-build/$_pkgname.desktop
}

package() {
  depends+=(libasound.so libaudiofile.so libfftw3.so libFLAC.so libFLAC++.so
            libGLX.so libjack.so libOpenGL.so libportaudio.so libpulse.so
            libpulse-simple.so libogg.so libvorbis.so libvorbisenc.so
            libvorbisfile.so)
  DESTDIR="$pkgdir" cmake --install $pkgname-build
  # remove conflicting gmock and gtest stuff
  rm -rf "$pkgdir"/usr/lib/ "$pkgdir"/usr/include/

  cd $_pkgname-qt
  ### icon
  install -Dvm644 "$srcdir"/$_pkgname.png \
    -t "$pkgdir"/usr/share/pixmaps
  ### desktop files
  install -Dvm644 packaging/generic_rpm/kde/x-rez.desktop \
    -t "$pkgdir"/usr/share/mime/applications
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
  rm -rf "$pkgdir"/usr/doc
}
