# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: tobias <tobias@archlinux.org>
# Contributor: red_over_blue
# Contributor: neri

pkgname=povray-git
pkgver=3.8.0beta.2
pkgrel=1
_v=${pkgver%.*.*} # 3.7
pkgdesc='Script based raytracer for creating 3D graphics'
arch=(x86_64)
license=(AGPL3)
url=https://povray.org
depends=(boost-libs imath libpng libtiff openexr)
makedepends=(boost git glu)
backup=(etc/povray/$_v/povray.conf
        etc/povray/$_v/povray.ini)
provides=("${pkgname%-git}$pkgver")
conflicts=(${pkgname%-git})
_tag="${pkgver/b/-b}"
_archive="${pkgname%-git}-$_tag"
source=("https://github.com/POV-Ray/povray/archive/v$_tag/$_archive.tar.gz")
sha256sums=('5d275daf159e3cf5ad655d11b53956ea0087687169fc81cfc81fa12166f30344')

prepare() {
	cd "$_archive"
	rm -frv libraries/ilmbase/Imath
	cd unix
	sed 's/automake --w/automake --add-missing --w/g' -i prebuild.sh
	sed 's/dist-bzip2/dist-bzip2 subdir-objects/g' -i configure.ac
	./prebuild.sh
	cd ..
	./bootstrap
}

build() {
	cd "$_archive"
	./configure \
		LIBS="-lboost_system -lboost_thread" \
		COMPILED_BY="Arch Linux AUR $PACKAGER" \
		--prefix=/usr \
		--sysconfdir=/etc
	make CXXFLAGS+='-std=c++11 -lboost_system -lboost_thread -DBOOST_BIND_GLOBAL_PLACEHOLDERS=1 -w'
}

package() {
	cd "$_archive"
	install -d "$pkgdir"/usr/share/{doc/,}"${pkgname%-git}-$_v"
	cp -r icons include ini scenes scripts "$pkgdir/usr/share/${pkgname%-git}-$_v"
	cp -r doc "$pkgdir/usr/share/doc/${pkgname%-git}-$_v"
	install -Dm0755 -t "$pkgdir/usr/bin/" unix/povray
	install -Dm0644 -t "$pkgdir/etc/povray/$_v/" povray.conf
	install -Dm0644 -t "$pkgdir/etc/povray/$_v/" povray.ini
	install -Dm0644 -t "$pkgdir/usr/share/man/man1/" povray.1
}
