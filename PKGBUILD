# Maintainer: Niklas <dev@n1klas.net>

pkgname='homegear-insteon'
_gitname='Homegear-Insteon'
pkgdesc='Insteon module for Homegear'
pkgver=0.7.15
pkgrel=1
arch=('x86_64' 'i686' 'armv6h' 'armv7h' 'aarch64')
license=('GPL3')
url="https://homegear.eu"
depends=('homegear')
source=("https://github.com/Homegear/${_gitname}/archive/${pkgver}.tar.gz")
sha512sums=('99545e5ff5b4d0a824025afb76b4d8e7b26533c1c50e77817e8d5b93f74806bbe6904b4fdeed42ef230f0e551b9f99fa196484c0bbddf6d5be0acc62fb48e0c8')
install=homegear-insteon.install
backup=('etc/homegear/families/insteon.conf')

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

    install -Dm644 misc/Config\ Directory/insteon.conf "${pkgdir}"/etc/homegear/families/insteon.conf
    install -dm755 "${pkgdir}"/etc/homegear/devices/2
    cp -r misc/Device\ Description\ Files/* "${pkgdir}"/etc/homegear/devices/2
    chmod 644 "${pkgdir}"/etc/homegear/devices/2/*

    cd "${pkgdir}"/etc/homegear/devices/2
    for filename in *.xml
    do
        backup+=("etc/homegear/devices/2/${filename}")
    done
}
