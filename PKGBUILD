# Maintainer: Conor Anderson <conor@conr.ca>
# Adopted from: Félix Saparelli <aur@passcod.name>
pkgname=sirikali-git
_pkgname=${pkgname%-git}
pkgver=1.6.0.r95.b3ac657
pkgrel=1
pkgdesc="A Qt/C++ GUI front end to sshfs, ecryptfs-simple, cryfs, gocryptfs, securefs, fscrypt and encfs"
arch=('i686' 'x86_64' 'aarch64')
url="https://mhogomchungu.github.io/sirikali/"
license=('GPL')
depends=('qt6-base' 'libpwquality' 'hicolor-icon-theme' 'libsecret')
makedepends=('git' 'cmake' 'libgcrypt' 'gcc-libs')
optdepends=('kwallet: password storage (either via libsecret or discovered via dbus)'
            'cryfs: for CryFS backend'
            'ecryptfs-simple: for eCryptfs backend'
            'encfs: for EncFS backend'
            'fscrypt: for fscrypt backend'
            'gocryptfs: for gocryptfs backend'
            'securefs: for securefs backend'
            'sshfs: for SSHFS backend')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=('sirikali::git+https://github.com/mhogomchungu/sirikali.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${_pkgname}"
  printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
  cd ${_pkgname}
  mkdir -p build
}

build() {
  cd ${_pkgname}/build
  cmake \
    -DCMAKE_BUILD_TYPE=RELEASE \
    -DBUILD_WITH_QT6=ON \
    -DCMAKE_INSTALL_PREFIX=/usr \
    . ..
  make
}

package() {
  cd ${_pkgname}/build
  make DESTDIR="$pkgdir/" install
}
