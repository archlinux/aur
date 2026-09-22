# Maintainer: Darren Davison <darren@davisononline.org>
# Rendered by scripts/aurgen in davison/md-notes, from the version and the
# SHA256SUMS of a GitHub Release. Edit the renderer, not this file.
pkgname=md-notes-bin
pkgver=0.2.0
pkgrel=1
pkgdesc='Turns folders of markdown files into a notes application in the browser'
arch=('x86_64' 'aarch64')
url='https://github.com/davison/md-notes'
license=('MIT')
depends=('ripgrep')
optdepends=('xdg-utils: mdn open launches a browser')
provides=("md-notes=$pkgver")
conflicts=('md-notes')
# The binary is the release's own, already stripped at link time (-s -w): left
# alone it is byte-identical to the asset SHA256SUMS covers, and there is no
# debug package to be made from it.
options=('!strip' '!debug')
install=md-notes-bin.install
source=("md-notes-$pkgver-LICENSE::https://raw.githubusercontent.com/davison/md-notes/v$pkgver/LICENSE"
        "md-notes-$pkgver-mdn.service::https://raw.githubusercontent.com/davison/md-notes/v$pkgver/contrib/mdn.service"
        "md-notes-$pkgver-mdn.1::https://raw.githubusercontent.com/davison/md-notes/v$pkgver/contrib/mdn.1")
sha256sums=('77c8ed0935bc59cf1ec2619e1884eccea49ebef7dcf3d53ae94f685fdcdf9747'
            '113a4bd6576843bbf834de8a7abadbd46ad8260b9d95767919b92851defb225c'
            'a163ac6bbb76a5e75fce2524c613bd55a30ff5c12efc01a178ddb524753b864d')
source_x86_64=("md-notes-$pkgver-mdn::https://github.com/davison/md-notes/releases/download/v$pkgver/mdn-v$pkgver-linux-amd64")
sha256sums_x86_64=('36883f70b78ef63e9ccde2826767c1cbb50095829f5eb038586c015d6b5d8c9c')
source_aarch64=("md-notes-$pkgver-mdn::https://github.com/davison/md-notes/releases/download/v$pkgver/mdn-v$pkgver-linux-arm64")
sha256sums_aarch64=('cace7aaf08e73bf96648caf5c6b758fa9258b1a247f96b33e21a5eb2a7401da5')

package() {
	install -Dm755 "$srcdir/md-notes-$pkgver-mdn" "$pkgdir/usr/bin/mdn"
	# Verbatim, byte for byte, from the tag: the unit starts /usr/bin/mdn,
	# which is where this package puts the binary, and its header is written
	# for the reader who installed the package — including the drop-in for a
	# local prefix. davison/md-notes#137 settled that; verify.sh compares the
	# installed file with the one in the tagged tree.
	install -Dm644 "$srcdir/md-notes-$pkgver-mdn.service" \
		"$pkgdir/usr/lib/systemd/user/mdn.service"
	install -Dm644 "$srcdir/md-notes-$pkgver-LICENSE" \
		"$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	# The same page the .deb and make install carry, filled in the same way.
	install -d "$pkgdir/usr/share/man/man1"
	sed -e "s/@VERSION@/$pkgver/g" \
		-e "s/@DATE@/$(date -u -d "@$SOURCE_DATE_EPOCH" +%Y-%m-%d)/g" \
		"$srcdir/md-notes-$pkgver-mdn.1" >"$pkgdir/usr/share/man/man1/mdn.1"
	chmod 644 "$pkgdir/usr/share/man/man1/mdn.1"
}
