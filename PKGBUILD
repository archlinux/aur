# Caelestia SDDM Theme — AUR PKGBUILD
# Maintainer: haikalllp <https://aur.archlinux.org/account/haikalllp>
# Maintainer: leithXD <https://aur.archlinux.org/account/leithXD>
# Source: https://github.com/ItsABigIgloo/caelestia-sddm

pkgbase=caelestia-sddm-git
pkgname=(
  caelestia-sddm-locklike-git       # Mimics the original Caelestia lock screen
  caelestia-sddm-minimalist-git     # Minimalist variant with gradient background
  caelestia-sddm-minimalistv2-git   # Minimalist variant with improved fonts and UI
)
pkgver=r168.f064389
pkgrel=1
arch=('any')
url='https://github.com/ItsABigIgloo/caelestia-sddm'
license=('GPL3')
depends=(
  'sddm'
  'qt6-declarative'
  'qt6-5compat'
  'qt6-svg'
  'ttf-rubik-vf'
  'ttf-material-symbols-variable'
  'ttf-roboto'
  'ttf-cascadia-code-nerd'
)
optdepends=(
  'caelestia-shell: dynamic colors and wallpaper sync'
  'caelestia-shell-git: dynamic colors and wallpaper sync (git)'
  'caelestia-cli: color generation for theme sync'
  'caelestia-cli-git: color generation for theme sync (git)'
)
makedepends=('git')
provides=('caelestia-sddm')
replaces=('caelestia-sddm')
install=caelestia-sddm.install
source=("${pkgbase}::git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgbase}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

# Installs a theme variant into /usr/share/sddm/themes/caelestia
# and drops an SDDM config that sets caelestia as the active theme with necessary environment variables
_package_variant() {
  local variant="$1"
  local theme_dir="$pkgdir/usr/share/sddm/themes/caelestia"
  local src_dir="$srcdir/${pkgbase}"

  install -dm755 "$theme_dir"
  cp -r "$src_dir/themes/$variant"/* "$theme_dir/"

  install -Dm755 "$src_dir/scripts/sync.sh" \
    "$theme_dir/scripts/sync.sh"

  install -Dm644 /dev/stdin "$pkgdir/etc/sddm.conf.d/caelestia.conf" <<DROPIN
[General]
GreeterEnvironment=QML_XHR_ALLOW_FILE_READ=1,QT_QPA_PLATFORM=xcb

[Theme]
Current=caelestia
DROPIN

  find "$theme_dir/assets" -type d -exec chmod 755 {} + 2>/dev/null || true
  find "$theme_dir/assets" -type f -exec chmod 644 {} + 2>/dev/null || true
  chmod 644 "$theme_dir/theme.conf" 2>/dev/null || true
}

# Variants conflict with each other as they share the same install path
package_caelestia-sddm-locklike-git() {
  pkgdesc='Caelestia SDDM theme - locklike variant mimicking the original lock screen'
  conflicts=('caelestia-sddm' 'caelestia-sddm-minimalist-git' 'caelestia-sddm-minimalistv2-git')
  _package_variant 'locklike'
}

package_caelestia-sddm-minimalist-git() {
  pkgdesc='Caelestia SDDM theme - minimalist variant with gradient background'
  conflicts=('caelestia-sddm' 'caelestia-sddm-locklike-git' 'caelestia-sddm-minimalistv2-git')
  _package_variant 'minimalist'
}

package_caelestia-sddm-minimalistv2-git() {
  pkgdesc='Caelestia SDDM theme - minimalistV2 variant with improved fonts and UI'
  conflicts=('caelestia-sddm' 'caelestia-sddm-locklike-git' 'caelestia-sddm-minimalist-git')
  _package_variant 'minimalistV2'
}
