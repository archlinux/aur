# Maintainer: Niklas <dev@n1klas.net>

pkgname='homegear-intertechno'
_gitname='Homegear-Intertechno'
pkgdesc='Intertechno module for Homegear'
pkgver=0.7.10
pkgrel=1
arch=('x86_64' 'i686' 'armv6h' 'armv7h' 'aarch64')
license=('GPL3')
url="https://homegear.eu"
depends=('homegear')
source=("https://github.com/Homegear/${_gitname}/archive/${pkgver}.tar.gz")
sha512sums=('17b8ba99ccb33e4fefb0861c2af2f285088b1b4f371097de9e701249edf6d9f32a95a0aea2840202d9dee41893952a56e8e707033e1ffa436b5a3a9aef1cdba2')
install=homegear-intertechno.install
backup=('etc/homegear/families/intertechno.conf')

prepare() {
    cd "${srcdir}/${_gitname}-${pkgver}"

    # Use the our version number instead of the script which would have fetched it from Github
    sed -i -e "s#m4_esyscmd_s(\[./getVersion.sh\])#${pkgver}#" configure.ac
    # Put the modules in /usr/lib instead of /var/lib because that is where they belong
    sed -i -e 's#libdir = $(localstatedir)/lib/homegear/modules#libdir = $(prefix)/lib/homegear/modules#' src/Makefile.am
}

build() {
    cd "${srcdir}/${_gitname}-${pkgver}"

    ./bootstrap
    ./configure --prefix=/usr --localstatedir=/var --sysconfdir=/etc --libdir=/usr/lib
	make
}

package() {
    cd "${srcdir}/${_gitname}-${pkgver}"

    make DESTDIR="${pkgdir}" install

    install -Dm644 misc/Config\ Directory/intertechno.conf "${pkgdir}"/etc/homegear/families/intertechno.conf
    install -dm755 "${pkgdir}"/etc/homegear/devices/16
    cp -r misc/Device\ Description\ Files/* "${pkgdir}"/etc/homegear/devices/16
    chmod 644 "${pkgdir}"/etc/homegear/devices/16/*

    cd "${pkgdir}"/etc/homegear/devices/16
    for filename in *.xml
    do
        backup+=("etc/homegear/devices/16/${filename}")
    done
}
