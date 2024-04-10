# Find this package on https://github.com/pietmacom/kopano-pkgbuilds.git
_pkgname='vmime'
pkgbase='vmime'
pkgname=('vmime-libonly'
         'vmime')
pkgver=0.9.2.r1270.d03ad5f0
pkgrel=1
provides=(
    'libvmime'
	 )
pkgdesc='A C++ class library for working with MIME messages'
arch=(
    'armv7l'
    'aarch64'
    'i686'
    'x86_64'
     )
url='http://www.vmime.org/'
license=(
    'GPL'
	)
_url="https://github.com/kisli/${_pkgname}"
	
conflicts=('zarafa-libvmime'
           'kopano-libvmime'
           'libvmime')

source=("git+${_url}")
sha256sums=('SKIP')
makedepends=(
    'cmake'
    'postfix'
    'doxygen'
    'xdot'
    'git'
	    )
depends=(
    'gsasl' 
    'gnutls'
	)

#pkgver() {
#  cd ${srcdir}/${pkgname}
#  printf "$_ver.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
#}

prepare() {
    cd ${srcdir}/${_pkgname}
    git checkout master
    git pull
}

build() {
    cmake \
    -B build \
    -S "${_pkgname}" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=/usr/lib/ \
    -DCMAKE_BUILD_TYPE=Release

    cmake --build build
}

package_vmime() {
    cd build
    make DESTDIR="$pkgdir" install
}

package_vmime-libonly() {
    cd build
    make DESTDIR="$pkgdir" install

    # fix for parallel installation
    rm -rf ${pkgdir}/usr/include
    rm -rf ${pkgdir}/usr/lib/libvmime.so
    rm -rf ${pkgdir}/usr/lib/pkgconfig
}

