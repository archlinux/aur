# Maintainer: Faerbit <faerbit at gmail dot com>

pkgname=lxqt_wallet
_pkgname=lxqt-wallet
pkgver=3.1.0
pkgrel=2
pkgdesc="Secure storage of information for lxqt"
arch=("i686" "x86_64")
url="https://github.com/mhogomchungu/lxqt_wallet"
license=("BSD")
depends=("libgcrypt")
optdepends=("kwallet: store passwords in kwallet"
            "libsecret: store passwords in GNOME's secret service")
makedepends=("cmake" "qt5-base" "kwallet" "libsecret" "qt5-tools")
source=("https://github.com/mhogomchungu/lxqt_wallet/releases/download/${pkgver}/${_pkgname}-${pkgver}.tar.xz"
        "https://github.com/mhogomchungu/lxqt_wallet/releases/download/${pkgver}/${_pkgname}-${pkgver}.tar.xz.asc")
sha256sums=("b805c14e5c52808c948a0e5fe43bc9adab538f304e0fa73a910436a3ab38d1d3" "SKIP")
validpgpkeys=("3AD67A14194FE8E7AEFCA19C3E1F380427A5D3CA")

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
