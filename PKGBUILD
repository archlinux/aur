# Maintainer: akku <akkun11.open [at] gmail.com>
pkgname=tascam-control-panel-git
pkgver=r132.aefc02d715cc
pkgrel=2
pkgdesc="Control Panel for TASCAM US-144MKII"
arch=(x86_64)
url="https://github.com/serifpersia/us144mkii"
license=('GPL-2.0-only')
groups=()
depends=(qt6-base alsa-lib)
makedepends=(git)
optdepends=(
	'us144mkii: us144mkii ALSA driver (it will be merged on Linux 6.18)'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
_repo="us144mkii"
_srcdir="tascam_controls"
_builddir="build"
source=("git+$url")
noextract=()
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${_repo}"

# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${_repo}/${_srcdir}"
	mkdir -p ${_builddir}
	cd ${_builddir}
	cmake ..
}

package() {
	cd "$srcdir/${_repo}/${_srcdir}/${_builddir}"
	make DESTDIR="$pkgdir/" install
	cd ..
	mkdir -p "$pkgdir/usr/share/applications/"
	install -D -m 644 ./tascam-control-panel.desktop "$pkgdir/usr/share/applications/"
}
