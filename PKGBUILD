pkgname=luminahud-git
pkgver=r7.04952ab
pkgrel=1
pkgdesc="IMGUI BACKGROUND HUD"
arch=('x86_64')
url="https://github.com/delmath/LuminaHUD"
license=('MIT')

depends=('glfw-x11' 'libx11' 'mesa')
makedepends=('git' 'gcc')

source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/LuminaHUD"
  local rev_count=$(git rev-list --count HEAD 2>/dev/null)
  local short_rev=$(git rev-parse --short HEAD 2>/dev/null)
  if [ -n "$rev_count" ] && [ -n "$short_rev" ]; then
    printf "r%s.%s" "$rev_count" "$short_rev"
  else
    printf "r%s.%s" "$(git log -1 --format=%ct 2>/dev/null || date +%s)" "unknown"
  fi
}

prepare() {
  cd "$srcdir/LuminaHUD"
  # On s'assure que le sous-module ImGui est bien récupéré et à jour
  git submodule update --init --recursive
}

build() {
  cd "$srcdir/LuminaHUD"
  make
}

package() {
  cd "$srcdir/LuminaHUD"
  make DESTDIR="$pkgdir" PREFIX="/usr" install
}
