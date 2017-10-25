# Maintainer: Niklas <dev@n1klas.net>

pkgname='homegear-homematicwired'
_gitname='Homegear-HomeMaticWired'
pkgdesc='HomeMatic Wired module for Homegear'
pkgver=0.7.10
pkgrel=1
arch=('x86_64' 'i686' 'armv6h' 'armv7h' 'aarch64')
license=('GPL3')
url="https://homegear.eu"
depends=('homegear')
source=("https://github.com/Homegear/${_gitname}/archive/${pkgver}.tar.gz")
sha512sums=('5fe788a5165563f67fb9b49485cf3b7ca2f95a4b6394b7604e1da89e0db01e555a80b243eef14db9104adaa65629a4e935be949aa1f3800329d79aace232c3f4')
install=homegear-homematicwired.install
backup=('etc/homegear/families/homematicwired.conf')

prepare() {
    cd "${srcdir}/${_gitname}-${pkgver}"

    # Use the our version number instead of the script which would have fetched it from Github
    sed -i -e "s#m4_esyscmd_s(\[./getVersion.sh\])#${pkgver}#" configure.ac
    # Put the modules in /usr/lib instead of /var/lib because that is where they belong
    sed -i -e 's#libdir = $(localstatedir)/lib/homegear/modules#libdir = $(prefix)/lib/homegear/modules#' src/Makefile.am
    # Always put the downloaded firmware where they belong no matter where the script is
    sed -i -e 's#$( cd "$(dirname $0)" && pwd )#/var/lib/homegear/firmware#g' misc/Data\ Directory/firmware/GetFirmwareUpdatesHomeMaticWired.sh
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

    install -Dm644 misc/Config\ Directory/homematicwired.conf "${pkgdir}"/etc/homegear/families/homematicwired.conf
    install -dm755 "${pkgdir}"/etc/homegear/devices/1
    cp -r misc/Device\ Description\ Files/* "${pkgdir}"/etc/homegear/devices/1
    chmod 644 "${pkgdir}"/etc/homegear/devices/1/*

    install -Dm755 misc/Data\ Directory/firmware/GetFirmwareUpdatesHomeMaticWired.sh "${pkgdir}"/usr/bin/homegear-homematicwired-update-firmware

    cd "${pkgdir}"/etc/homegear/devices/1
    for filename in *.xml
    do
        backup+=("etc/homegear/devices/1/${filename}")
    done
}
