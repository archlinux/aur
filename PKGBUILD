# Maintainer: Your Name <youremail@domain.com>
pkgname=doc2x
pkgver=1.2.11
pkgrel=1
epoch=
pkgdesc="doc2x"
arch=(x86_64)
url="https://doc2x.noedgeai.com/"
license=('private')
depends=(electron24 glibc libx11 bash)
makedepends=(p7zip asar)
provides=(doc2x)
source=("https://doc2x-public.s3.cn-north-1.amazonaws.com.cn/win/doc2x_1.2.11.exe")
sha256sums=('f4229345a8866d307f52c8c8ee39802330c93d754510e65039fd4310eff7bafd')

prepare() {
	7z x *.exe
	pushd "\$PLUGINSDIR"
	7z x app-64.7z
	pushd resources
	asar e app.asar ../../app
	popd
	popd
	sed -i 's@F.app.isPackaged@(true)@g
		s@process.platform@"darwin"@g' app/dist/main/index.cjs # mac has window decoration
	find app -iname "*.exe" -print -delete
	find app \( -name "cli.js" -or -name "bin.js" \) -print -delete
	find app \( -path "*/node_modules/*/bin/*" -or -path "*/man/man1/*" \) -print -delete
	find . -type d -empty -delete
}

package() {
	install -vd $pkgdir/opt/$pkgname
	cp -a $srcdir/app $pkgdir/opt/$pkgname/app
	printf "#!/bin/sh
ELECTRON_IS_DEV=false ELECTRON_ENABLE_LOGGING=1 exec electron24 /opt/$pkgname/app \"\$@\"
" | install -Dm755 /dev/stdin "$pkgdir/usr/bin/$pkgname"
}
