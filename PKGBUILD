# Maintainer: Conor Anderson <conor@conr.ca>
# Adopted from: Félix Saparelli <aur@passcod.name>
pkgname=sirikali-git
_pkgname=${pkgname%-git}
pkgver=1.3.7.r0.48e9937
pkgrel=1
pkgdesc="A Qt/C++ GUI front end to cryfs, gocryptfs, securefs and encfs"
arch=('i686' 'x86_64')
url="https://mhogomchungu.github.io/sirikali/"
license=('GPL')
depends=('qt5-base' 'libpwquality' 'hicolor-icon-theme')
makedepends=('git' 'cmake' 'libgcrypt' 'lxqt_wallet' 'gcc-libs')
optdepends=('libsecret: support for Gnome libsecret password storage (must recompile)'
            'kwallet: support for KDE wallet storage (must recompile)'
            'cryfs: for CryFS support'
            'gocryptfs: for gocryptfs support'
            'securefs: for securefs support'
            'encfs: for EncFS support'
            'ecryptfs-simple: for eCryptfs support')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('sirikali::git+https://github.com/mhogomchungu/sirikali.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${_pkgname}"
  printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
  cd "$srcdir/${_pkgname}"
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
  cd "$srcdir/${_pkgname}/build"
  cmake \
    -DCMAKE_BUILD_TYPE=RELEASE \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DINTERNAL_LXQT_WALLET=false \
    -DNOKDESUPPORT=$kdeopt \
    -DNOSECRETSUPPORT=$gnomeopt \
    -DQT5=true \
    . ..
  make
}

package() {
  cd "$srcdir/${_pkgname}/build"
  make DESTDIR="$pkgdir/" install
}
