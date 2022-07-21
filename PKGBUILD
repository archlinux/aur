# Maintainer: grufo <madmurphy333 AT gmail DOT com>

pkgname='gnunet-webui-git'
_appname='gnunet-webui'
pkgver='r14.da35c82'
pkgrel=1
pkgdesc='Web user interface for GNUnet'
arch=('any')
url="https://gnunet.org"
license=('GPL')
provides=("${_appname}")
conflicts=("${_appname}")
depends=('gnunet' 'nodejs')
makedepends=('npm')
options=('!strip')
source=("git+https://git.gnunet.org/git/${_appname}.git"
	"${_appname}.sh"
	"${_appname}.service")
md5sums=('SKIP'
	'e936e4485fc403707a7f9a8ec003221c'
	'7da568705f440c4a3022bf5e18d31349')
install="${_appname}.install"

pkgver() {

	cd "${_appname}"

	printf "'r%s.%s'" \
		"$(git rev-list --count HEAD)" \
		"$(git rev-parse --short HEAD)"

}

prepare() {

	cd "${srcdir}/${_appname}"

	npm install --user root

}

build() {

	cd "${srcdir}/${_appname}"

	"${srcdir}/${_appname}/node_modules/.bin/ng" build

	# Remove all references to `${srcdir}`
	msg 'Removing all references to $srcdir...'
	find "${srcdir}/${_appname}" -type f -print0 | xargs -0 sed -i "s|${srcdir}/${_appname}|/usr/share/${_appname}|g"

}

package() {

	cd "${srcdir}/${_appname}"

	install -dm755 "${pkgdir}/usr/share/${_appname}"
	cp -r "${srcdir}/${_appname}/"* "${pkgdir}/usr/share/${_appname}/"
	install -Dm755 "${srcdir}/${_appname}.sh" "${pkgdir}/usr/bin/${_appname}"
	install -Dm0644 "${srcdir}/${_appname}.service" "${pkgdir}/usr/lib/systemd/system/${_appname}.service"

}


