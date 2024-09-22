# Maintainer: Wasabi <wasabithumbs@gmail.com>
_name="jdnsbench"
pkgname="${_name}"
pkgver="1.0.1"
pkgrel=1
pkgdesc="A fast, extensive & transparent DNS benchmark that runs in your terminal!"
arch=('x86_64')
url="https://github.com/WasabiThumb/jdnsbench"
license=('Apache-2.0')
depends=('c-ares' 'java-runtime>=17')
makedepends=('base-devel' 'cmake' 'java-environment>=17')
_dentry="jdnsbench.desktop"
_jarfile="jdnsbench-app-${pkgver}.jar"
source=("https://github.com/WasabiThumb/jdnsbench/archive/refs/tags/${pkgver}.tar.gz" "${_dentry}")
md5sums=("55c4bf27b41228c28e0d63bc2b755765" "SKIP")
options=(!strip)
provides=("${_name}")
conflicts=("${_name}-bin")

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

	cd "$srcdir/jdnsbench-${pkgver}"
	./gradlew clean build
}

package() {
	cd "$srcdir"
	install -Dm 755 "$srcdir/jdnsbench" "$pkgdir/usr/bin/jdnsbench"
	mkdir -p "$pkgdir/usr/share/java/jdnsbench"
	install -Dm 755 "$srcdir/jdnsbench-${pkgver}/app/build/libs/${_jarfile}" "$pkgdir/usr/share/java/jdnsbench/${_jarfile}"
	install -Dm 644 "$srcdir/${_dentry}" "$pkgdir/usr/share/applications/${_dentry}"
}
