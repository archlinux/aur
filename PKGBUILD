# Maintainer: tim <goal10derphone@gmail.com>
pkgname=klear
_pkgname=klear
pkgver=r75.ba7071e
pkgrel=2
pkgdesc='A minimal Hyprland status bar in Kotlin/Native (tray, popup menus, battery, glassy refraction, session lock)'
arch=('x86_64')
url='https://codeberg.org/goal10der/klearShell'
license=('MIT')
depends=(
  'wayland'
  'mesa'
  'libglvnd'
  'glibc'
  'pam'
)
optdepends=(
  'hyprland: the compositor klear is designed for'
  'ttf-dejavu: fallback font if AdwaitaSans is unavailable'
)
backup=('etc/pam.d/klear')
makedepends=(
  'git'
  'gcc'
  'kotlin-native-bin'
  'wayland-protocols'
)
source=(
  "$_pkgname::git+$url.git"
  'nanovg::git+https://github.com/memononen/nanovg.git'
)
sha256sums=('SKIP' 'SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_pkgname"
  rm -rf lib/nanovg
  ln -sfT "$srcdir/nanovg" lib/nanovg
}

build() {
  cd "$srcdir/$_pkgname"
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir" PREFIX=/usr install
}
