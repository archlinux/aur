# Maintainer: Frederik “Freso” S. Olesen <freso.dk@gmail.com>
pkgname=boxtron-git
_pkgname="${pkgname%-git}"
pkgver=0.5.0.r2.e4bf54e
pkgrel=1
pkgdesc='Compatibility tool to run DOS games on Steam through native Linux DOSBox – NOTE: Won’t work as intended until next Steam beta cycle!'
arch=('i686' 'x86_64')
url="https://github.com/dreamer/$_pkgname"
license=('GPL')
depends=('dosbox' 'inotify-tools')
makedepends=('git')
optdepends=(
  'steam: The Steam client'
  'timidity++: MIDI support'
  'soundfont-fluid: MIDI support')
install=$_pkgname.install
source=("git+$url.git")
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"
  sed -i -E '/^tool_(name|dir) +=/s/$/-git/' Makefile
  sed -i -E '/^tool_name_display +=/s/$/ (git)/' Makefile
}

check() {
  cd "$_pkgname"
  make test
}

package() {
  cd "$_pkgname"
  make DESTDIR="$pkgdir" prefix=/usr install
}
