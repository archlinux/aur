# Maintainer: txfx <fx.roure@gmail.com>

pkgname=fastbuild
pkgver=1.04
pkgrel=1
pkgdesc="High-performance build system"
arch=('x86_64')
url="https://www.fastbuild.org"
license=('custom')
source=("https://www.fastbuild.org/downloads/v$pkgver/FASTBuild-Src-v$pkgver.zip")
md5sums=('26d7bfa5eaac4494710eec8fbbbbf897')

package() {
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

	install -Dm755 ../tmp/x64Linux-Release/Tools/FBuild/FBuild/fbuild "$pkgdir/usr/bin/fbuild"
	install -Dm755 ../tmp/x64Linux-Release/Tools/FBuild/FBuildWorker/fbuildworker "$pkgdir/usr/bin/fbuildworker"
	install -Dm644 LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
