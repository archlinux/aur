# Maintainer: Sankalp Tharu <sankalptharu50028@gmail.com>

pkgname=keyvibe-git
pkgver=0.1.0.r0.g00ea0f0
pkgrel=1
pkgdesc="C-based CLI that plays mechanical keyboard sounds on keystrokes"
arch=('x86_64' 'aarch64')
url="https://github.com/S4NKALP/KeyVibe"
license=('MIT')
depends=(
  'libpulse'
  'json-c'
  'libsndfile'
  'libinput'
  'libevdev'
  'systemd-libs' # libudev
)
makedepends=(
  'git'
  'make'
  'gcc'
  'pkgconf'
  'systemd'    # provides libudev.pc headers for compilation
)
provides=('keyvibe')
conflicts=('keyvibe')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/KeyVibe"
  git describe --long --tags --always 2>/dev/null | sed 's/^v//; s/-/.r/; s/-/./'
}

build() {
  cd "${srcdir}/KeyVibe"
  make -j"$(nproc)"
}

package() {
  cd "${srcdir}/KeyVibe"

  install -Dm755 keyvibe "${pkgdir}/usr/bin/keyvibe"
  install -Dm755 keyvibe-audio "${pkgdir}/usr/bin/keyvibe-audio"
  install -Dm755 keyvibe-input "${pkgdir}/usr/bin/keyvibe-input"

  install -d "${pkgdir}/usr/share/keyvibe"
  cp -r audio "${pkgdir}/usr/share/keyvibe/"

  install -Dm644 /dev/stdin "${pkgdir}/usr/lib/udev/rules.d/99-keyvibe-allow-keyboard.rules" <<'EOF'
# Allow non-root access to input event devices for active seat users and input group
SUBSYSTEM=="input", KERNEL=="event*", TAG+="uaccess", GROUP="input", MODE="0660"
EOF

  install -Dm755 /dev/stdin "${pkgdir}/usr/share/libalpm/scripts/keyvibe-udev-reload" <<'EOF'
#!/bin/sh
set -e
udevadm control --reload-rules >/dev/null 2>&1 || true
udevadm trigger --subsystem-match=input --action=change >/dev/null 2>&1 || true
EOF

  install -Dm644 /dev/stdin "${pkgdir}/usr/share/libalpm/hooks/keyvibe-udev-reload.hook" <<'EOF'
[Trigger]
Type=File
Operation=Install
Operation=Upgrade
Operation=Remove
Target=/usr/lib/udev/rules.d/99-keyvibe-allow-keyboard.rules

[Action]
Description=Reload udev rules for keyvibe input access
When=PostTransaction
Exec=/usr/share/libalpm/scripts/keyvibe-udev-reload
Depends=systemd
EOF

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
