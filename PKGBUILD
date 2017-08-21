# Maintainer: Conor Anderson <conor@conr.ca>
pkgname=sirikali
_name=SiriKali
pkgver=1.3.0
pkgrel=1
pkgdesc="A Qt/C++ GUI front end to cryfs, gocryptfs, securefs and encfs"
arch=('i686' 'x86_64')
url="https://mhogomchungu.github.io/sirikali/"
license=('GPL')
depends=('qt5-base' 'libpwquality' 'hicolor-icon-theme')
makedepends=('cmake' 'libgcrypt' 'gcc-libs')
optdepends=('libsecret: support for Gnome libsecret password storage'
            'kwallet: support for KDE wallet storage'
            'cryfs: for CryFS support'
            'gocryptfs: for gocryptfs support'
            'securefs: for securefs support'
            'encfs: for EncFS support'
            'ecryptfs-simple: for eCryptfs support')
conflicts=("sirikali-git")
source=("${_name}-${pkgver}.tar.xz::https://github.com/mhogomchungu/${pkgname}/releases/download/${pkgver}/${_name}-${pkgver}.tar.xz"
        "${_name}-${pkgver}.tar.xz.asc::https://github.com/mhogomchungu/${pkgname}/releases/download/${pkgver}/${_name}-${pkgver}.tar.xz.asc")
sha256sums=('ad31a4c5279afaab2638591ddd4227346542513ba929b08849dc80aa8945e64c'
            'SKIP')
validpgpkeys=('E3AF84691424AD00E099003502FC64E8DEBF43A8')

prepare() {
  cd "$srcdir/${_name}-${pkgver}"
  mkdir -p build

  if pacman -Qs "kwallet" > /dev/null ; then
    kdeopt="false"
  else
    kdeopt="true"
  fi

  if pacman -Qs "libsecret" > /dev/null ; then
    gnomeopt="false"
  else
    gnomeopt="true"
  fi
}

build() {
  cd "$srcdir/${_name}-${pkgver}/build"
  cmake \
    -DCMAKE_BUILD_TYPE=RELEASE \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DINTERNAL_LXQT_WALLET=true \
    -DNOKDESUPPORT=$kdeopt \
    -DNOSECRETSUPPORT=$gnomeopt \
    -DQT5=true \
    . ..
  make
}

package() {
  cd "$srcdir/${_name}-${pkgver}/build"
  make DESTDIR="$pkgdir/" install
}
