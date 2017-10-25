# Maintainer: Niklas <dev@n1klas.net>

pkgname='homegear-homematicbidcos'
_gitname='Homegear-HomeMaticBidCoS'
pkgdesc='HomeMatic BidCoS module for Homegear'
pkgver=0.7.10
pkgrel=1
arch=('x86_64' 'i686' 'armv6h' 'armv7h' 'aarch64')
license=('GPL3')
url="https://homegear.eu"
depends=('homegear')
source=("https://github.com/Homegear/${_gitname}/archive/${pkgver}.tar.gz")
sha512sums=('f67eac103a5fa70476de97cf45c9c2316afb8fcad29fe0da14cac217b61a70fd18161a09dc584eef7f92fc1c6da85dca761d23717d74e3a047c6405e4880cab5')
install=homegear-homematicbidcos.install
backup=('etc/homegear/families/homematicbidcos.conf')

prepare() {
    cd "${srcdir}/${_gitname}-${pkgver}"

    # Use the our version number instead of the script which would have fetched it from Github
    sed -i -e "s#m4_esyscmd_s(\[./getVersion.sh\])#${pkgver}#" configure.ac
    # Put the modules in /usr/lib instead of /var/lib because that is where they belong
    sed -i -e 's#libdir = $(localstatedir)/lib/homegear/modules#libdir = $(prefix)/lib/homegear/modules#' src/Makefile.am
    # Always put the downloaded firmware where they belong no matter where the script is
    sed -i -e 's#$( cd "$(dirname $0)" && pwd )#/var/lib/homegear/firmware#g' misc/Data\ Directory/firmware/GetFirmwareUpdatesHomeMaticBidCoS.sh
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

    install -Dm644 misc/Config\ Directory/homematicbidcos.conf "${pkgdir}"/etc/homegear/families/homematicbidcos.conf
    install -dm755 "${pkgdir}"/etc/homegear/devices/0
    cp -r misc/Device\ Description\ Files/* "${pkgdir}"/etc/homegear/devices/0
    chmod 644 "${pkgdir}"/etc/homegear/devices/0/*

    install -Dm755 misc/Data\ Directory/firmware/GetFirmwareUpdatesHomeMaticBidCoS.sh "${pkgdir}"/usr/bin/homegear-homematicbidcos-update-firmware

    cd "${pkgdir}"/etc/homegear/devices/0
    for filename in *.xml
    do
        backup+=("etc/homegear/devices/0/${filename}")
    done
}
