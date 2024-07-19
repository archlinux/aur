# Maintainer: Jax Young <jaxvanyang@gmail.com>
# Contributor: Igor Dyatlov <dyatlov.igor@protonmail.com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Nahuel Gomez Castro <nahual_gomca@outlook.com.ar>

pkgname=palette
pkgver=2.0.3
pkgrel=1
pkgdesc="Tool for viewing the GNOME color palette as defined by the design guidelines."
arch=('x86_64' 'aarch64')
url="https://gitlab.gnome.org/World/design/palette"
license=('GPL3')
depends=('libadwaita')
makedepends=('meson' 'vala')
checkdepends=('appstream-glib')
_hig_commit='54cad6784d8c097738f2d9f873cd497765c3261c'
source=("https://gitlab.gnome.org/World/design/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz"
	"https://gitlab.gnome.org/Teams/Design/HIG-app-icons/-/archive/$_hig_commit/HIG-app-icons-$_hig_commit.tar.gz")
noextract=("HIG-app-icons-$_hig_commit.tar.gz")
sha256sums=('b3a7d747266f5ccc0fa2edd0a87f9cdc4b54a0e487ed5ab9e41b92e38c8d7a6a'
	'052c7c013211ae0e5123c6ae90d477904e2afa6b5dafd36f99a7256170bd196e')

prepare() {
	bsdtar -xf "HIG-app-icons-$_hig_commit.tar.gz" --strip-components 1 -C "$pkgname-$pkgver/src/hig"
}

build() {
	arch-meson "$pkgname-$pkgver" build
	meson compile -C build
}

check() {
	meson test -C build --print-errorlogs
}

package() {
	meson install -C build --destdir "$pkgdir"

	ln -s /usr/bin/org.gnome.design.Palette "$pkgdir/usr/bin/$pkgname"
}
