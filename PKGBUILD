# Maintainer: satcom886 <rostik.medved@gmail.com>
pkgname=photoprism
pkgver=210222
_commit="ac5a9d5e"
pkgrel=1
pkgdesc="PhotoPrism is a privately hosted app for browsing, organizing, and sharing your photo collection"
url="https://photoprism.app/"
license=('AGPL3')
arch=('x86_64' 'armv6h' 'armv7h' 'aarch64')
depends=('ffmpeg' 'tensorflow' 'sqlite')
makedepends=('go' 'nodejs-webpack' 'nodejs-webpack-cli')
conflicts=('photoprism-git')

source=(
	"photoprism-$pkgver.tar.gz::https://github.com/photoprism/photoprism/archive/$pkgver-$_commit.tar.gz"
	"photoprism.service"
	"photoprism.service.env"
	"photoprism.sysusers"
	"photoprism.tmpfiles"
)

md5sums=('9b75ad73e3b07515d4d3ed0287d96b0f'
         '09ad1555f1487cd5fb2e461e6b900e3d'
         'c164b0294295e0f23e482507bcf9fb1e'
         'c11fac89fe843b7342790511e98baca9'
         'b8a7591cde43436a3f27df108310badd')
sha256sums=('d959b8233ba405614670fe4e0011943fb93f1e7dff3a9dc9cef852e4d8b3e99b'
            '8a6c983cc9bd34fe5a576903b49d4ee9d15eef019ea22a9e63e6a00c04c8a43b'
            '1dfc9d8900e9437c12d2ffefd9e3b1eea5a90b3801ff61e45c6e23ea4c214e3b'
            '1ecfac0fb1c25794508063797295eef09b7a2ce23723fd8d52460d3fd6ad980f'
            '61b4e817aa621f54b871c5857a336af7d4f2e6da32645e37233aa938f324c4d2')

build() {
	cd "$srcdir"/photoprism-"$pkgver"-"$_commit"
	make DESTDIR="$pkgdir" PREFIX="/usr" generate build-go
}

package() {
	cd "$srcdir"/photoprism-"$pkgver"-"$_commit"
	make DESTDIR="$pkgdir" PREFIX="/usr" install
	#install -Dm 755 $srcdir/k3s-${pkgver}-${CARCH} $pkgdir/usr/bin/k3s

	install -Dm 644 "$srcdir"/photoprism.service "$pkgdir"/usr/lib/systemd/system/photoprism.service
	install -Dm 400 "$srcdir"/photoprism.service.env "$pkgdir"/etc/systemd/system/photoprism.service.env
	install -Dm 644 "$srcdir"/photoprism.sysusers "$pkgdir"/usr/lib/sysusers.d/photoprism.conf
	install -Dm 644 "$srcdir"/photoprism.tmpfiles "$pkgdir"/usr/lib/tmpfiles.d/photoprism.conf
}
