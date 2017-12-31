# Maintainer: Niklas <dev@n1klas.net>

pkgname='homegear-nodes-core'
pkgdesc='Homegear core nodes for Node-BLUE'
pkgver=0.7.12
pkgrel=1
arch=('x86_64' 'i686' 'armv6h' 'armv7h' 'aarch64')
license=('GPL3')
url="https://homegear.eu"
depends=('libhomegear-base' 'libhomegear-node' 'libmodbus')
source=("https://github.com/Homegear/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('317423a2f024027091e448cfa44924696c7bdb62059543d797eed919095e6affc8ba7a1157ccb301eec9bfc286f37c832d8c24489e62f25ec325abb8566b557a')

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
