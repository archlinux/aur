# Maintainer: Tanishq (Trifalic47) <trifalicapt@gmail.com>
pkgname=rmpv-git
pkgver=r33.17e0018
pkgrel=1
pkgdesc="Terminal-based mpv YouTube/music player with rmpc integration"
arch=('any')
url="https://github.com/Trifalic47/rmpv"
license=('MIT')
depends=('mpv' 'yt-dlp' 'mpc' 'mpd' 'rmpc' 'rofi')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$pkgname"

  # ── Binaries ──────────────────────────────────────────
  # Using a loop makes it cleaner and easier to maintain
  for _bin in rmpv rmpv-play rmpv-search; do
    install -Dm755 "bin/$_bin" "$pkgdir/usr/bin/$_bin"
  done

  # ── Setup script ──────────────────────────────────────
  install -Dm755 scripts/rmpv-setup.sh "$pkgdir/usr/bin/rmpv-setup"

  # ── Data files (Templates) ────────────────────────────
  # Avoid 'cp -r' directly into pkgdir when possible to ensure correct 
  # directory permissions (755) and file permissions (644)
  find dots -type f -exec install -Dm644 "{}" "$pkgdir/usr/share/rmpv/{}" \;

  # ── License & Documentation ───────────────────────────
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
