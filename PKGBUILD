# Maintainer: Oleg Shparber <trollixx+aur@gmail.com>
# Contributor: Vesa Kaihlavirta <vegai@iki.fi>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# URL: https://github.com/trollixx/aur-packages

_pkgbase=quassel
pkgbase=${_pkgbase}-light
pkgname=('quassel-client-light' 'quassel-core-light' 'quassel-monolithic-light')
pkgver=0.12.2
pkgrel=2
pkgdesc="Next-generation distributed IRC client (minimal dependencies)"
arch=('i686' 'x86_64')
url="http://quassel-irc.org/"
license=('GPL')
makedepends=('cmake')
source=(http://quassel-irc.org/pub/${_pkgbase}-$pkgver.tar.bz2
        ${_pkgbase}.service
        ${_pkgbase}.conf
        fix_ssl_check.patch)
sha256sums=('6bd6f79ecb88fb857bea7e89c767a3bd0f413ff01bae9298dd2e563478947897'
            '828aaf27696ffe2aa4b80755a09bdf264f644d9539366981697a73bb23340d7b'
            'f3031ea8217e01ba42cea14606169e3e27affa5918968ffd5a03c21ae92fe2b8'
            'c62f50511322c6cd27b10b4c3d92d0c04262454467b95f1a84064f784c47ba7b')

prepare() {
  cd ${_pkgbase}-$pkgver
  patch -p1 -i ../../fix_ssl_check.patch
}

build() {
  cd "${srcdir}"
  [[ ! -d build ]] && mkdir build
  [[ ! -d build-client ]] && mkdir build-client
  [[ ! -d build-mono ]] && mkdir build-mono

  # Core
  cd "${srcdir}"/build
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr/ \
    -DUSE_QT5=ON \
    -DWITH_KDE=OFF \
    -DCMAKE_BUILD_TYPE="Release" \
    -DWANT_CORE=ON \
    -DWANT_MONO=OFF \
    -DWANT_QTCLIENT=OFF \
    -DWITH_OXYGEN=OFF \
    -DWITH_WEBKIT=OFF \
    -DCMAKE_BUILD_TYPE="Release" \
    ../quassel-${pkgver}/ \
    -Wno-dev
  make

  # Client
  cd "${srcdir}"/build-client
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr/ \
    -DUSE_QT5=ON \
    -DWITH_KDE=OFF \
    -DCMAKE_BUILD_TYPE="Release" \
    -DWANT_CORE=OFF \
    -DWANT_QTCLIENT=ON \
    -DWANT_MONO=OFF \
    -DWITH_WEBKIT=OFF \
    ../quassel-${pkgver}/ \
    -Wno-dev
  make

  # Monolithic
  cd "${srcdir}"/build-mono
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr/ \
    -DUSE_QT5=ON \
    -DWITH_KDE=OFF \
    -DCMAKE_BUILD_TYPE="Release" \
    -DWANT_CORE=OFF \
    -DWANT_QTCLIENT=OFF \
    -DWANT_MONO=ON \
    -DWITH_WEBKIT=OFF \
    ../quassel-${pkgver}/ \
    -Wno-dev
  make
}

package_quassel-core-light() {
pkgdesc="Next-generation distributed IRC client - core only (minimal dependencies)"
depends=('qt5-base' 'qt5-script')
backup=(etc/conf.d/quassel)
provides=('quassel-core')
install=quassel.install
  cd "${srcdir}"/build

  make DESTDIR="${pkgdir}" install

  # Remove unneeded pixmap icons
  rm -r "${pkgdir}"/usr/share

  install -Dm644 "${srcdir}"/${_pkgbase}.service \
    "${pkgdir}"/usr/lib/systemd/system/${_pkgbase}.service
  install -Dm644 "${srcdir}"/${_pkgbase}.conf \
    "${pkgdir}"/etc/conf.d/${_pkgbase}
}

package_quassel-client-light() {
pkgdesc="Next-generation distributed IRC client - client only (minimal dependencies)"
depends=('qt5-base')
provides=('quassel-client')
conflicts=('quassel-monolithic')
install=quassel-client.install
  cd "${srcdir}"/build-client

  make DESTDIR="${pkgdir}" install
}

package_quassel-monolithic-light() {
pkgdesc="Next-generation distributed IRC client - monolithic (minimal dependencies)"
depends=('qt5-base' 'qt5-script')
provides=('quassel-monolithic')
conflicts=('quassel-client')
install=quassel-monolithic.install
  cd "${srcdir}"/build-mono

  make DESTDIR="${pkgdir}" install
}
