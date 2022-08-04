# Maintainer: Cebtenzzre <cebtenzzre (at) gmail (dot) com>
# Contributor: Fabio 'Lolix' Loli <lolix@disroot.org>
# Contributor: Lubosz Sarnecki <lubosz@gmail.com>
# Contributor: Vítor Ferreira <vitor.dominor@gmail.com>

_pkgname=xboxdrv
pkgname=${_pkgname}-cebtenzzre-git
pkgver=0.8.8.r47.gaa0b96e
pkgrel=1
pkgdesc="An XBox/XBox 360 gamepad driver - extended mappings and rumble passthrough"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://gitlab.com/cebtenzzre/xboxdrv"
license=(GPL3)
depends=(libx11 dbus-glib libusb python2)
makedepends=(git scons boost)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://gitlab.com/cebtenzzre/xboxdrv.git#branch=stable"
         'xboxdrv.service'
         'xboxdrv.conf')
sha256sums=('SKIP'
            'd631a8c3af7e2b4ef22f1494ded5d7a8029a8dd9756ef8907f909ef6aa0afc2b'
            '68a286300d28bbfc97eb694c6cc413776f0bc16e35de6d1969f13ef1e7d1cac5')

backup=(etc/conf.d/xboxdrv)

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"
  sed 's|python|python2|g' -i examples/*.py
}

build() {
  cd "$_pkgname"
  scons \
    LINKFLAGS="${LDFLAGS}" \
    CXXFLAGS="${CPPFLAGS} ${CXXFLAGS}" \
    "${MAKEFLAGS}"
}

package() {
  cd "$_pkgname"
  make PREFIX=/usr DESTDIR="$pkgdir" install

  cd "${srcdir}/${_pkgname}"
  install -Dm644 "${srcdir}/${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
  install -Dm644 "${srcdir}/${_pkgname}.conf" "${pkgdir}/etc/conf.d/${_pkgname}"
  install -Dm644 README.md NEWS PROTOCOL -t "${pkgdir}/usr/share/doc/${_pkgname}"
  install -Dm644 examples/* -t "${pkgdir}/usr/share/doc/${_pkgname}/examples"
  install -Dm644 data/org.seul.Xboxdrv.conf -t "${pkgdir}/etc/dbus-1/system.d"
}
