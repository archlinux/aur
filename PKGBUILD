# Maintainer: oi_wtf <brainpower at mailbox dot org>

pkgname=tuxedo-touchpad-switch
pkgver=1.0.1
pkgrel=2
pkgdesc="A Linux userspace driver to enable and disable the touchpads on TongFang/Uniwill laptops"
url="https://github.com/tuxedocomputers/tuxedo-touchpad-switch"
arch=(x86_64)
license=(GPL3)

depends=("glib2")
makedepends=("git" "cmake" "ninja")

provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")

#https://github.com/tuxedocomputers/tuxedo-touchpad-switch/archive/v$pkgver/${pkgname}-${pkgver}.tar.gz
source=(
  git+https://github.com/tuxedocomputers/tuxedo-touchpad-switch.git#commit=3f90c9c6c1e51f6d8538877d2f15677ce39b167b
)
sha256sums=(SKIP)
#sha256sums=('dd4fa6871735fed3e094f177f0a2d0861fd3411ef4e6fbf1fbba5405a01ae219')

prepare() {
  cd "${pkgname}"

  cat >> "res/99-tuxedo-touchpad-switch.rules" <<EOF
KERNELS=="i2c-UNIW0001:00", SUBSYSTEMS=="i2c", DRIVERS=="i2c_hid_acpi", ATTRS{name}=="UNIW0001:00", SUBSYSTEM=="hidraw", MODE="0622"
EOF

}

build() {
  cd "${pkgname}"

  cmake -B builddir -G Ninja \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo

  ninja -C builddir
}

package() {
  cd "${pkgname}"

  DESTDIR="${pkgdir}" ninja -C builddir install
}
