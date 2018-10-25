# Maintainer: Niklas <dev@n1klas.net>

pkgname='homegear-homematicwired'
_gitname='Homegear-HomeMaticWired'
pkgdesc='HomeMatic Wired module for Homegear'
pkgver=0.7.30
pkgrel=1
arch=('x86_64' 'i686' 'armv6h' 'armv7h' 'aarch64')
license=('GPL3')
url="https://homegear.eu"
depends=('homegear=0.7.30')
source=("https://github.com/Homegear/${_gitname}/archive/${pkgver}.tar.gz")
sha512sums=('b541b6fb1d282a03456dcaec6e27547aeb8c11242d4df6cb5d82d63d58246987b3dfaf3dd4db300dd9e96c9575e47268a231191855eed595828cc6610f2bab18')
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
