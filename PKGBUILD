# Maintainer: Faerbit <faerbit at gmail dot com>

pkgname=lxqt_wallet
_pkgname=lxqt-wallet
pkgver=3.2.2
pkgrel=1
pkgdesc="Secure storage of information for lxqt"
arch=('i686' 'x86_64')
url="https://github.com/mhogomchungu/lxqt_wallet"
license=('BSD')
depends=('libgcrypt')
makedepends=('cmake' 'qt5-base' 'kwallet' 'libsecret' 'qt5-tools')
optdepends=('libsecret: support for Gnome libsecret password storage (must recompile)'
            'kwallet: support for KDE wallet storage (must recompile)')
source=("https://github.com/mhogomchungu/lxqt_wallet/releases/download/${pkgver}/${_pkgname}-${pkgver}.tar.xz"
        "https://github.com/mhogomchungu/lxqt_wallet/releases/download/${pkgver}/${_pkgname}-${pkgver}.tar.xz.asc")
sha256sums=('1e41383cd60e1d23f96a9918f9eb552871afeb5abd202b3678305f59e70f0339'
            'SKIP')
validpgpkeys=('6855E493B5B2DF96E319BB6D16E2E1ACC6F51242')

prepare() {
  cd "$srcdir/${_pkgname}-${pkgver}"
  mkdir -p build

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
    mkdir -p build
    cd build
    cmake \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release  \
        -DNOSECRETSUPPORT=$skipsecret \
        -DNOKDESUPPORT=$skipkde \
        -DCMAKE_INSTALL_LIBDIR=lib \
        "$srcdir/$_pkgname-$pkgver"
    make
}

package() {
    cd build
    make DESTDIR="$pkgdir" install
    install -D "$srcdir/$_pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
