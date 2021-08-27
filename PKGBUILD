# Contributor: tinywrkb <tinywrkb@gmail.com>

pkgname=power-profiles-daemon
pkgver=0.9.0
pkgrel=3
pkgdesc="Makes power profiles handling available over D-Bus"
url="https://gitlab.freedesktop.org/hadess/power-profiles-daemon"
license=(GPL3)
arch=(x86_64)
depends=('python' 'upower')
makedepends=('git' 'meson')
checkdepends=('python-dbusmock' 'python-isort' 'python-mccabe' 'python-pylint' 'umockdev')
_commit=30d85f1e9e274e75add4ecaa46795126acafb29d # tags/0.9.0
source=("git+https://gitlab.freedesktop.org/hadess/power-profiles-daemon.git#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/-/+/g'
}

 prepare() {
   cd $pkgname
   # fixes pylint test
   git cherry-pick -n 42b3341b29047489ea5eecaf8cf7d6e74a228891
 }

build() {
  arch-meson $pkgname build
  meson compile -C build
}

check() {
  meson test -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
