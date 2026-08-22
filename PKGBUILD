# Maintainer: simplyyjessie <simplyyjessie@pm.me>
# Contributor: xi-ve <zunavs@gmail.com> (original openvr-lighthouse-manager-linux)
pkgname=simply-lighthouse-manager
pkgver=1.3.0
pkgrel=1
pkgdesc="Manage SteamVR base station (lighthouse) power via Bluetooth LE - works with SteamVR, WiVRn and Monado"
arch=('x86_64')
url="https://github.com/SimplyJustJessie/simply-lighthouse-manager"
license=('GPL-3.0-or-later' 'BSD-3-Clause')
depends=('glfw' 'dbus' 'bluez')
makedepends=('cmake' 'pkgconf')
provides=('openvr-lighthouse-manager-linux')
conflicts=('openvr-lighthouse-manager-linux')
install="${pkgname}.install"
_openvrver=2.5.1
# Project tarball is pinned to a release tag; update its checksum with
# `updpkgsums` on each release. The OpenVR checksum only changes when
# _openvrver is bumped.
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "openvr-${_openvrver}.tar.gz::https://github.com/ValveSoftware/openvr/archive/refs/tags/v${_openvrver}.tar.gz")
sha256sums=('b9231f9f7e0915c5b26edbe269637223ac93b976b7fe64f8b3f5385d908df8c0'
            '54f654fce001682d8ac608f544a6c41e03a672b005c1deca3579fa36480a537c')

build() {
  cd "${pkgname}-${pkgver}"

  # Deliberately built against the pinned OpenVR SDK, NOT the Arch openvr
  # package: distro openvr headers routinely request newer OpenVR interfaces
  # than the installed SteamVR runtime provides, which makes VR_Init fail
  # with InterfaceNotFound (105). The pinned SDK's interfaces are supported
  # by every modern SteamVR, and its loader library ships in the package
  # (resolved via the binaries' $ORIGIN rpath).
  cmake -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DOPENVR_ROOT="${srcdir}/openvr-${_openvrver}" \
    -DLIGHTHOUSE_BUNDLE_OPENVR=ON
  cmake --build build --parallel
}

package() {
  cd "${pkgname}-${pkgver}"

  DESTDIR="${pkgdir}" cmake --install build

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/openvr-${_openvrver}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-openvr"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
