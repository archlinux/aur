# Maintainer: Lyra OS <team@lyraos.org>
#
# AUR-oriented PKGBUILD. It builds the tagged Vega release, but can be
# pointed at another checkout/source via VEGA_SOURCE_URL and VEGA_SOURCE_DIR
# for local builds.

pkgname=vegad
pkgver=1.4.0
pkgrel=1
pkgdesc="Daemon privilegiado do Vega, centro de controle para Linux"
arch=('x86_64')
url="https://github.com/britors/Vega"
license=('GPL-3.0-only')
depends=('systemd' 'dbus' 'polkit' 'pacman' 'bluez' 'bluez-obex')
optdepends=(
  'snapper: snapshots automáticos antes de operações do sistema'
  'flatpak: cache e atualizações do módulo Software'
  'restic: suporte ao módulo Backup'
  'firewalld: firewall do módulo Rede'
  'fwupd: status de firmware no módulo Hardware'
  'networkmanager: estado de rede no módulo Rede'
  'yay: instalação de pacotes AUR (origem Comunidade) no módulo Software'
  'paru: alternativa a yay para pacotes AUR (origem Comunidade)'
  'reflector: otimização de mirrors do Pacman no módulo Software'
)
provides=('lyraed')
conflicts=('lyraed')
makedepends=('go')
install=vegad.install
_source_url_default="git+https://github.com/britors/Vega.git#tag=v${pkgver}"
source=("Vega::${VEGA_SOURCE_URL:-${_source_url_default}}")
sha256sums=('SKIP')

build() {
  local _srcroot="${VEGA_SOURCE_DIR:-$srcdir/Vega}"
  cd "$_srcroot/vegad"
  go build -trimpath -ldflags "-X github.com/lyraos/vegad/internal/version.Version=${pkgver}" \
    -o vegad ./cmd/vegad
}

package() {
  local _srcroot="${VEGA_SOURCE_DIR:-$srcdir/Vega}"
  cd "$_srcroot"

  install -Dm755 vegad/vegad "$pkgdir/usr/lib/vega/vegad"
  install -Dm644 packaging/vegad/vegad.service \
    "$pkgdir/usr/lib/systemd/system/vegad.service"
  install -Dm644 packaging/vegad/vegad-update-check.service \
    "$pkgdir/usr/lib/systemd/system/vegad-update-check.service"
  install -Dm644 packaging/vegad/vegad-update-check.timer \
    "$pkgdir/usr/lib/systemd/system/vegad-update-check.timer"
  install -Dm644 packaging/vegad/org.lyraos.Vega1.conf \
    "$pkgdir/usr/share/dbus-1/system.d/org.lyraos.Vega1.conf"
  install -Dm644 packaging/vegad/org.lyraos.Vega1.service \
    "$pkgdir/usr/share/dbus-1/system-services/org.lyraos.Vega1.service"
  install -Dm644 packaging/vegad/org.lyraos.vega.policy \
    "$pkgdir/usr/share/polkit-1/actions/org.lyraos.vega.policy"
  install -Dm644 packaging/vegad/sysusers.d/vega-build.conf \
    "$pkgdir/usr/lib/sysusers.d/vega-build.conf"
  install -Dm644 packaging/vegad/tmpfiles.d/vega-build.conf \
    "$pkgdir/usr/lib/tmpfiles.d/vega-build.conf"
  install -Dm440 packaging/vegad/sudoers.d/vega-build \
    "$pkgdir/etc/sudoers.d/vega-build"
}
