# Maintainer: Olliver Schinagl <oliver@schinagl.nl>

pkgname='openfortivpn-git'
pkgdesc="An open implementation of Fortinet's proprietary PPP+SSL VPN solution"
pkgver='1.17.1.20220328'
_commit='91191ccb014336f6dc1dc8f550c3dec7978c0438'
pkgrel=0
url='https://github.com/adrienverge/openfortivpn'
arch=('x86_64')
license=('GPL3')
makedepends=(
	'git'
)
depends=(
	'glibc'
	'openssl'
	'ppp'
	'resolvconf'
	'systemd-libs'
)
provides=("openfortivpn=${pkgver}")
conflicts=('openfortivpn')
backup=('etc/openfortivpn/config')
source=("${pkgname}.tar.gz::https://github.com/adrienverge/openfortivpn/archive/${_commit}.tar.gz")
sha512sums=('34cb99b212ed6dac7e00c62815b0f574875c2407827af2bb1f2aeecd239b7ef042fa9047025d3ad478c209ab415686bc065c63dbdaeb72209b038161d871f917')
builddir="${pkgname%%-git}-${_commit}"

prepare() {
	cd "${srcdir}/${builddir}"
	sed -i "s|^\(AC_INIT(\[openfortivpn\], \[\).*$|\1${pkgver}-g$(echo "${_commit}" | cut -c 1-9)])|" 'configure.ac'
	autoreconf --force --install --verbose
}

build() {
	cd "${srcdir}/${builddir}"
	./configure \
	            --prefix='/usr' \
	            --sysconfdir='/etc' \
	            --enable-resolvconf \
		    ;
	make
}

package() {
	cd "${srcdir}/${builddir}"
	make DESTDIR="${pkgdir}" install
}
