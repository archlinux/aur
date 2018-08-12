# Maintainer: Oleg Shparber <trollixx+aur@gmail.com>
# Contributor: Vesa Kaihlavirta <vegai@iki.fi>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# URL: https://github.com/trollixx/aur-packages

_pkgbase=quassel
pkgbase=${_pkgbase}-light
pkgname=('quassel-client-light' 'quassel-core-light' 'quassel-monolithic-light')
pkgver=0.12.5
pkgrel=4
pkgdesc="Next-generation distributed IRC client (minimal dependencies)"
arch=('i686' 'x86_64')
url="http://quassel-irc.org/"
license=('GPL')
makedepends=('qt5-base' 'qt5-tools' 'extra-cmake-modules' 'cmake' 'ninja')
source=(http://quassel-irc.org/pub/${_pkgbase}-$pkgver.tar.bz2
        ${_pkgbase}.service
        ${_pkgbase}.sysusers
        ${_pkgbase}.tmpfiles
        ${_pkgbase}.conf)
sha256sums=('1894574dfd79654152a5b7427e7df592b055ae908230504f98a4cb48961e74e2'
            '5dbe20290f3361b9b7a74a52905137e76b656976febf2d31082a2276f9dcde7f'
            '3c72441a99e2668c6a8a751fa07beeb44f937576c8a1b5f615e4a55f841d93d9'
            '2afd4340c7713f6533e5d175a86b28fd118ecd907776c2b10925d1a4fb31cdca'
            'f3031ea8217e01ba42cea14606169e3e27affa5918968ffd5a03c21ae92fe2b8')

prepare() {
  cd quassel-${pkgver}
}


_build() (
  mkdir -p build-$1
  cd build-$1
  cmake -G Ninja ../quassel-${pkgver} \
    -DCMAKE_INSTALL_PREFIX=/usr/ \
    -DCMAKE_BUILD_TYPE=Release \
    -DHAVE_SSL=ON \
    -DWITH_KDE=OFF \
    -DWITH_WEBENGINE=OFF \
    -DWITH_OXYGEN=OFF \
    -DUSE_QT5=ON \
    "${@:2}" \
    -Wno-dev
  cmake --build .
)

_install() {
  DESTDIR="${pkgdir}" cmake --build build-$1 --target install
}


build() {
  _build core \
    -DWANT_CORE=ON \
    -DWANT_MONO=OFF \
    -DWANT_QTCLIENT=OFF

  _build client
    -DWANT_CORE=OFF \
    -DWANT_MONO=OFF \
    -DWANT_QTCLIENT=ON

  _build mono
    -DWANT_CORE=OFF \
    -DWANT_MONO=ON \
    -DWANT_QTCLIENT=OFF
}

package_quassel-core-light() {
pkgdesc="Next-generation distributed IRC client - core only (minimal dependencies)"
depends=('qca-qt5' 'qt5-script')
optdepends=('postgresql: PostgreSQL database support')
backup=(etc/conf.d/quassel)
provides=('quassel-core')
conflicts=('quassel-core')

  _install core

  # Remove unneeded pixmap icons
  rm -r "${pkgdir}"/usr/share

  install -Dm644 "${srcdir}"/${_pkgbase}.sysusers \
    "${pkgdir}"/usr/lib/sysusers.d/${_pkgbase}.conf
  install -Dm644 "${srcdir}"/${_pkgbase}.tmpfiles \
    "${pkgdir}"/usr/lib/tmpfiles.d/${_pkgbase}.conf
  install -Dm644 "${srcdir}"/${_pkgbase}.service \
    "${pkgdir}"/usr/lib/systemd/system/${_pkgbase}.service
  install -Dm644 "${srcdir}"/${_pkgbase}.conf \
    "${pkgdir}"/etc/conf.d/${_pkgbase}
}

package_quassel-client-light() {
pkgdesc="Next-generation distributed IRC client - client only (minimal dependencies)"
depends=('qt5-base')
provides=('quassel-client')
conflicts=('quassel-monolithic' 'quassel-client' 'quassel-client-small')
  _install client
}

package_quassel-monolithic-light() {
pkgdesc="Next-generation distributed IRC client - monolithic (minimal dependencies)"
depends=('qt5-script')
optdepends=('postgresql: PostgreSQL database support')
provides=('quassel-monolithic')
conflicts=('quassel-monolothic' 'quassel-client' 'quassel-client-small')
  _install mono
}
