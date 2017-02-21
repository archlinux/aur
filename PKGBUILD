# Maintainer: phiresky <phireskyde+git@gmail.com> 
pkgname=svp
pkgver=4.1.0.101.1
pkgrel=1
epoch=
pkgdesc="SmoothVideo Project 4 (SVP4)"
arch=('x86_64')
url="https://www.svp-team.com/wiki/SVP:Linux"
license=('custom')
groups=()
depends=(libmediainfo qt5-svg qt5-script vapoursynth libusb xdg-utils lsof)
makedepends=(p7zip qt-installer-framework libxml2)
checkdepends=()
optdepends=(
	'mpv-git: needed for mpv vapoursynth support'
	'ocl-icd: for GPU acceleration'
)
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://gist.githubusercontent.com/phiresky/1e2cbd30bed4e5978771af232d11afd1/raw/svp4-$pkgver.tbz2")
# I am rehosting the binaries
# taken from
# http://www.svp-team.com/files/svp4-linux-64.tbz2
# at https://gist.github.com/phiresky/1e2cbd30bed4e5978771af232d11afd1
# so they are correctly versioned and old versions still exist
noextract=()
sha1sums=('285c4e245c1cbf9a8a62dd4846f197d6de1a4e23')
validpgpkeys=()

prepare() {
	rm -rf "$srcdir/installer"
	devtool --dump "$srcdir/installer" "$srcdir/svp4-linux-64.run"
	for f in "$srcdir/installer/metadata/"*/*.7z; do
		7z x -o"$srcdir/extracted/" "$f"
	done
}

pkgver() {
	xmllint --xpath '/Updates/PackageUpdate[Name="core.full"]/Version/text()' "$srcdir/installer/metadata/Updates.xml" | tr '-' '.'
}

package() {
	mkdir -p "$pkgdir"/{opt/svp,usr/bin,usr/share/licenses/svp}
	mv "$srcdir/extracted/licenses" "$pkgdir/usr/share/licenses/$pkgname"
	mv "$srcdir/extracted/"* "$pkgdir/opt/$pkgname"
	ln -s "/opt/$pkgname/SVPManager" "$pkgdir/usr/bin/SVPManager"
	chmod -R +rX "$pkgdir/opt/svp" "$pkgdir/usr/share"
}
