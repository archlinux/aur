# Maintainer: Grey Christoforo <first name at last name dot net>

_pkgname=('linux-gpib')
pkgname=("$_pkgname-svn")
pkgver=r1730
pkgrel=1
pkgdesc='A support package for GPIB (IEEE 488) hardware -- built from the svn source tree'
arch=('x86_64')
url='http://linux-gpib.sourceforge.net/'
license=('GPL')
makedepends=('perl' 'python' 'linux-headers' 'bison')
optdepends=('fxload: firmware upload support for NI USB-B, Keithley KUSB-488 and Agilent 82357')
conflicts=('linux-gpib')
provides=('linux-gpib')
#source=("svn://svn.code.sf.net/p/linux-gpib/code/trunk/linux-gpib-kernel" "svn://svn.code.sf.net/p/linux-gpib/code/trunk/linux-gpib-user" "noDev.patch")
source=("svn://svn.code.sf.net/p/linux-gpib/code/trunk#revision=1730" "noDev.patch")
backup=('etc/gpib.conf')

pkgver() {
  cd "trunk/$_pkgname"
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

_kernmajor="$(pacman -Q linux | sed -r 's/linux ([0-9]*.[0-9]*).*/\1/')"
_extramodules="/usr/lib/modules/extramodules-${_kernmajor}-ARCH"
_buildForPythonVersion=3

md5sums=('SKIP'
         '8c6cb9198ddd029bf6557bf6a7f80c1a')

prepare() {
    cd "trunk/${_pkgname}"

    patch -p0 < "../../noDev.patch"
}


build() {
    cd "trunk/${_pkgname}"

    ./bootstrap

    PYTHON=python${_buildForPythonVersion} ./configure \
        --prefix=/usr \
        --bindir=/usr/bin \
        --sbindir=/usr/bin \
        --disable-guile-binding \
        --enable-perl-binding \
        --disable-php-binding \
        --enable-python-binding \
        --disable-tcl-binding
    make
}

package() {
    cd "trunk/${_pkgname}"

    MAKEFLAGS="-j1" make INSTALL_MOD_PATH="${pkgdir}" DESTDIR="${pkgdir}" install

    mkdir -p ${pkgdir}/${_extramodules}
    echo 'g gpib - -' |
install -Dm644 /dev/stdin "$pkgdir"/usr/lib/sysusers.d/$pkgname.conf
    mv ${pkgdir}/lib/modules/$(uname -r)/gpib ${pkgdir}/${_extramodules}/
    find ${pkgdir} -depth -type d -empty -exec rmdir {} \;
    install -D -m644 "${srcdir}/trunk/${_pkgname}/util/templates/gpib.conf" \
     "${pkgdir}/etc/gpib.conf"

    msg2 "Now you should do three things:"
    msg2 "1) Use modprobe to load a gpib kernel module, and/or put it in /etc/modules-load.d/gpib.conf"
    msg2 "2) Configure your gpib adapters and devices in /etc/gpib.conf"
    msg2 "3) Add users to the gpib group"
}

# vim:ts=4:et:sw=4
