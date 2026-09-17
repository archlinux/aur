# Maintainer: Jotalea <main@jotalea.com.ar>
#
# The keybinds popup is packaged separately, by keybinds/PKGBUILD, rather than
# as a split package of this pkgbase. A split pkgbase builds every one of its
# packages in a single makepkg run, which would make a Go toolchain a
# makedepend of every jotawm build — including the ones that only touch the C
# window manager. Keeping it separate means Go is only pulled in when the popup
# itself is built.

pkgname=jotawm-git
pkgver=2026.09.17.r121.66f9fa0
pkgrel=1
pkgdesc="A minimal tiling window manager for X11"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/jotalea/jotawm"
license=('BSD-3-Clause')
depends=('libx11' 'libxinerama')
makedepends=('git')
optdepends=('jotawm-keybinds-git: on-screen keybind cheat-sheet')
provides=('jotawm' 'jotawm-session')
conflicts=('jotawm')
source=("jotawm::git+https://github.com/jotalea/jotawm.git")
sha256sums=('SKIP')
options=(!debug)

pkgver() {
  cd "$srcdir/jotawm" 2>/dev/null || cd "$srcdir"
  git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' || \
  printf "%s.r%s.%s" "$(date +%Y.%m.%d)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/jotawm" 2>/dev/null || cd "$srcdir"
  make
}

package() {
  cd "$srcdir/jotawm" 2>/dev/null || cd "$srcdir"
  make DESTDIR="$pkgdir" PREFIX=/usr install
}
