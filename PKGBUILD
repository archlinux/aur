# Maintainer: Grey Christoforo <first name at last name dot net>

_pkgname='linux-gpib'
pkgname=("$_pkgname-svn")
pkgver=r1913
pkgrel=1
pkgdesc='A support package for GPIB (IEEE 488) hardware -- built from the svn source tree'
arch=('x86_64')
url='http://linux-gpib.sourceforge.net/'
license=('GPL')
makedepends=('perl' 'python' 'linux-headers' 'bison' 'curl' 'patch')
optdepends=('fxload: firmware upload support for NI USB-B, Keithley KUSB-488 and Agilent 82357')
conflicts=('linux-gpib' 'linux-gpib-dkms' 'python-linux-gpib')
provides=('linux-gpib' 'python-linux-gpib')
source=("${_pkgname}::svn://svn.code.sf.net/p/linux-gpib/code/trunk")
backup=('usr/etc/gpib.conf')
md5sums=('SKIP')

_kernDir="${_pkgname}/${_pkgname}-kernel"
_userDir="${_pkgname}/${_pkgname}-user"
_extramodules=`readlink -e /usr/lib/modules/$(uname -r)/extramodules`
_buildForPythonVersion=3 # could also be 2

pkgver() {
  cd "${_kernDir}"
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

prepare() {
  cd "${srcdir}/${_kernDir}"
  
  #curl https://gist.githubusercontent.com/greyltc/3571d194a506c040e3a05de6867eb814/raw/5de02bf21fcbd29148b89b522c55abfb82f16d4f/linux-gpib.patch | patch -p1
  #./bootstrap
  #./configure
  make clean
 
  cd "${srcdir}/${_userDir}"
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
  make clean
}


build() {
  cd "${srcdir}/${_kernDir}"
  make

  cd "${srcdir}/${_userDir}"
  make
}

package() {
    cd "${srcdir}/${_kernDir}"
    MAKEFLAGS="-j1" make INSTALL_MOD_PATH="${pkgdir}" DESTDIR="${pkgdir}" install
    mkdir -p ${pkgdir}/${_extramodules}
    echo 'g gpib - -' |
install -Dm644 /dev/stdin "$pkgdir"/usr/lib/sysusers.d/$pkgname.conf
    cp -a ${pkgdir}/lib/modules/$(uname -r)/* ${pkgdir}/${_extramodules}/.
    rm -rf ${pkgdir}/lib

    cd "${srcdir}/${_userDir}"
    MAKEFLAGS="-j1" make DESTDIR="${pkgdir}" install
    #install -D -m644 "${srcdir}/${_userDir}/util/templates/gpib.conf" \
    # "${pkgdir}/usr/etc/gpib.conf"
    mv "${pkgdir}/usr/etc/gpib.conf" "${pkgdir}/usr/etc/gpib.conf.svn"

    mkdir -p "${pkgdir}/etc/udev/rules.d" 
    echo 'KERNEL=="gpib[0-9]*", MODE="0660", GROUP="gpib"' > "${pkgdir}/etc/udev/rules.d/31-gpib.rules"

    msg2 "Now you should do three things:"
    msg2 "1) Use modprobe to load a gpib kernel module, and/or put it in /etc/modules-load.d/gpib.conf"
    msg2 "2) Configure your gpib adapters and devices in /usr/etc/gpib.conf"
    msg2 "3) Add users to the gpib group"
}

# vim:ts=4:et:sw=4

