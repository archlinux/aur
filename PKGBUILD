# Maintainer: Sankalp <sankalptharu50028@gmail.com>

pkgname=vbx-git
pkgver=0.2.0.r47.93491af
pkgrel=1
pkgdesc="C-based CLI that plays mechanical keyboard sounds on keystrokes"
arch=('x86_64' 'aarch64')
url="https://github.com/S4NKALP/vbx"
license=('MIT')
depends=(
  'libpulse'
  'json-c'
  'libsndfile'
  'libinput'
  'libevdev'
  'systemd-libs' # libudev
  'acl' # for setfacl command in install script
)
makedepends=(
  'git'
  'make'
  'gcc'
  'pkgconf'
  'systemd'    # provides libudev.pc headers for compilation
)
provides=('vbx')
conflicts=('vbx')
install="${pkgname}.install"
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/vbx"
  # Generate version dynamically for -git package
  printf "0.2.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/vbx"
  make -j"$(nproc)"
}

package() {
  cd "${srcdir}/vbx"

  # Install binaries
  install -Dm755 vbx "${pkgdir}/usr/bin/vbx"
  install -Dm755 audio "${pkgdir}/usr/bin/vbx-audio"
  install -Dm755 input "${pkgdir}/usr/bin/vbx-input"

  # Install shared data (soundpacks)
  install -d "${pkgdir}/usr/share/vbx"
  cp -r soundpacks "${pkgdir}/usr/share/vbx/"

  # udev rule for access to input devices (install to /etc/udev/rules.d/ like Makefile)
  install -Dm644 /dev/stdin "${pkgdir}/etc/udev/rules.d/99-vbx-allow-keyboard.rules" << 'EOF'
# Allow non-root access to input event devices for active seat users and input group
SUBSYSTEM=="input", KERNEL=="event*", TAG+="uaccess", GROUP="input", MODE="0660"
EOF

  # License
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
