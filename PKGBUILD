pkgname=pocillo-gtk-theme-git
pkgver=0.6.r15.gaa800c9
pkgrel=1
pkgdesc='Theme for the Budgie Desktop that has Material Design elements and styled using the Arc colour palette'
arch=('any')
url=https://github.com/UbuntuBudgie/pocillo-gtk-theme
license=(GPL2)
depends=(gtk-engine-murrine gtk3)
makedepends=(inkscape optipng gtk-engine-murrine gdk-pixbuf2 git libsass sassc make glib2 libxml2 parallel)
optdepends=('budgie-desktop: The Budgie desktop' 'gdk-pixbuf2')
provides=(pocillo-gtk-theme)
conflicts=(pocillo-gtk-theme)
source=("${pkgname}::git+${url}")
sha256sums=('SKIP')

pkgver() {
	cd "${pkgname}"
	(
		set -o pipefail
		git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	cd "${pkgname}"
	make -j$(nproc)
}

package() {
	cd "${pkgname}"
	make DESTDIR="${pkgdir}" install
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	# Fix dangling symlink
	local symlink
	for symlink in $(find "${pkgdir}" -type l -name 'gtk-3.0') ; do
		rm "${symlink}"
		ln -vs 'gtk-3.22' "${symlink}"
	done
}
