# Maintainer: grufo <madmurphy333 AT gmail DOT com>
# Contributor: redfish <redfish AT galactica DOT pw>
# Contributor: kertase <kertase AT gmail DOT com>
# Contributor: Sergej Pupykin <pupykin DOT s+arch AT gmail.com>
# Contributor: wahnby <wahnby AT yahoo DOT fr>

pkgname='gnunet-git'
_appname='gnunet'
pkgver='0.11.8.r28462.03273ff52'
pkgrel=1
pkgdesc="A framework for secure peer-to-peer networking"
arch=('any')
url="http://gnunet.org"
license=('GPL')
provides=("${_appname}")
conflicts=("${_appname}")
depends=('gmp' 'libgcrypt' 'libextractor' 'sqlite' 'gnurl'
	 'libmicrohttpd' 'libunistring' 'libidn' 'jansson')
makedepends=('gettext' 'pkgconfig' 'autoconf' 'fakeuser-git'
	     'bluez-libs' 'python' 'glpk' 'libpulse' 'opus')
optdepends=('bluez-libs'
	    'python'
	    'glpk'
	    'libpulse'
	    'opus')
install='gnunet.install'
backup=('etc/gnunetd.conf')
options=('!makeflags')

source=("git+https://gnunet.org/git/${_appname}.git"
        'gnunet.service')

md5sums=('SKIP'
         'a64f19ce71c02c200fa78ca2d1585bc8')

_fakeadd_error() {

	echo "You must have a 'gnunet' user and group, and additionally a 'gnunetdns' group in"
	echo 'your system prior to building this package.'
	echo
	echo 'You can do:'
	echo
	echo '  groupadd -r gnunet'
	echo '  useradd -r -l -g gnunet -d /var/lib/gnunet gnunet'
	echo '  groupadd -r gnunetdns'

	return 1

}

pkgver() {

	cd "${_appname}"
	printf "'%s.r%s.%s'" \
		"$(grep 'AC_INIT' configure.ac | grep -o '[0-9]\(\.[0-9]\+\)\+')" \
		"$(git rev-list --count HEAD)" \
		"$(git rev-parse --short HEAD)"

}

prepare() {

	cd "${srcdir}/${_appname}"
	autoreconf -fi
	sed -i 's|contrib doc|doc|' Makefile.*
	[ -f Makefile ] || ./configure --prefix=/usr \
	--without-mysql

	# enable fakeadd under fakeroot environment
	export LD_PRELOAD='/usr/lib/fakeuser/libfakeuser.so'

}

package() {

	local _gnunet_guid=714
	local _gnunetdns_gid=715

	cd "${srcdir}/${_appname}"

	install -dm755 "${pkgdir}/etc"
	touch "${pkgdir}/etc/gnunetd.conf"

	# fakeadd
	getent group gnunet > /dev/null || fakeadd -G -n gnunet -g ${_gnunet_guid} || _fakeadd_error
	getent passwd gnunet > /dev/null || fakeadd -U -n gnunet -u ${_gnunet_guid} -g ${_gnunet_guid} -d /var/lib/gnunet || _fakeadd_error
	getent group gnunetdns > /dev/null || fakeadd -G -n gnunetdns -g ${_gnunetdns_gid} || _fakeadd_error
	install -dm755 "${pkgdir}/var/lib/gnunet"
	chown gnunet:gnunet "${pkgdir}/var/lib/gnunet"

	if ! getent group gnunet > /dev/null || ! getent passwd gnunet > /dev/null || ! getent group gnunetdns > /dev/null || [[ $(stat -c %u "${pkgdir}/var/lib/gnunet") -ne ${_gnunet_guid} ]]; then
		_fakeadd_error
	fi

	# build
	# ...I know, `make` should be inside `build()`... But we need the power of fakeadd+fakeroot *while* building!
	make
	make -C contrib

	# install
	make DESTDIR="${pkgdir}" install
	make DESTDIR="${pkgdir}" -C contrib install
	install -Dm0644 "${srcdir}/${_appname}.service" "${pkgdir}/usr/lib/systemd/system/${_appname}.service"

}

