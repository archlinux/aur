# Maintainer: Li Hua <lihua@email.com>
pkgname=hybridfilexfer-git
pkgver=r27.89241d9
pkgrel=8
pkgdesc="多轨快传，同时使用USB和5G与2.4GWIFI等通道传输文件到电脑，榨干手机IO！ "
arch=('any')
url='https://github.com/weixiansen574/HybridFileXfer'
license=(GPL-3.0-or-later)
depends=('jdk21-openjdk' 'android-tools')
makedepends=('git')
conflicts=("${pkgname%-git}" "${pkgname%-git}-bin")
source=("${pkgname%-git}::git+${url}")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}/HybridFileXfer-PC/src"
	javac -verbose -d . top/weixiansen574/hybirdfilexfer/Main.java
	jar vcfm "$srcdir/HybridFileXfer.jar" "META-INF/MANIFEST.MF" $(find . -name '*.class')
}

package() {
	cd "$srcdir"
	mkdir -vp "$pkgdir/usr/bin"
	install -Dvm644 HybridFileXfer.jar "$pkgdir/opt/HybridFileXfer/HybridFileXfer.jar"
	echo '#!/bin/sh' > "$pkgdir/usr/bin/hybridfilexfer"
	echo 'java -Duser.dir="$(dirname $(which adb))" -jar /opt/HybridFileXfer/HybridFileXfer.jar $@' >> "$pkgdir/usr/bin/hybridfilexfer"
	chmod -v 755 "$pkgdir/usr/bin/hybridfilexfer"
}
