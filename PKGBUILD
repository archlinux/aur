# Maintainer: Niklas <dev@n1klas.net>

pkgname='homegear-nodes-core'
pkgdesc='Homegear core nodes for Node-BLUE'
pkgver=0.7.15
pkgrel=1
arch=('x86_64' 'i686' 'armv6h' 'armv7h' 'aarch64')
license=('GPL3')
url="https://homegear.eu"
depends=('libhomegear-base' 'libhomegear-node' 'libmodbus')
source=("https://github.com/Homegear/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('e468362ecac27f12e931b84e26f4db8ab57ef4293b0660ba6e3e39504d96ae192a18d97487e4e3a7ed8ed58a622472d1c928fbadaab270659e75d59ddd47d42b')

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
