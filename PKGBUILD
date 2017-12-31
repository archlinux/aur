# Maintainer: Niklas <dev@n1klas.net>

pkgname='homegear-intertechno'
_gitname='Homegear-Intertechno'
pkgdesc='Intertechno module for Homegear'
pkgver=0.7.12
pkgrel=1
arch=('x86_64' 'i686' 'armv6h' 'armv7h' 'aarch64')
license=('GPL3')
url="https://homegear.eu"
depends=('homegear')
source=("https://github.com/Homegear/${_gitname}/archive/${pkgver}.tar.gz")
sha512sums=('d60838c921a0cdd9d6345770d8357a21d0bf8090ab7a57e5ef036c3e50ebd9ea6a3d7ba71e476eec3943b46ab66ee72f5b0816e01e2288cb3e101177947d8613')
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
