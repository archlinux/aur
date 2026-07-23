# Maintainer: Alfonso de la Guarda <alfonsodg@gmail.com>
# Contributor: PXDiv <https://github.com/PXDiv>

pkgname=div-acer-manager-max
pkgver=1.0.2
pkgrel=1
pkgdesc="Feature-rich Linux GUI utility for Acer laptops (NitroSense/PredatorSense) with fan control, thermal profiles, and RGB"
arch=('x86_64')
url="https://github.com/PXDiv/Div-Acer-Manager-Max"
license=('GPL-3.0-or-later')
depends=(
  'dkms'
  'systemd'
  'hicolor-icon-theme'
)
optdepends=(
  'evtest: for Nitro/PredatorSense button detection'
  'linux-headers: kernel headers for driver compilation'
  'linux-cachyos-headers: CachyOS kernel headers'
  'linux-zen-headers: Zen kernel headers'
  'linux-lts-headers: LTS kernel headers'
  'clang: required for LLVM-compiled kernels (CachyOS, etc.)'
  'llvm: required for LLVM-compiled kernels'
  'lld: required for LLVM-compiled kernels'
)
provides=('linuwu-sense-dkms' 'damx')
conflicts=('linuwu-sense-dkms')
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.xz::https://github.com/PXDiv/Div-Acer-Manager-Max/releases/download/${pkgver}-h1/DAMX-${pkgver}.tar.xz")
sha256sums=('9706f741281c041e17f221d78d2c8627366538dc281e6c90d4859d1393d7db1e')

package() {
  cd "${srcdir}/DAMX-${pkgver}"

  # --- DKMS driver (Linuwu-Sense) ---
  local _dkmsdir="${pkgdir}/usr/src/linuwu_sense-${pkgver}"
  install -Dm644 Linuwu-Sense/src/linuwu_sense.c "${_dkmsdir}/linuwu_sense.c"
  install -Dm644 /dev/stdin "${_dkmsdir}/Makefile" << 'EOF'
obj-m := linuwu_sense.o
EOF
  install -Dm644 /dev/stdin "${_dkmsdir}/dkms.conf" << EOF
PACKAGE_NAME="linuwu_sense"
PACKAGE_VERSION="${pkgver}"
BUILT_MODULE_NAME[0]="linuwu_sense"
BUILT_MODULE_LOCATION[0]="."
DEST_MODULE_LOCATION[0]="/kernel/drivers/platform/x86"
MAKE[0]="'make' -C /lib/modules/\${kernelver}/build M=\${dkms_tree}/\${PACKAGE_NAME}/\${PACKAGE_VERSION}/build modules \$(grep -q CONFIG_CC_IS_CLANG=y /lib/modules/\${kernelver}/build/.config 2>/dev/null && echo LLVM=1)"
AUTOINSTALL="yes"
EOF

  # --- Modprobe blacklist for acer_wmi ---
  install -Dm644 /dev/stdin "${pkgdir}/usr/lib/modprobe.d/${pkgname}.conf" << 'EOF'
blacklist acer_wmi
EOF

  # --- Linuwu-Sense systemd service ---
  install -Dm644 Linuwu-Sense/linuwu_sense.service \
    "${pkgdir}/usr/lib/systemd/system/linuwu_sense.service"

  # --- DAMX Daemon ---
  install -Dm755 DAMX-Daemon/DAMX-Daemon "${pkgdir}/opt/damx/daemon/DAMX-Daemon"
  install -Dm644 /dev/stdin "${pkgdir}/usr/lib/systemd/system/damx-daemon.service" << EOF
[Unit]
Description=DAMX Daemon for Acer laptops
After=network.target

[Service]
Type=simple
ExecStart=/opt/damx/daemon/DAMX-Daemon
Restart=on-failure
RestartSec=5
User=root
StandardOutput=journal
StandardError=journal

[Install]
WantedBy=multi-user.target
EOF

  # --- DAMX GUI ---
  install -Dm755 DAMX-GUI/DivAcerManagerMax "${pkgdir}/opt/damx/gui/DivAcerManagerMax"
  install -Dm644 DAMX-GUI/icon.png "${pkgdir}/opt/damx/gui/icon.png"
  install -Dm644 DAMX-GUI/iconTransparent.png "${pkgdir}/opt/damx/gui/iconTransparent.png"

  # --- CLI launcher ---
  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/damx" << 'EOF'
#!/bin/bash
exec /opt/damx/gui/DivAcerManagerMax "$@"
EOF

  # --- Desktop entry ---
  install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/damx.desktop" << 'EOF'
[Desktop Entry]
Name=DAMX
Comment=Div Acer Manager Max - Acer Laptop Management
Exec=/opt/damx/gui/DivAcerManagerMax
Icon=damx
Terminal=false
Type=Application
Categories=Utility;System;HardwareSettings;
Keywords=acer;laptop;fan;thermal;nitro;predator;
EOF

  # --- Icon ---
  install -Dm644 DAMX-GUI/icon.png \
    "${pkgdir}/usr/share/icons/hicolor/256x256/apps/damx.png"

  # --- Nitro key detection script ---
  install -Dm755 nitro-key-detection.sh \
    "${pkgdir}/opt/damx/nitro-key-detection.sh"

  install -Dm644 /dev/stdin "${pkgdir}/usr/lib/systemd/system/nitro-key-detection.service" << 'EOF'
[Unit]
Description=Nitro/PredatorSense Key Detection Service
After=multi-user.target

[Service]
Type=simple
ExecStart=/opt/damx/nitro-key-detection.sh
Restart=always
RestartSec=10
StandardOutput=journal
StandardError=journal
User=root

[Install]
WantedBy=multi-user.target
EOF

  # --- tmpfiles.d for permissions ---
  install -Dm644 /dev/stdin "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf" << 'EOF'
# Create damx config directory
d /etc/damx 0755 root root -
EOF
}
