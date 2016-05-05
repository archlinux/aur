# Maintainer: Oleg Shparber <trollixx+aur@gmail.com>
# Contributor: Vesa Kaihlavirta <vegai@iki.fi>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# URL: https://github.com/trollixx/aur-packages

_pkgbase=quassel
pkgbase=${_pkgbase}-light
pkgname=('quassel-client-light' 'quassel-core-light' 'quassel-monolithic-light')
pkgver=0.12.4
pkgrel=1
pkgdesc="Next-generation distributed IRC client (minimal dependencies)"
arch=('i686' 'x86_64')
url="http://quassel-irc.org/"
license=('GPL')
makedepends=('cmake')
source=(http://quassel-irc.org/pub/${_pkgbase}-$pkgver.tar.bz2
        ${_pkgbase}.service
        ${_pkgbase}.conf)
sha256sums=('93e4e54cb3743cbe2e5684c2fcba94fd2bc2cd739f7672dee14341b49c29444d'
            '5dbe20290f3361b9b7a74a52905137e76b656976febf2d31082a2276f9dcde7f'
            'f3031ea8217e01ba42cea14606169e3e27affa5918968ffd5a03c21ae92fe2b8')

prepare() {
  cd "${srcdir}"
  mkdir build{,-client,-mono}
  cd ${_pkgbase}-$pkgver
}

build() {
  cd "${srcdir}"

  # Core
  cd "${srcdir}"/build
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr/ \
    -DUSE_QT5=ON \
    -DWITH_KDE=OFF \
    -DHAVE_SSL=TRUE \
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
    -DHAVE_SSL=TRUE \
    -DWANT_CORE=OFF \
    -DWANT_QTCLIENT=ON \
    -DWANT_MONO=OFF \
    -DWITH_WEBKIT=OFF \
    -DCMAKE_BUILD_TYPE="Release" \
    ../quassel-${pkgver}/ \
    -Wno-dev
  make

  # Monolithic
  cd "${srcdir}"/build-mono
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr/ \
    -DUSE_QT5=ON \
    -DWITH_KDE=OFF \
    -DHAVE_SSL=TRUE \
    -DWANT_CORE=OFF \
    -DWANT_QTCLIENT=OFF \
    -DWANT_MONO=ON \
    -DWITH_WEBKIT=OFF \
    -DCMAKE_BUILD_TYPE="Release" \
    ../quassel-${pkgver}/ \
    -Wno-dev
  make
}

package_quassel-core-light() {
pkgdesc="Next-generation distributed IRC client - core only (minimal dependencies)"
depends=('qca-qt5' 'qt5-script')
optdepends=('postgresql: PostgreSQL database support')
backup=(etc/conf.d/quassel)
provides=('quassel-core')
install=${_pkgbase}.install
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
  cd "${srcdir}"/build-client

  make DESTDIR="${pkgdir}" install
}

package_quassel-monolithic-light() {
pkgdesc="Next-generation distributed IRC client - monolithic (minimal dependencies)"
depends=('qt5-script')
optdepends=('postgresql: PostgreSQL database support')
provides=('quassel-monolithic')
conflicts=('quassel-client')
  cd "${srcdir}"/build-mono

  make DESTDIR="${pkgdir}" install
}
