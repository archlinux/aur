# Maintainer: Wasabi <wasabithumbs@gmail.com>
_name="jdnsbench"
pkgname="${_name}-bin"
pkgver="1.0.1"
pkgrel=1
pkgdesc="A fast, extensive & transparent DNS benchmark that runs in your terminal!"
arch=('x86_64')
url="https://github.com/WasabiThumb/jdnsbench"
license=('Apache-2.0')
depends=('c-ares' 'java-runtime>=17')
makedepends=()
_dentry="jdnsbench.desktop"
_jarfile="jdnsbench-app-${pkgver}.jar"
source=("https://github.com/WasabiThumb/jdnsbench/releases/download/${pkgver}/${_jarfile}" "${_dentry}")
md5sums=("9e473aa0a2a6dbf0a5bec6d3d5266146" "SKIP")
options=(!strip)
provides=("${_name}")
conflicts=("${_name}")

build() {
	cd "$srcdir"
	sed -i '/^Comment=/d' "${_dentry}"
	sed -i '/^Version=/d' "${_dentry}"
	echo "Comment=${pkgdesc}" >> "${_dentry}"
	echo "Version=${pkgver}" >> "${_dentry}"
	chmod +x "${_dentry}"

	echo '#!/bin/sh' >> jdnsbench
	echo "/usr/bin/java -jar /usr/share/java/jdnsbench/${_jarfile}" >> jdnsbench
	chmod +x jdnsbench
}

package() {
	cd "$srcdir"
	install -Dm 755 "$srcdir/jdnsbench" "$pkgdir/usr/bin/jdnsbench"
	mkdir -p "$pkgdir/usr/share/java/jdnsbench"
	install -Dm 755 "$srcdir/${_jarfile}" "$pkgdir/usr/share/java/jdnsbench/${_jarfile}"
	install -Dm 644 "$srcdir/${_dentry}" "$pkgdir/usr/share/applications/${_dentry}"
}