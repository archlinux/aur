# Maintainer: Your Name <you@example.com>

pkgname=roboclaw-studio-git
pkgver=0.1.0.r2.gec5ea8b
pkgrel=4
pkgdesc="Unofficial Linux GUI for Basicmicro RoboClaw Motion Studio"
arch=('x86_64')
url="https://github.com/lazytatzv/motion_studio"
license=('MIT')
depends=('webkit2gtk' 'gtk3')
makedepends=('git' 'nodejs' 'pnpm' 'rust')
source=("${pkgname}::git+https://github.com/lazytatzv/motion_studio.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "0.1.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  pnpm install --frozen-lockfile
  pnpm tauri build --bundles deb
}

package() {
  cd "$srcdir/$pkgname"

  bsdtar -xf src-tauri/target/release/bundle/deb/roboclaw-studio_*.deb -C "$pkgdir"

  # Override desktop entry (optional)
  install -Dm644 packaging/aur/motion-studio.desktop \
    "$pkgdir/usr/share/applications/roboclaw-studio.desktop"

}
