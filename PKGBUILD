# Maintainer: Niklas <dev@n1klas.net>

pkgname='homegear-philipshue'
_gitname='Homegear-PhilipsHue'
pkgdesc='Philips Hue module for Homegear'
pkgver=0.7.15
pkgrel=1
arch=('x86_64' 'i686' 'armv6h' 'armv7h' 'aarch64')
license=('GPL3')
url="https://homegear.eu"
depends=('homegear')
source=("https://github.com/Homegear/${_gitname}/archive/${pkgver}.tar.gz")
sha512sums=('bcf18ee5663911373016b1923c30cd69e2c48947ad6fe3c72891be4b7d503a96075cffbc825d2a41761c96464787ce71ffac6b3af44bf213f9214619d0cd7734')
install=homegear-philipshue.install
backup=('etc/homegear/families/philipshue.conf')

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

    install -Dm644 misc/Config\ Directory/philipshue.conf "${pkgdir}"/etc/homegear/families/philipshue.conf
    install -dm755 "${pkgdir}"/etc/homegear/devices/5
    cp -r misc/Device\ Description\ Files/* "${pkgdir}"/etc/homegear/devices/5
    chmod 644 "${pkgdir}"/etc/homegear/devices/5/*

    cd "${pkgdir}"/etc/homegear/devices/5
    for filename in *.xml
    do
        backup+=("etc/homegear/devices/5/${filename}")
    done
}
