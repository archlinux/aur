# Maintainer: Aaron Friesen <aaron@frie.dev>
pkgname=inklecate
pkgver=1.2.1
pkgrel=1
pkgdesc="A command-line compiler for ink: inkle's narrative scripting language"
arch=('x86_64')
url=https://www.inklestudios.com/ink/
license=('MIT')
conflicts=(inklecate inklecate-bin inklecate-git)
depends=(glibc libgcc libstdc++ zlib)
makedepends=(dotnet-sdk)
options=('!debug')
source=("$pkgname-$pkgver.tar.gz::https://github.com/inkle/ink/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7259d6c1ce735d330d7d01e105421787cbd43ad462f0bdbce5738989f0ae7c36')

build() {
	cd "ink-$pkgver"
	dotnet publish inklecate -r linux-x64 -c Release --self-contained true
}

package() {
	cd "ink-$pkgver/inklecate/bin/Release/net6.0/linux-x64/publish"

	# Executable needs to be in the same directory as the DLLs
	install -Dm644 -t "$pkgdir/usr/lib/inklecate" *
	install -Dm755 inklecate "$pkgdir/usr/lib/inklecate/inklecate"

	# Remove tracing provider to avoid lttng-ust dependency
	rm "$pkgdir/usr/lib/inklecate/libcoreclrtraceptprovider.so"

	# Link executable to /usr/bin
	install -d "$pkgdir/usr/bin"
	ln -s ../lib/inklecate/inklecate "$pkgdir/usr/bin/inklecate"

	# License
	cd "$srcdir/ink-$pkgver"
	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
