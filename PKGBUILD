# Maintainer: Conor Anderson <conor@conr.ca>
pkgname=sirikali
_name=SiriKali
pkgver=1.2.7
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
source=("${_name}-${pkgver}.tar.xz::https://github.com/mhogomchungu/${pkgname}/releases/download/${pkgver}/${_name}-${pkgver}.tar.xz")
sha256sums=('7d2cece25bf9bbb5d7104d645ef1334bce815446f182284627ec008c0656276f')

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
