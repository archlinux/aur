# Maintainer: txfx <fx.roure@gmail.com>

pkgname=fastbuild
pkgver=1.07
pkgrel=1
pkgdesc="High-performance build system"
arch=('x86_64')
url="https://www.fastbuild.org"
license=('custom')
makedepends=('gcc')
source=("https://www.fastbuild.org/downloads/v$pkgver/FASTBuild-Src-v$pkgver.zip")
md5sums=('b38ebeb53b1736f7365fe05a64636974')

build() {
	cd dist_v$pkgver
	chmod +x Bin/Linux-x64/fbuild
	
	cd Code

	sed -i -e "1i\\
		#define CI_BUILD
		" fbuild.bff Tools/FBuild/FBuildTest/Data/testcommon.bff

	sed -i -e "
		s:GCC_BINARY:$(which gcc):
		s:GXX_BINARY:$(which g++):
		s:CC1_BINARY:$(gcc -print-prog-name=cc1):
		s:CC1PLUS_BINARY:$(g++ -print-prog-name=cc1plus):
		" ../External/SDK/GCC/Linux/GCC_CI.bff

	 ../Bin/Linux-x64/fbuild All-x64Linux-Release
}

package() {
	cd dist_v$pkgver

	install -Dm755 tmp/x64Linux-Release/Tools/FBuild/FBuild/fbuild "$pkgdir/usr/bin/fbuild"
	install -Dm755 tmp/x64Linux-Release/Tools/FBuild/FBuildWorker/fbuildworker "$pkgdir/usr/bin/fbuildworker"
	install -Dm644 Code/LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
