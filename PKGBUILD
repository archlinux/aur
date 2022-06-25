# Maintainer: Daniel Langbein < daniel [ at ] systemli [ dot ] org >
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname='kclock'
pkgver=22.06
pkgrel=1
pkgdesc='Convergent clock application for Plasma'
arch=('x86_64' 'aarch64')
url='https://invent.kde.org/plasma-mobile/kclock'
license=('GPL2')

# See $url/CMakeLists.txt for more information
# why these dependencies are required.
#
#   From the "find_package(KF5 ...)" block:
#     kconfig: Config
#     ki18n: I18n
#     kcoreaddons: CoreAddons
#     plasma-framework: Plasma
#     kirigami2: Kirigami2
#     knotifications: Notifications
#     kdbusaddons: DBusAddons
#
#   kirigami-addons: ecm_find_qmlmodule(org.kde.kirigamiaddons.datetime 0.1)
#   hicolor-icon-theme: kclock.svg is placed inside .../hicolor/...
#
depends=(kconfig ki18n kcoreaddons plasma-framework kirigami2 knotifications kdbusaddons kirigami-addons hicolor-icon-theme)

makedepends=('extra-cmake-modules')
provides=('kclockd')  # as well as kclock (pkgname)
conflicts=('kclock' 'kclockd')
source=("${url}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('2b8a98c3256053ee0a2d877b3d7653cf3858c8cb891e195e8430e27ab759fa80')

build() {
  cmake -B 'build' -S "${pkgname}-v${pkgver}" \
    -DBUILD_TESTING=OFF
  make -C 'build'
}

package() {
  make DESTDIR="${pkgdir}" PREFIX='/usr' -C 'build' install
  install -Dvm644 "${pkgname}-v${pkgver}/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
