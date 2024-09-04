# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Maintainer: Solomon Choina <shlomochoina@gmail.com>
# The place where the .tar.gz is located is https://discord.gg/ygopro-percy

_appname='edopro'
pkgname=edopro-bin
pkgver=40.1.4
pkgrel=1
pkgdesc="Free and open source ygopro client"
arch=('x86_64')
url='https://github.com/edo9300/edopro'
license=('AGPL3')
provides=("${_appname}")
conflicts=("${_appname}")
install="${_appname}.install"
depends=('libglvnd')
optdepends=('mono: AI support')
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/projectignis/edopro-assets/releases/download/$pkgver/ProjectIgnis-EDOPro-$pkgver-linux.tar.gz"
	"${_appname}.desktop.in"
	"${_appname}.in"
)
sha256sums=('84f9ee5ad00c8e1c7df351d6aa1e7bfe55c550814168a04cf2e4c3833009168b'
            'a08b15b2b7756f42505517932c0588baa2a71ce4054f8e07ad6cea32ec21a4a6'
            'a275b684132bef6195afc6768ced284a0a1dd363d89e3b550061d0779057b230')
options=('emptydirs')

# Make a string suitable for `sed`, by escaping `[]/&$.*^\` - syntax: `_sed_escape STRING`
_sed_escape() {
	echo "${1}" | sed 's/[]\/&.*$^[]/\\&/g'
}

package() {
	local _sed_subst="
		s/@PACKAGE_NAME@/$(_sed_escape "${_appname}")/g
		s/@PACKAGE_VERSION@/$(_sed_escape "${pkgver}")/g
		s/@PACKAGE_RELEASE@/$(_sed_escape "${pkgrel}")/g
		s/@PACKAGE_ARCH@/$(_sed_escape "${_archstr}")/g
	"

	install -dm755 "${pkgdir}/usr/share/applications"
	sed "${_sed_subst}" "${_appname}.desktop.in" > \
		"${pkgdir}/usr/share/applications/${_appname}.desktop"
	install -Dm444 "$pkgname-$pkgver.tar.gz" \
		"${pkgdir}/opt/$pkgname-$pkgver.tar.gz"

	install -dm755 "${pkgdir}/usr/bin"
	sed "${_sed_subst}" "${_appname}.in" > "${pkgdir}/usr/bin/${_appname}"
	chmod +x "${pkgdir}/usr/bin/${_appname}"

	cd ProjectIgnis
	install -d -m 755 "$pkgdir/opt/edopro/"
	cp -a --no-preserve='ownership' * "$pkgdir/opt/edopro/"
	install -D -m 644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

