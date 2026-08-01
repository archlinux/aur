# Maintainer: Gianluca Mazza <info@gianlucamazza.it>
#
# Nothing from Microsoft is packaged here. The Windows SDK and CRT are fetched
# from Microsoft's CDN at run time, under their own licence, into a per-user
# cache — see the README. That is why there is no `source` beyond this
# repository and no huge `package()`.
pkgname=uwp-crossbuild
pkgver=0.1.0
pkgrel=1
pkgdesc="Compile C++/WinRT UWP applications for Windows, from Linux"
arch=('any')
url="https://github.com/gianlucamazza/uwp-crossbuild"
license=('MIT')
# clang and lld do the compiling; wine runs midlrt, makepri and cppwinrt, none
# of which have a Linux equivalent. p7zip and curl unpack what fetch-sdk.sh
# downloads.
depends=('bash' 'clang' 'lld' 'wine' 'p7zip' 'curl' 'python')
# xwin supplies the CRT and SDK headers. It is in the AUR, and the README
# explains how to use a downloaded binary instead, so this stays optional.
optdepends=('winetricks: installs msxml6, which makepri needs'
            'xwin: CRT and SDK headers and libraries')
makedepends=('shellcheck')
checkdepends=('shellcheck')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a76f2f4f24dac7cf2ac9faf5f2a04e2e1e9bb9128b3f77491edf7f7f53055c80')

check() {
	cd "$pkgname-$pkgver"
	make check
}

package() {
	cd "$pkgname-$pkgver"
	make install DESTDIR="$pkgdir" PREFIX=/usr
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
