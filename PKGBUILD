# Contributor: asuka minato

pkgname=mubu-electron
pkgver=3.7.3
pkgrel=1
pkgdesc="一款结合了大纲笔记和思维导图的头脑管理工具(packed from origin exe, use system electron)"
arch=('x86_64' aarch64 armv7h)
url="https://mubu.com/home"
license=("private")
depends=(electron9 bash gcc-libs glibc)
makedepends=(asar p7zip)
provides=(mubu)
conflicts=(mubu)
source=("https://assets.mubu.com/client/Mubu-${pkgver}.exe"
	$pkgname.desktop
)
sha256sums=('dac7470975ed11fa529cbeed979da3741a180a1c7379ef0c0320263035085e7c'
            'bcdb2d8c65c25c2261a852a4e1aaffb22995beb3e3e0795333ee7e4422b7eba6')

prepare() {
	7z x Mubu*.exe
	7z x ./**/app-32.7z
	asar e ./**/app.asar ./appasar
}

package() {
	install -vd $pkgdir/opt/$pkgname/
	find . -name appasar -type d -exec cp -a {} $pkgdir/opt/$pkgname/ \;
	printf "#!/bin/sh
exec electron9 /opt/$pkgname/appasar \"\$@\"
" | install -vDm755 /dev/stdin $pkgdir/usr/bin/mubu
	install -vDm644 *.desktop $pkgdir/usr/share/applications/mubu.desktop
	find . -name "logo.png" -type f -exec install -vDm644 {} $pkgdir/usr/share/pixmaps/mubu.png \;
}
