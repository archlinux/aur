pkgbase=caelestia-sddm-git
pkgname=(
  caelestia-sddm-locklike-git
  caelestia-sddm-minimalist-git
  caelestia-sddm-minimalistv2-git
)
pkgver=r135.9e8d36b
pkgrel=1
arch=('any')
url='https://github.com/ItsABigIgloo/caelestia-sddm'
license=('GPL3')
depends=(
  'sddm'
  'qt6-declarative'
  'qt6-5compat'
  'qt6-svg'
  'qt6-virtualkeyboard'
  'ffmpeg'
  'ttf-rubik-vf'
  'ttf-material-symbols-variable'
)
optdepends=(
  'caelestia-shell: dynamic colors and wallpaper sync'
  'caelestia-shell-git: dynamic colors and wallpaper sync (git)'
  'caelestia-cli: color generation for theme sync'
  'caelestia-cli-git: color generation for theme sync (git)'
)
makedepends=('git')
provides=('caelestia-sddm')
install=caelestia-sddm.install
source=("${pkgbase}::git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgbase}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

_package_variant() {
  local variant="$1"

  install -dm755 "$pkgdir/usr/share/sddm/themes/caelestia"

  cp -r "$srcdir/${pkgbase}/themes/$variant"/* \
    "$pkgdir/usr/share/sddm/themes/caelestia/"

  install -Dm755 "$srcdir/${pkgbase}/scripts/sync.sh" \
    "$pkgdir/usr/share/sddm/themes/caelestia/scripts/sync.sh"

  install -Dm644 /dev/stdin "$pkgdir/etc/sddm.conf.d/caelestia.conf" <<DROPIN
[General]
GreeterEnvironment=QML_XHR_ALLOW_FILE_READ=1

[Theme]
Current=caelestia
DROPIN

  find "$pkgdir/usr/share/sddm/themes/caelestia/assets" -type d -exec chmod 755 {} \; 2>/dev/null || true
  find "$pkgdir/usr/share/sddm/themes/caelestia/assets" -type f -exec chmod 644 {} \; 2>/dev/null || true
  chmod 644 "$pkgdir/usr/share/sddm/themes/caelestia/theme.conf" 2>/dev/null || true
}

package_caelestia-sddm-locklike-git() {
  pkgdesc="Caelestia SDDM theme - locklike variant mimicking the original lock screen from caelestia"
  conflicts=('caelestia-sddm' 'caelestia-sddm-minimalist-git' 'caelestia-sddm-minimalistv2-git')
  _package_variant "locklike"
}

package_caelestia-sddm-minimalist-git() {
  pkgdesc="Caelestia SDDM theme - minimalist variant with gradient background and simple design"
  conflicts=('caelestia-sddm' 'caelestia-sddm-locklike-git' 'caelestia-sddm-minimalistv2-git')
  _package_variant "minimalist"
}

package_caelestia-sddm-minimalistv2-git() {
  pkgdesc="Caelestia SDDM theme - minimalistV2 variant with improved fonts and modern design following caelestia's UI style"
  conflicts=('caelestia-sddm' 'caelestia-sddm-locklike-git' 'caelestia-sddm-minimalist-git')
  _package_variant "minimalistV2"
}
