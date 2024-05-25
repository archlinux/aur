# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=valveresourceformat-git
pkgver=9.2.r91.g0486309
pkgrel=2
pkgdesc="Valve's Source 2 resource file format parser, decompiler, and exporter."
arch=('x86_64')
url="https://github.com/ValveResourceFormat/ValveResourceFormat"
license=('MIT')
depends=('glibc' 'gcc-libs' 'zlib')
makedepends=('dotnet-sdk' 'git')
options=(!strip !debug)
provides=("${pkgname::-4}")
conflicts=("${pkgname::-4}")
install=$pkgname.install
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/$pkgname/Decompiler"
	dotnet publish -r linux-x64
}

package() {
	cd "$srcdir/$pkgname/Decompiler/bin/Release/linux-x64/publish"
	for file in {Decompiler,libSkiaSharp.so};
	do
		install -Dm755 $file "$pkgdir/usr/lib/$pkgname/$file"
	done

	mkdir -p "$pkgdir/usr/bin/"
	ln -s /usr/lib/$pkgname/Decompiler "$pkgdir/usr/bin/${pkgname::-4}-decompiler"
}
