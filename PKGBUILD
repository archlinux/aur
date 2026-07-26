# Maintainer: Movacx <movacx@users.noreply.github.com>

pkgname=bc250-control-center-git
pkgver=1.17.21
pkgrel=4
pkgdesc='Graphical control center for AMD BC-250 community tools'
arch=('any')
url='https://github.com/movacx/bc250-control-center'
license=('MIT')
depends=(
  'python'
  'python-pyqt6'
  'python-psutil'
  'lm_sensors'
  'stress'
  'git'
  'pciutils'
)
makedepends=('git')
optdepends=(
  'cyan-skillfish-governor-smu: SMU/D-Bus GPU governor support for BC-250'
  'umr: AMDGPU register access for 40CU live manager'
  'yay: optional AUR dependency helper used by the GUI'
  'paru: optional AUR dependency helper used by the GUI'
  'libnotify: desktop notifications through notify-send'
  'polkit: graphical authentication for elevated actions'
  'python-evdev: preferred Linux gamepad input backend'
  'vulkan-tools: Vulkan diagnostics'
  'mesa-utils: OpenGL diagnostics'
  'nct6687d-dkms-git: experimental PWM fan control on BC-250'
)
provides=('bc250-control-center')
conflicts=('bc250-control-center')
source=('git+https://github.com/movacx/bc250-control-center.git')
sha256sums=('SKIP')
install=bc250-control-center.install

pkgver() {
  cd "$srcdir/bc250-control-center"
  local exact
  if exact="$(git describe --tags --exact-match 2>/dev/null)"; then
    printf '%s\n' "${exact#v}"
    return
  fi
  git describe --long --tags --always 2>/dev/null | sed 's/^v//;s/-/.r/;s/-/./'
}

package() {
  cd "$srcdir/bc250-control-center"

  install -dm755 "$pkgdir/usr/share/bc250-control-center"
  cp -a mvc "$pkgdir/usr/share/bc250-control-center/"

  install -Dm755 scripts/bc250-control-center "$pkgdir/usr/bin/bc250-control-center"
  install -Dm755 scripts/bc250-control-centerd "$pkgdir/usr/bin/bc250-control-centerd"
  install -Dm755 mvc/Resources/privileged/bc250-fan-pwm-helper \
    "$pkgdir/usr/libexec/bc250-control-center/bc250-fan-pwm-helper"
  install -Dm644 packaging/common/polkit/io.github.movacx.bc250-control-center.policy \
    "$pkgdir/usr/share/polkit-1/actions/io.github.movacx.bc250-control-center.policy"

  for size in 32 48 64 128 256 512 1024; do
    install -Dm644 "mvc/Resources/icons/bc250-control-center-${size}.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/bc250-control-center.png"
  done

  install -Dm644 packaging/common/desktop/io.github.movacx.bc250-control-center.desktop \
    "$pkgdir/usr/share/applications/io.github.movacx.bc250-control-center.desktop"
  install -Dm644 packaging/common/metainfo/io.github.movacx.bc250-control-center.metainfo.xml \
    "$pkgdir/usr/share/metainfo/io.github.movacx.bc250-control-center.metainfo.xml"
  install -Dm644 packaging/common/systemd-user/bc250-control-centerd.service \
    "$pkgdir/usr/lib/systemd/user/bc250-control-centerd.service"

  install -Dm644 README.md "$pkgdir/usr/share/doc/bc250-control-center/README.md"
  install -Dm644 docs/ARQUITECTURA_MVC.md "$pkgdir/usr/share/doc/bc250-control-center/ARQUITECTURA_MVC.md"
  install -Dm644 docs/THIRD_PARTY_NOTICES.md "$pkgdir/usr/share/doc/bc250-control-center/THIRD_PARTY_NOTICES.md"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
