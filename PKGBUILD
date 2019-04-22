# Maintainer: Jonathon Korhonen <first initial last name [at] alumni [dot] nmu [dot] edu>

pkgname=wingide-personal
pkgver=7.0.1.2
pkgrel=1
pkgdesc="A free Python IDE designed for students and hobbyists. It omits many features found in Wing Pro."
arch=('x86_64')
url="http://www.wingware.com/"
license=('(L)GPL')
depends=('python2')
options=(!strip !emptydirs)
source=("https://wingware.com/pub/wing-personal/$pkgver/wing-personal-$pkgver-linux-x64.tar.bz2")
md5sums=('747834a7128f8c116d946b1961aaaef7')
install=wing-personal.install

prepare() {
	cd "$srcdir/wing-personal-$pkgver-linux-x64"
	sed -i 's/python/python2/' wing-install.py
}

package() {
	cd "$srcdir/wing-personal-$pkgver-linux-x64"
	./wing-install.py \
		--install-binary \
		--winghome "${pkgdir}/opt/wing-personal" \
		--bin-dir ${pkgdir}/usr/bin > /dev/null 2>&1

	sed -i "s|${pkgdir}||" ${pkgdir}/opt/wing-personal/wingdbstub.py
	sed -i "s|${pkgdir}||" ${pkgdir}/opt/wing-personal/wing-personal

	sed -i 's|ARCH=`arch`|ARCH=`uname -m`|' ${pkgdir}/opt/wing-personal/bootstrap/run-wing.sh
	sed -i "s|'$arch'\]|'$arch' \]|" ${pkgdir}/opt/wing-personal/bootstrap/run-wing.sh

	sed -i "s,${pkgdir},,g" "${pkgdir}/opt/wing-personal/file-list.txt"

	chown -R root:root "${pkgdir}/opt/wing-personal"
	chmod +x ${pkgdir}/opt/wing-personal/resources/linux/desktop/install-linux-desktop.sh
	install -D -m 644 "${pkgdir}/opt/wing-personal/LICENSE.txt" "${pkgdir}/usr/share/licenses/wing-personal/LICENSE"
}
