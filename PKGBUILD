# Maintainer: Niklas <dev@n1klas.net>
# Contributor: Michael Lipp <mnl at mnl dot de>

pkgname='homegear'
_gitname='Homegear'
pkgdesc='Interface your HomeMatic BidCoS, HomeMatic Wired, MAX!, INSTEON or Philips hue devices with your home automation software or your own control scripts'
pkgver=0.7.10
pkgrel=1
arch=('x86_64' 'i686' 'armv6h' 'armv7h' 'aarch64')
license=('LGPL3')
url="https://homegear.eu"
depends=('sqlite3' 'libxslt' 'gnutls' 'homegear-nodes-core' 'php7-homegear')
optdepends=('homegear-homematicbidcos: Support for eQ-3 HomeMatic BidCoS (wireless) devices'
            'homegear-homematicwired: Support for eQ-3 HomeMatic Wired devices'
            'homegear-insteon: Support for Insteon devices'
            'homegear-intertechno: Support for Intertechno devices'
            'homegear-max: Support for eQ-3 MAX! devices'
            'homegear-philipshue: Support for Philips Hue')
source=("https://github.com/Homegear/${_gitname}/archive/${pkgver}.tar.gz"
	    'homegear.service'
	    'homegear.logrotate'
        'homegear-gnutls.patch'
        'homegear-config.patch'
        'homegear-ssl-optional.patch')
sha512sums=('f494396d58580c8059a8eea5e7b196372b507380af3c48a5036e45bb720b2c2259340bc4853600218ba0722460801fe54edc7e7cebfd6c03e19335153658dc9d'
            '52b7b1b37c1d6b958081c97a733a0b17207a66c5b3c2a51f8abd1659aa1220ee6805f9ee47d241fa63b9124534b3958f04fc41b8b2e8132487d904550af5a26c'
            'c58a093cc923551e8482503962bfb9f043ee651b2d9954df6a8bf478715848bdac226dc0f3eb4e4f4aa44cdc9c7ca041560db735e27d6cc89122d02e2ffecc2a'
            'b55c2e38e3aae22ecd1b3af65aebb7767400cf134f317ffad6f139c4f8681c587fbf7268b098c44796439dc51d9e4c05aadb1fe1d864b8ea1d8902f0409c5127'
            '8bc3908e78f77a496d3c13bee0fa02cad2307b13bc3dc06b05cb5e08c774bc046e58d6c0967ed4216dddf49aac4288b641dc5d5b8006b7c47b9b95abe4fd0cd0'
            '5b25817cbbf5a5fb1d7c8414d36441de18cef3c43693329facb84b4312fd83c92bfcf6100937f3e5c9a7329e4ba80de1418cc0b9374c46d14255a612e8617498')
install='homegear.install'
backup=('etc/homegear/main.conf'
        'etc/homegear/mqtt.conf'
        'etc/homegear/rpcclients.conf'
        'etc/homegear/rpcservers.conf'
        'etc/homegear/php.ini'
        'etc/homegear/families/miscellaneous.conf'
        'etc/homegear/devices/254/template.xml'
        'etc/logrotate.d/homegear')

prepare() {
    cd "${srcdir}/${_gitname}-${pkgver}"

    # Use the our version number instead of the script which would have fetched it from Github
    sed -i -e "s#m4_esyscmd_s(\[./getVersion.sh\])#${pkgver}#" configure.ac
    # Put the modules in /usr/lib instead of /var/lib because that is where they belong
    sed -i -e 's#libdir = $(localstatedir)/lib/homegear/modules#libdir = $(prefix)/lib/homegear/modules#' homegear-miscellaneous/src/Makefile.am

    patch -p1 -i "${srcdir}"/homegear-gnutls.patch
    patch -p1 -i "${srcdir}"/homegear-config.patch
    patch -p1 -i "${srcdir}"/homegear-ssl-optional.patch
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

    install -dm755 "${pkgdir}"/etc/homegear
    cp -r misc/Config\ Directory/* "${pkgdir}"/etc/homegear
	rm "${pkgdir}"/etc/homegear/homegear-{start,stop}.sh
    chmod 644 "${pkgdir}"/etc/homegear/*.conf

    install -dm750 "${pkgdir}"/var/lib/homegear
    install -dm755 "${pkgdir}"/var/log/homegear

    cp -r misc/State\ Directory/* "${pkgdir}"/var/lib/homegear
    rm -r "${pkgdir}"/var/lib/homegear/www/rpc/.idea
    find "${pkgdir}"/var/lib/homegear/www -type d -exec chmod 550 {} \;
	find "${pkgdir}"/var/lib/homegear/www -type f -exec chmod 440 {} \;
    install -dm750 "${pkgdir}"/var/lib/homegear/flows/data
    install -dm750 "${pkgdir}"/var/lib/homegear/phpinclude
    install -dm550 "${pkgdir}"/var/lib/homegear/scripts
    install -dm750 "${pkgdir}"/var/lib/homegear/firmware

    install -Dm755 homegear-miscellaneous/misc/Device\ Description\ Files/Template.xml "${pkgdir}"/etc/homegear/devices/254/template.xml

    install -Dm755 "${srcdir}"/homegear.service "${pkgdir}"/usr/lib/systemd/system/homegear.service
    install -Dm755 "${srcdir}"/homegear.logrotate "${pkgdir}"/etc/logrotate.d/homegear
}
