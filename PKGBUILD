# Maintainer: Florian Dejonckheere <florian at floriandejonckheere dot be>
# Contributor: Berseker <berseker86 at gmail.com>

pkgname=viewnior-git
pkgver=1.8.r0.g4a4c6e8
pkgrel=1
pkgdesc="Simple, fast, elegant and minimalistic image viewer, written in C(GTK+) with a new GtkImageView library. Git Version"
arch=('i686' 'x86_64')
url='http://siyanpanayotov.com/project/viewnior'
license=('GPL')
depends=('exiv2' 'gtk2')
makedepends=('gnome-common' 'intltool' 'meson' 'ninja')
provides=('viewnior')
conflicts=('viewnior')
source=(
	"${pkgname}::git+https://github.com/hellosiyan/Viewnior.git"
	'https://patch-diff.githubusercontent.com/raw/hellosiyan/Viewnior/pull/130.patch'
)
md5sums=(
	'SKIP'
	'975eeae744a613e326b89b5dd4ef1fbe'
)

pkgver()
{
	cd "${srcdir}/${pkgname}"
	git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g;s/viewnior.//'
}

prepare() {
	cd "${srcdir}/${pkgname}"
	patch --forward --strip=1 --input="${srcdir}/130.patch"
}


build()
{
	cd "${srcdir}/${pkgname}"
	meson builddir --prefix=/usr
	ninja -C builddir
}

package()
{
	cd "${srcdir}/${pkgname}"
	DESTDIR="${pkgdir}" ninja -C builddir install
}
