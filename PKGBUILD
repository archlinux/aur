# Maintainer: Darren Davison <darren@davisononline.org>
# Rendered by scripts/aurgen in davison/md-notes, from the version and the
# SHA256SUMS of a GitHub Release. Edit the renderer, not this file.
pkgname=md-notes-bin
pkgver=0.1.0
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
        "md-notes-$pkgver-mdn.service::https://raw.githubusercontent.com/davison/md-notes/v$pkgver/contrib/mdn.service")
sha256sums=('77c8ed0935bc59cf1ec2619e1884eccea49ebef7dcf3d53ae94f685fdcdf9747'
            'c8033346d331ac96661df0ba74bb8dba3ee8b42af75dbf58414e8798632f31e1')
source_x86_64=("md-notes-$pkgver-mdn::https://github.com/davison/md-notes/releases/download/v$pkgver/mdn-v$pkgver-linux-amd64")
sha256sums_x86_64=('b66eebd9155192e034f391442e6b4bcecfff33164ba937463e2169b5bbd062a8')
source_aarch64=("md-notes-$pkgver-mdn::https://github.com/davison/md-notes/releases/download/v$pkgver/mdn-v$pkgver-linux-arm64")
sha256sums_aarch64=('ed0a1f53ebbea0406d1b55dfecc9a61c76a0f6437b4bb3d5bd25c0a5ab927d32')

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
}
