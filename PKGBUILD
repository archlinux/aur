# Contributor: Paul Dufrese <dufresnep@gmail.com>
# Contributor: spider-mario <spidermario@free.fr>
# Contributor: Johannes Krampf <mail@johkra.de>

pkgname=cobra
pkgver=0.9.6
pkgrel=1
pkgdesc="Clean and expressive language for .NET and Mono"
arch=('any')
options=('!strip')
url="http://cobra-language.com/"
license=('MIT')
depends=(mono)
source=(http://cobra-language.com/downloads/Cobra-$pkgver.tar.gz install.patch)
sha256sums=('9f1e496520bad124f5d827aa35d7a591c412fbb4c41633ecb00e68fbb35457fa'
            'SKIP')

prepare() {
	cd Cobra-$pkgver/Source
	patch -Np2 -i "$srcdir/install.patch"
	echo "$pkgdir/opt" > install-directory.text
	sed -i "s|\$(MSBuildExtensionsPath)|$pkgdir/usr/lib/mono/xbuild|" Cobra.MSBuild/Targets/Cobra.targets
}

package() {
	cd Cobra-$pkgver/Source
	bin/install-from-workspace
	gacutil -i "$pkgdir/opt/Cobra-$pkgver/bin/Cobra.Core.dll" -root "$pkgdir/usr/lib/"
	gacutil -i "$pkgdir/opt/Cobra-$pkgver/bin/Cobra.Compiler.dll" -root "$pkgdir/usr/lib/"
	install -dm755 "$pkgdir/usr"
	mv "$pkgdir/opt/bin" "$pkgdir/usr"
	sed -i "s|$pkgdir||" "$pkgdir/usr/bin/cobra"
	install -Dm644 ../License.text "$pkgdir/usr/share/licenses/$pkgname/License.text"
}
