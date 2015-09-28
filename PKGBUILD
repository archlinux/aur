# Maintainer: Marco Pompili <marcs.pompili at gmail dot com>
# Contributor: Marco Pompili <marcs.pompili at gmail dot com>

pkgname=openframeworks
pkgver=0.8.4
pkgrel=1
pkgdesc="openFrameworks is an open source C++ toolkit for creative coding."
url="http://openframeworks.cc/"
arch=('x86_64' 'i686')
license='MIT'
depends=('cairo' 'mpg123' 'gst-plugins-ugly' 'freeimage' 'gst-libav' 'python-lxml')
optdepends=('codeblocks' 'xterm')
makedepends=()
install=openframeworks.install

[[ "$CARCH" == "i686" ]] && _arch="linux" || _arch="linux64"
_name=of_v${pkgver}_${_arch}_release

source=("http://www.openframeworks.cc/versions/v${pkgver}/${_name}.tar.gz" "of-make-workspace")

[[ "$CARCH" == "i686" ]] && md5sums=("ff38e469b8ebda0529c9d131bc4f499c") || md5sums=("8465ecdaf86a45f0e0f43443e98966fe")

md5sums+=("6a6111a7a98279498899ef0eba789589")

build() {
	cd ${srcdir}/$_name/scripts/linux/

	msg2 "Building openFrameworks..."
	./compileOF.sh > /dev/null

	msg2 "Building the OF Project Generator..."
	./compilePG.sh > /dev/null
}

package() {
	install -d -m755 "${pkgdir}/opt"

	cp -R "${srcdir}/${_name}" "${pkgdir}/opt/openFrameworks"

	install -D -m775 "${srcdir}/of-make-workspace" "${pkgdir}/usr/bin/of-make-workspace"

	msg2 "Fixing emptyExample project files permissions..."

	chmod 644 "${pkgdir}"/opt/openFrameworks/apps/myApps/emptyExample/config.make
	chmod 644 "${pkgdir}"/opt/openFrameworks/apps/myApps/emptyExample/emptyExample.cbp
	chmod 644 "${pkgdir}"/opt/openFrameworks/apps/myApps/emptyExample/emptyExample.workspace
	chmod 644 "${pkgdir}"/opt/openFrameworks/apps/myApps/emptyExample/Makefile

	install -D -m644 "${srcdir}/${_name}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
