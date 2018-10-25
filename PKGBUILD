# Maintainer: Niklas <dev@n1klas.net>

pkgname='homegear-nodes-core'
pkgdesc='Homegear core nodes for Node-BLUE'
pkgver=0.7.30
pkgrel=1
arch=('x86_64' 'i686' 'armv6h' 'armv7h' 'aarch64')
license=('GPL3')
url="https://homegear.eu"
depends=('libhomegear-base=0.7.30' 'libhomegear-node=0.7.30')
source=("https://github.com/Homegear/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('8f3cf4c12148cfeb878fbb9f1c32ef3f42bf230e2b9c73db595fe3a0f263780b23646fa70c3b1ed76f79ba3c030a4cbd5bdcd0070ac03e3d995615211d6f6bf0')

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
