# Maintainer: Niklas <dev@n1klas.net>

pkgname='homegear-max'
_gitname='Homegear-MAX'
pkgdesc='eQ-3 MAX! module for Homegear'
pkgver=0.7.18
pkgrel=1
arch=('x86_64' 'i686' 'armv6h' 'armv7h' 'aarch64')
license=('GPL3')
url="https://homegear.eu"
depends=('homegear=0.7.18')
source=("https://github.com/Homegear/${_gitname}/archive/${pkgver}.tar.gz")
sha512sums=('75d18c4efb6d54f7dec17c71749b5495c24ff467ec307708521a8d74aad6e7b107f72dbfc6b2b1e44005374b15156d7f0a0122e73830199e1e2637ac94395308')
install=homegear-max.install
backup=('etc/homegear/families/max.conf')

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

    install -Dm644 misc/Config\ Directory/max.conf "${pkgdir}"/etc/homegear/families/max.conf
    install -dm755 "${pkgdir}"/etc/homegear/devices/4
    cp -r misc/Device\ Description\ Files/* "${pkgdir}"/etc/homegear/devices/4
    chmod 644 "${pkgdir}"/etc/homegear/devices/4/*

    cd "${pkgdir}"/etc/homegear/devices/4
    for filename in *.xml
    do
        backup+=("etc/homegear/devices/4/${filename}")
    done
}
