# $Id$
# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=earthworm-svn
pkgver=r7559
pkgrel=2
pkgdesc="An open architecture, open source public software for seismic data acquisition, processing, archival and distribution."
arch=('x86_64')
url="http://www.earthwormcentral.org/"
license=('custom:ISTI')
makedepends=('gcc-fortran' 'libtirpc' 'subversion')
provides=("${pkgname%-svn}")
conflicts=("${pkgname%-svn}")
install=${pkgname%-svn}.install
source=("${pkgname%-svn}::svn+svn://svn.isti.com/${pkgname%-svn}/trunk"
        "systemd_sysusers.d_${pkgname%-svn}.conf"
        "systemd_tmpfiles.d_${pkgname%-svn}.conf")
sha256sums=('SKIP'
            '5a75a172f53720ea9fb5bb85e2210788db33f2c3a5c352eed9435378ebc7acbd'
            'aeb2d9caf736a62cb6d7631b589391343d4469e319bae606192bf8c51fccfe0e')

pkgver() {
	cd "${srcdir}/${pkgname%-svn}"
	printf "r%s" "$(svnversion | tr -d 'A-z')"
}

prepare() {
	cd "${srcdir}/${pkgname%-svn}/environment"
	sed -i 's|#USE_CC_BITS=true|USE_CC_BITS=true|' ew_linux.bash
	echo 'export LINK_LIBS="${LINK_LIBS} -ltirpc -fPIC"' >> ew_linux.bash
	echo 'export CFLAGS="${GLOBALFLAGS} -I/usr/include/tirpc -fPIC"' >> ew_linux.bash
	echo 'export CXXFLAGS="${GLOBALFLAGS} -I/usr/include/tirpc -fPIC"' >> ew_linux.bash
	echo 'export GLOBALFLAGS="${GLOBALFLAGS} -I/usr/include/tirpc -fPIC"' >> ew_linux.bash
}

build() {
	cd "${srcdir}/${pkgname%-svn}"
	export EW_INSTALL_HOME=${srcdir}
  export EW_INSTALL_VERSION="${pkgname%-svn}"
	source $EW_INSTALL_HOME/$EW_INSTALL_VERSION/environment/ew_linux.bash
	cd $EW_INSTALL_HOME/$EW_INSTALL_VERSION/src
	make unix
}

package() {
	install -d "$pkgdir/opt"
	cp -a ${pkgname%-svn} "${pkgdir}/opt/"
  install -Dm644 "${srcdir}"/systemd_sysusers.d_${pkgname%-svn}.conf \
                 "${pkgdir}"/usr/lib/sysusers.d/${pkgname%-svn}.conf
  install -Dm644 "${srcdir}"/systemd_tmpfiles.d_${pkgname%-svn}.conf \
                 "${pkgdir}"/usr/lib/tmpfiles.d/${pkgname%-svn}.conf
}
# vim:set ts=2 sw=2 et:
