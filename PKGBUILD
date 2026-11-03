# Maintainer: MorpheFlow Contributors <https://github.com/wiwek13/morpheflow-portal>
# AUR package for the MorpheFlow self-hosted backend (FastAPI on :8080).
# -git variant: upstream publishes no version tags yet, so this tracks main.
# Once version tags exist, a stable 'morpheflow' PKGBUILD can use:
#   source=("morpheflow-${pkgver}.tar.gz::https://github.com/wiwek13/morpheflow-portal/archive/refs/tags/v${pkgver}.tar.gz")
pkgname=morpheflow-git
pkgver=r0.0000000
pkgrel=1
pkgdesc="Self-hosted edge management portal and build pipeline for Android packages (FastAPI + Morphe)"
arch=('x86_64' 'aarch64')
url="https://github.com/wiwek13/morpheflow-portal"
license=('MIT')
depends=('python>=3.11' 'jre21-openjdk-headless' 'curl')
makedepends=('git')
provides=('morpheflow')
conflicts=('morpheflow')
install=morpheflow.install
source=("git+https://github.com/wiwek13/morpheflow-portal.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/morpheflow-portal"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  local src="$srcdir/morpheflow-portal"

  install -dm755 "$pkgdir/opt/morpheflow"
  cp -a "$src/web" "$src/scripts" "$src/defaults" "$src/requirements.txt" "$pkgdir/opt/morpheflow/"

  # never ship bytecode caches
  find "$pkgdir/opt/morpheflow" -name '__pycache__' -type d -prune -exec rm -rf {} + 2>/dev/null || true

  install -Dm644 "$src/packaging/morpheflow.service" "$pkgdir/usr/lib/systemd/system/morpheflow.service"
  install -Dm644 "$src/packaging/morpheflow.sysusers" "$pkgdir/usr/lib/sysusers.d/morpheflow.conf"
  install -Dm644 "$src/packaging/morpheflow.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/morpheflow.conf"
}
