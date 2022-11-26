pkgname=ashpd-demo-git
pkgver=0.3.0
pkgrel=2.0
pkgdesc='asph-demo'
arch=('x86_64' 'aarch64')
url='https://github.com/bilelmoussaoui/ashpd'
license=('MIT')
depends=('gtk4' 'libadwaita')
makedepends=('git' 'ninja' 'meson' 'rust')
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
	cd $pkgname
	(
		set -o pipefail

		# the -next rewrite is a completely separate git history, which does not have any tags yet
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "0.2.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
  cd $pkgname/ashpd-demo
  meson setup \
    -Dprefix=/usr \
    -Dbuildtype=release \
    build
  ninja -C build
}

package() {
  cd $pkgname/ashpd-demo
  DESTDIR="$pkgdir" ninja -C build install
}
