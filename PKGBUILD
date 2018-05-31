# Maintainer: Niklas <dev@n1klas.net>

pkgname='homegear-nodes-core'
pkgdesc='Homegear core nodes for Node-BLUE'
pkgver=0.7.18
pkgrel=1
arch=('x86_64' 'i686' 'armv6h' 'armv7h' 'aarch64')
license=('GPL3')
url="https://homegear.eu"
depends=('libhomegear-base=0.7.18' 'libhomegear-node=0.7.18' 'libmodbus')
source=("https://github.com/Homegear/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('0cbf839ff505d1b1c0b144410674f3b3a65208c5a93b122eb356983c109a59f0c09af2c48d57bf0253c4a46a5bb54f67b8e379df6e7d4f906ee560b1d3d2f9f2')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    # Use the our version number instead of the script which would have fetched it from Github
    sed -i -e "s#m4_esyscmd_s(\[./getVersion.sh\])#${pkgver}#" configure.ac
    # Put the nodes in /usr/lib instead of /var/lib because that is where they belong
    find -name 'Makefile.am' -exec sed -i -e 's#libdir = $(localstatedir)/lib/homegear#libdir = $(prefix)/lib/homegear#' {} +
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    ./bootstrap
    ./configure --prefix=/usr --localstatedir=/var --sysconfdir=/etc --libdir=/usr/lib
	make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    make DESTDIR="${pkgdir}" install
}
