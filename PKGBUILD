# Maintainer: Jotalea <main@jotalea.com.ar>
pkgname=jotawm-keybinds-git
pkgver=2026.09.17.r122.631ea22
pkgrel=1
pkgdesc="Always-on-top popup showing jotawm's keybinds"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/jotalea/jotawm"
license=('BSD-3-Clause')
depends=('fontconfig')
makedepends=('go' 'git')
optdepends=('ttf-jetbrains-mono-nerd: default font')
provides=('jotawm-keybinds')
conflicts=('jotawm-keybinds')
source=("jotawm::git+https://github.com/jotalea/jotawm.git")
sha256sums=('SKIP')
options=(!debug !lto)

pkgver() {
  cd "$srcdir/jotawm"
  git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' || \
  printf "%s.r%s.%s" "$(date +%Y.%m.%d)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/jotawm/keybinds"
  export CGO_ENABLED=0
  export GOFLAGS="-mod=mod"
  make
}

package() {
  cd "$srcdir/jotawm/keybinds"
  make DESTDIR="$pkgdir" PREFIX=/usr install
}
