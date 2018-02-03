# Maintainer: Niklas <dev@n1klas.net>

pkgname='homegear-homematicwired'
_gitname='Homegear-HomeMaticWired'
pkgdesc='HomeMatic Wired module for Homegear'
pkgver=0.7.15
pkgrel=1
arch=('x86_64' 'i686' 'armv6h' 'armv7h' 'aarch64')
license=('GPL3')
url="https://homegear.eu"
depends=('homegear')
source=("https://github.com/Homegear/${_gitname}/archive/${pkgver}.tar.gz")
sha512sums=('681f0543188390331df228e814e5018c7ef266b180681b36940654abff95a9947c49bd971ea09e38edd482a8441698ac15d809b0137f1f92cf968f56f8a52eef')
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
