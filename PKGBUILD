# Maintainer: Yurii Kolesnykov <root@yurikoles.com>
# Credit: Max Bruckner

_basename=mirrorselect
pkgname=gentoo-$_basename
pkgver=2.2.6
pkgrel=2
pkgdesc='Tool to help select distfiles mirrors for Gentoo'
arch=( 'any' )
url="https://wiki.gentoo.org/wiki/Mirrorselect"
license=('GPL2')
depends=('python' 'netselect' 'dialog' 'ssl-fetch>=0.3' )
source=("https://dev.gentoo.org/~zmedico/dist/${_basename}-${pkgver}.tar.gz")
b2sums=('8875bf61e26ac474338d81a602297fa4fdf3fab3dbd478b02129dbe71f2d09445efa9b82792e3e654725c5e87a4ca00d37a3d924f8bd6f2decdf74148d1069c8')

build() {
	cd "${_basename}-${pkgver}"

	./setup.py build

	VERSION="$pkgver" ./setup.py set_version || exit

	# The netselect --ipv4 and --ipv6 options are supported only
	# with >=net-analyzer/netselect-0.4[ipv6(+)] (bug 688214).
	sed -e '/^NETSELECT_SUPPORTS_IPV4_IPV6 =/s|False|True|' -i mirrorselect/selectors.py || die

	# Apply e69ec2d046626fa2079d460aab469d04256182cd for bug https://bugs.gentoo.org/show_bug.cgi?id=698470
	sed -e 's|key = lex.get_token()|\0\n\t\t\tif key is None:\n\t\t\t\tbreak|' -i mirrorselect/configs.py || exit
}

package() {
	cd "${_basename}-${pkgver}"

	./setup.py install --prefix='/usr/' --root="$pkgdir" || exit
}
