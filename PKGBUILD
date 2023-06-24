# Contributor: Asuka Minato <i at asukaminato dot eu dot org>
pkgname=codemerx-decompile-bin
pkgver=0.9.2
pkgrel=1
pkgdesc="The first standalone .NET decompiler for Mac, Linux and Windows"
arch=(x86_64)
url="https://decompiler.codemerx.com/"
license=('AGPL3')
makedepends=(gendesk)
depends=(electron7 bash
	libxkbfile libsecret
	# namcap tells me following
	glibc krb5 zlib libx11 curl gcc-libs glib2 lttng-ust)
provides=(CodemerxDecompile)
# https://bbs.archlinux.org/viewtopic.php?id=253279 spend some hours to figure this out :(
options=('staticlibs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/codemerx/CodemerxDecompile/releases/download/${pkgver}/CodemerxDecompile-linux-x64.tar.gz"
)

package() {
	install -d $pkgdir/opt/$pkgname
	cp -a $srcdir/CodemerxDecompile-linux-x64/resources/app $pkgdir/opt/$pkgname/
	echo -e "#!/bin/bash\nelectron7 /opt/$pkgname/app" | install -Dm755 /dev/stdin $pkgdir/usr/bin/CodemerxDecompile

	# completions
	find $srcdir -name "CodemerxDecompile" -type f -path "*completions/bash*" -exec install -Dm755 {} -t "${pkgdir}"/usr/share/bash-completion/completions/ \;
	find $srcdir -name "_CodemerxDecompile" -type f -path "*completions/zsh*" -exec install -Dm755 {} -t "$pkgdir"/usr/share/zsh/site-functions/ \;
	# icon
	find $srcdir -name "codemerx-logo-512x512.png" -type f -exec install -Dm644 {} $pkgdir/usr/share/pixmaps/CodemerxDecompile.png \;
	gendesk --name CodemerxDecompile --pkgdesc "$pkgdesc" --exec CodemerxDecompile --pkgname $pkgname --icon CodemerxDecompile
	install -Dm644 *.desktop $pkgdir/usr/share/applications/$pkgname.desktop
}
sha256sums=('5c4014e678cddd52dcd691d174212700262d25b5ea81b2c84a6f54a4280b7bb5')
