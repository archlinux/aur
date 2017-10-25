# Maintainer: Niklas <dev@n1klas.net>

pkgname='homegear-insteon'
_gitname='Homegear-Insteon'
pkgdesc='Insteon module for Homegear'
pkgver=0.7.10
pkgrel=1
arch=('x86_64' 'i686' 'armv6h' 'armv7h' 'aarch64')
license=('GPL3')
url="https://homegear.eu"
depends=('homegear')
source=("https://github.com/Homegear/${_gitname}/archive/${pkgver}.tar.gz")
sha512sums=('ae54c49f2d06cdaacb27366eef507a64d7b1334a7943c5515f1f6fad951a6702ccd59451c44664ae69568f9de45c72ff85e068fac24cad38cf2f8bb64513fd13')
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
