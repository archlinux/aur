# Maintainer: Darren Davison <darren@davisononline.org>
# Rendered by scripts/aurgen in davison/md-notes, from the version and the
# SHA256SUMS of a GitHub Release. Edit the renderer, not this file.
pkgname=md-notes-bin
pkgver=0.3.0
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
            'e639647617bc7b96a929cd75554f5dc79ec77ce67a70b3c1b7ff1ecabcb885ac')
source_x86_64=("md-notes-$pkgver-mdn::https://github.com/davison/md-notes/releases/download/v$pkgver/mdn-v$pkgver-linux-amd64")
sha256sums_x86_64=('8ef4194f5624c18e3917cbc6fcc6d05aa196976e3cabf229f0868e28f63dd8b1')
source_aarch64=("md-notes-$pkgver-mdn::https://github.com/davison/md-notes/releases/download/v$pkgver/mdn-v$pkgver-linux-arm64")
sha256sums_aarch64=('03ac2ef0f9c21deadc0e9b664526dc6494a7aa19596186041e6e61ba6092b3b6')

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
