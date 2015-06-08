# Contributor: freedcpp at seznam dot cz
pkgname=bmdc-bzr
pkgver=324
pkgrel=1
pkgdesc="DC + + client based on the source code FreeDC + + with Ignore Users."
arch=('i686' 'x86_64')
url="http://launchpad.net/bmdc++"
license=('GPL')
depends=('bzip2' 'gtk3>=3.6' 'libnotify' 'openssl' 'geoip' 'libtar' 'libcanberra' 'gettext' )
makedepends=('pkgconfig' 'bzr' 'scons' 'gcc')
provides=('bmdc')
conflicts=('linuxdcpp' 'linuxdcpp-bzr' 'linuxdcpp-bzr-i18n' 'freedcpp')
install=$pkgname.install

_bzrmod="bmdc++"
_bzrtrunk=lp:${_bzrmod}

pkgver() {
    cd "${_bzrmod}"
	printf "r%s" "$(bzr revno)"
}

build() {
    cd "${srcdir}"
        
    msg "Getting source ..."
    if [ ! -d ./${_bzrmod} ]; then
		bzr branch ${_bzrtrunk}
    else
		bzr update ${_bzrtrunk}
    fi
    cd ${_bzrmod}
    msg "Checkout done or error"	

    msg "Starting make..."				
    scons PREFIX=/usr/ LIBDIR=/usr/share || return 1
}

package() {
    cd ${srcdir}/${_bzrmod}/
    scons PREFIX=/usr/ LIBDIR=/usr/share install FAKE_ROOT=$pkgdir/ || return 1	
}
