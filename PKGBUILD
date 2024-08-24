# Maintainer: Conor Anderson <conor@conr.ca>
# Adopted from: Félix Saparelli <aur@passcod.name>
pkgname=sirikali-git
_pkgname=${pkgname%-git}
pkgver=1.6.0.r52.fdf102e
pkgrel=1
pkgdesc="A Qt/C++ GUI front end to sshfs, ecryptfs-simple, cryfs, gocryptfs, securefs, fscrypt and encfs"
arch=('i686' 'x86_64' 'aarch64')
url="https://mhogomchungu.github.io/sirikali/"
license=('GPL')
depends=('qt5-base' 'libpwquality' 'hicolor-icon-theme')
makedepends=('git' 'cmake' 'libgcrypt' 'gcc-libs')
optdepends=('lxqt_wallet: use an external lxqt_wallet (must recompile)'
            'libsecret: support for Gnome libsecret password storage (must recompile)'
            'kwallet: support for KDE wallet storage (must recompile)'
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

  if pacman -Qs "lxqt_wallet" > /dev/null ; then
    intwallet="false"
  else
    intwallet="true"
  fi

  if pacman -Qs "kwallet" > /dev/null ; then
    skipkde="false"
  else
    skipkde="true"
  fi

  if pacman -Qs "libsecret" > /dev/null ; then
    skipsecret="false"
  else
    skipsecret="true"
  fi
}

build() {
  cd ${_pkgname}/build
  cmake \
    -DCMAKE_BUILD_TYPE=RELEASE \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DINTERNAL_LXQT_WALLET=$intwallet \
    -DNOKDESUPPORT=$skipkde \
    -DNOSECRETSUPPORT=$skipsecret \
    . ..
  make
}

package() {
  cd ${_pkgname}/build
  make DESTDIR="$pkgdir/" install
}
