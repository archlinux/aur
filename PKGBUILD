# Maintainer: Lyra OS <team@lyraos.org>
#
# AUR-oriented PKGBUILD. It defaults to the tagged Vega source, but can
# be pointed at another checkout/source via VEGA_SOURCE_URL and VEGA_SOURCE_DIR.

pkgname=vegad
pkgver=0.0
pkgrel=1
pkgdesc="Daemon privilegiado do Vega, centro de controle do Lyra OS"
arch=('x86_64')
url="https://github.com/britors/Vega"
license=('GPL-3.0-only')
depends=('systemd' 'dbus' 'polkit' 'pacman')
optdepends=(
  'snapper: snapshots automáticos antes de operações do sistema'
  'flatpak: cache e atualizações do módulo Software'
  'restic: suporte ao módulo Backup'
  'firewalld: firewall do módulo Rede'
  'fwupd: status de firmware no módulo Hardware'
  'networkmanager: estado de rede no módulo Rede'
)
provides=('lyraed')
conflicts=('lyraed')
makedepends=('go')
install=vegad.install
_source_url_default="git+https://github.com/britors/Vega.git#branch=main"
source=("Vega::${VEGA_SOURCE_URL:-${_source_url_default}}")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/Vega"
  local count hash tag
  count="$(git rev-list --count HEAD)"
  hash="$(git rev-parse --short HEAD)"
  tag="$(git describe --tags --abbrev=0 2>/dev/null || true)"
  if [[ -n "$tag" ]]; then
    printf '%s.r%s.g%s' "${tag#v}" "$count" "$hash"
  else
    printf '0.0.r%s.g%s' "$count" "$hash"
  fi
}

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
  install -Dm644 packaging/vegad/org.lyraos.Vega1.conf \
    "$pkgdir/usr/share/dbus-1/system.d/org.lyraos.Vega1.conf"
  install -Dm644 packaging/vegad/org.lyraos.Vega1.service \
    "$pkgdir/usr/share/dbus-1/system-services/org.lyraos.Vega1.service"
  install -Dm644 packaging/vegad/org.lyraos.vega.policy \
    "$pkgdir/usr/share/polkit-1/actions/org.lyraos.vega.policy"
  install -Dm644 packaging/vegad/sysusers.d/vega-build.conf \
    "$pkgdir/usr/lib/sysusers.d/vega-build.conf"
}
