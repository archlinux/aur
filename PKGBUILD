# Maintainer: Niklas <dev@n1klas.net>

pkgname='homegear-nodes-core'
pkgdesc='Homegear core nodes for Node-BLUE'
pkgver=0.7.10
pkgrel=1
arch=('x86_64' 'i686' 'armv6h' 'armv7h' 'aarch64')
license=('GPL3')
url="https://homegear.eu"
depends=('libhomegear-base' 'libhomegear-node' 'libmodbus')
source=("https://github.com/Homegear/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('363296f75ca936df40d12e726b2ee4f9f7a504708497d1b8018b1200ebb06f36c6bc7ce60a2478c7038354079d42bfbb48681db47e926b59ced12a485bb93511')

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
