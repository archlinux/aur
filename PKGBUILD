# Maintainer: Gianluca Mazza <info@gianlucamazza.it>
#
# Nothing from Microsoft is packaged here. The Windows SDK and CRT are fetched
# from Microsoft's CDN at run time, under their own licence, into a per-user
# cache — see the README. That is why there is no `source` beyond this
# repository and no huge `package()`.
pkgname=uwp-crossbuild
pkgver=0.5.3
pkgrel=1
pkgdesc="Compile C++/WinRT UWP applications for Windows, from Linux"
arch=('any')
url="https://github.com/gianlucamazza/uwp-crossbuild"
license=('MIT')
# clang and lld do the compiling; wine runs midlrt, makepri and cppwinrt, none
# of which have a Linux equivalent. p7zip and curl unpack what fetch-sdk.sh and
# restore-nuget.sh download. python runs fix-header-case.sh --canonical and
# read-vcxproj.py. llvm is a hard dependency since pe-import-audit.sh: every
# UWP link is followed by an llvm-readobj audit (fail-closed), and llvm-dlltool
# and llvm-lib serve --uwp, --static-lib and the store CRT besides.
depends=('bash' 'clang' 'lld' 'llvm' 'wine' 'p7zip' 'curl' 'python')
# xwin supplies the CRT and SDK headers. It is in the AUR, and the README
# explains how to use a downloaded binary instead, so this stays optional.
optdepends=('winetricks: installs msxml6, which makepri needs'
            'xwin: CRT and SDK headers and libraries')
makedepends=('shellcheck')
checkdepends=('shellcheck')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
# Written by packaging/publish-aur.sh, which downloads whatever the pkgver above
# resolves to and hashes that. Before the tag exists there is nothing to hash,
# and a checksum carried over from the previous release would describe a
# different tarball — the one failure a checksum is there to prevent. The script
# refuses to publish while this still says SKIP.
sha256sums=('1f287eda80272f7654d10de0dceaa45405164757fb7fbc13fa800a2771055be0')

check() {
	cd "$pkgname-$pkgver"
	make check
}

package() {
	cd "$pkgname-$pkgver"
	make install DESTDIR="$pkgdir" PREFIX=/usr
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
