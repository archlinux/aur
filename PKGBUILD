# Maintainer: ibrokemypie <ibrokemypie@bastardi.net>

pkgname=ly-reloaded-git
_name=ly-reloaded
pkgver=r65.eddb094
pkgrel=2
pkgdesc="Maintained fork of the Ly TUI display manager"
url="https://github.com/SartoxOnlyGNU/ly-reloaded"
arch=('any')
license=('WTFPL')
makedepends=('git')
depends=('pam' 'xorg-xauth')
conflicts=('ly')
source=("git+https://github.com/SartoxOnlyGNU/ly-reloaded")
sha256sums=('SKIP')
backup=(
  'etc/ly/config.ini'
  'etc/pam.d/ly'
)

pkgver() {
  cd "${srcdir}/$_name"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
	cd "${srcdir}/$_name"
	git submodule update --init --recursive
}

build() {
	cd "${srcdir}/$_name"
	make
}

package() {
	cd "${srcdir}/$_name"
	make DESTDIR="$pkgdir/" install
}
