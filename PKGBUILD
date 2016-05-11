# Maintainer: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: Jameson Pugh <imntreal@gmail.com>
# Contributor: Swift Geek < swift geek Ã¢t gmail dÃ¸t cÃ¸m>

_pkgbase='libappindicator'
pkgbase="lib32-${_pkgbase}"
pkgname=("${pkgbase}-gtk"{2,3} "${pkgbase}-sharp")
pkgver=12.10.0
pkgrel=8
pkgdesc='Allow applications to export a menu into the Unity Menu bar (32-bit)'
arch=('i686' 'x86_64')
url="https://launchpad.net/${_pkgbase}"
license=('LGPL2.1' 'GPL3')
makedepends=("lib32-libdbusmenu-gtk"{2,3} "lib32-libindicator-gtk"{2,3}
             'dbus-glib' 'gobject-introspection' 'gtk-doc' 'gtk-sharp-2'
             'perl-xml-libxml' 'pygtk' 'vala' 'mono')
options=('!emptydirs')
source=("https://launchpad.net/${_pkgbase}/${pkgver%.*}/${pkgver}/+download/${_pkgbase}-${pkgver}.tar.gz"
        'python-gtfo.patch'
        '0001-Add-support-for-Activate-method-for-improved-Plasma-.patch')
sha256sums=('d5907c1f98084acf28fd19593cb70672caa0ca1cf82d747ba6f4830d4cc3b49f'
            'a10e2bc67fdfed814a8b4d56a0bae7db4a642327a2d08305ca15e806b5f6df83'
            'b5ee550484aebc13eccbee181f355416efa1de917317c00b044266104418526a')

prepare() {
	cd "${srcdir}/${_pkgbase}-${pkgver}"

	sed 's|/cli/|/mono/|' -i bindings/mono/{appindicator-sharp-0.1.pc.in,Makefile.in}
	sed 's/example //g' -i Makefile.in

	patch -p1 -i '../python-gtfo.patch'
	patch -p1 -i '../0001-Add-support-for-Activate-method-for-improved-Plasma-.patch'

	cd "${srcdir}"
	rm -rf "${pkgbase}-gtk"{2,3} &> /dev/null
	cp -rp "${_pkgbase}-${pkgver}" "${pkgbase}-gtk2"
	mv     "${_pkgbase}-${pkgver}" "${pkgbase}-gtk3"
}

build() {
	export CC='gcc -m32'
	export CXX='g++ -m32'
	export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
	export CFLAGS="$CFLAGS -Wno-deprecated-declarations"

	cd "${srcdir}/${pkgbase}-gtk2"
	./configure --prefix='/usr' --sysconfdir='/etc' --localstatedir='/var' --libdir='/usr/lib32' \
	            --disable-{gtk-doc-html,mono-test,static,tests} --with-gtk=2
	make CSC=dmcs -j1

	cd "${srcdir}/${pkgbase}-gtk3"
	./configure --prefix='/usr' --sysconfdir='/etc' --localstatedir='/var' --libdir='/usr/lib32' \
	            --disable-{gtk-doc-html,mono-test,static,tests} --with-gtk=3
	make CSC=dmcs -j1
}

package_lib32-libappindicator-gtk2() {
	pkgdesc+=" (GTK+ 2 library)"
	depends=('lib32-libdbusmenu-gtk2' 'lib32-libindicator-gtk2')
	provides=("${pkgbase}")
	conflicts=("${pkgbase}")

	cd "${srcdir}/${pkgname}"
	make CSC=dmcs -j1 DESTDIR="${pkgdir}" install
	make CSC=dmcs -j1 -C 'bindings/mono' DESTDIR="${pkgdir}" uninstall
	rm -rf "${pkgdir}"/usr/{include,share}
}

package_lib32-libappindicator-gtk3() {
	pkgdesc+=" (GTK+ 3 library)"
	depends=('lib32-libdbusmenu-gtk3' 'lib32-libindicator-gtk3')
	provides=("${pkgbase}3")
	conflicts=("${pkgbase}3")

	cd "${srcdir}/${pkgname}"
	make CSC=dmcs -j1 DESTDIR="${pkgdir}" install
	make CSC=dmcs -j1 -C 'bindings/mono' DESTDIR="${pkgdir}" uninstall
	rm -rf "${pkgdir}"/usr/{include,share}
}

package_lib32-libappindicator-sharp() {
	arch=('any')
	depends=('gtk-sharp-2' "${pkgbase}-gtk2")

	cd "${srcdir}/${pkgbase}-gtk3"
	make CSC=dmcs -j1 -C 'bindings/mono' DESTDIR="${pkgdir}" install
	mv "${pkgdir}/usr/lib/mono/appindicator-sharp" "${pkgdir}/usr/lib32/mono/"
	mv "${pkgdir}/usr/lib/mono/gac" "${pkgdir}/usr/lib32/mono/"
	rm -rf "${pkgdir}"/usr/{include,share,lib}
}
