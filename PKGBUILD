# Maintainer: Tanishq (Trifalic47) <trifalicapt@gmail.com>
pkgname=rmpv-git
pkgver=r33.17e0018
pkgrel=2
pkgdesc="Terminal-based mpv YouTube/music player with yt-dlp streaming and download support"
arch=('any')
url="https://github.com/Trifalic47/rmpv"
license=('MIT')
# rmpc removed from depends to prevent installation failure
depends=('mpv' 'yt-dlp' 'mpc' 'mpd' 'rofi')
makedepends=('git')
optdepends=('rmpc: for rmpc integration support')
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
  for _bin in rmpv rmpv-play rmpv-search; do
    install -Dm755 "bin/$_bin" "$pkgdir/usr/bin/$_bin"
  done

  # ── Setup script ──────────────────────────────────────
  install -Dm755 scripts/rmpv-setup.sh "$pkgdir/usr/bin/rmpv-setup"

  # ── Data files (Templates) ────────────────────────────
  # Using find to preserve structure and set correct permissions
  # This creates /usr/share/rmpv/dots/...
  find dots -type f -exec install -Dm644 "{}" "$pkgdir/usr/share/rmpv/{}" \;

  # ── License & Documentation ───────────────────────────
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

  # Ensure the license is installed (Standard AUR requirement for MIT)
  if [ -f LICENSE ]; then
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  fi
}
