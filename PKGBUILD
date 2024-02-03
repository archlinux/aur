# Maintainer: Tin Lai  <soraxas at tinyiu.com>
pkgname=mcontrolcenter-git
_pkgname=mcontrolcenter
_camel_pkgname=MControlCenter
pkgver=r267.a23f483
pkgrel=2
pkgdesc="MControlCenter is a Free and Open Source GNU/Linux application that allows you to change the settings of MSI laptops"
arch=('x86_64')
url="https://github.com/dmitry-s93/MControlCenter"
license=('GPL')
depends=('qt5-tools' 'acpi_ec')
makedepends=()
source=("git+https://github.com/dmitry-s93/MControlCenter")
md5sums=('SKIP')
provides=('mcontrolcenter')
conflict=()

pkgver() {
  cd "$srcdir/$_camel_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${_camel_pkgname}
  cmake -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -B build

  make -Cbuild -j
}

package() {
    install -Dm 644 ../modprobe.d__mcontrolcenter-ec_sys.conf "${pkgdir}/etc/modprobe.d/mcontrolcenter-ec_sys.conf"
    install -Dm 644 ../modules-load.d__mcontrolcenter-ec_sys.conf "${pkgdir}/etc/modules-load.d/mcontrolcenter-ec_sys.conf"

    cd "$srcdir/$_camel_pkgname"

    make -Cbuild DESTDIR="$pkgdir" install
    # create a symlink in libexec that point to the helper
    install -dm644 "${pkgdir}/usr/libexec/"
    ln -s "/usr/bin/mcontrolcenter-helper" "${pkgdir}/usr/libexec/mcontrolcenter-helper"

    # licenses
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

    # Desktop file
    install -Dm644 "resources/${_pkgname}.desktop"\
            "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "resources/${_pkgname}.svg"\
            "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.svg"

    # dbus services files
    install -Dm644 "src/helper/mcontrolcenter-helper.conf"\
            "${pkgdir}/usr/share/dbus-1/system.d/mcontrolcenter-helper.conf"
    install -Dm644 "src/helper/mcontrolcenter.helper.service"\
            "${pkgdir}/usr/share/dbus-1/system-services/mcontrolcenter.helper.service"
}
