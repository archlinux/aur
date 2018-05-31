# Maintainer: Niklas <dev@n1klas.net>

pkgname='homegear-homematicwired'
_gitname='Homegear-HomeMaticWired'
pkgdesc='HomeMatic Wired module for Homegear'
pkgver=0.7.18
pkgrel=1
arch=('x86_64' 'i686' 'armv6h' 'armv7h' 'aarch64')
license=('GPL3')
url="https://homegear.eu"
depends=('homegear=0.7.18')
source=("https://github.com/Homegear/${_gitname}/archive/${pkgver}.tar.gz")
sha512sums=('acffa9a89357688c49addd984ef6e64fc892870ddffccbfe4c377c250b34091b3015774333521bfccd4c86081cf75c5314e1bf235fb5150c587864e23a82d2a0')
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
