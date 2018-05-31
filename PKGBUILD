# Package build for homegear (https://www.homegear.eu/index.php/Main_Page)
# Maintainer: Niklas <dev@n1klas.net>
# Contributor: Michael Lipp <mnl at mnl dot de>

pkgname='homegear'
_gitname='Homegear'
pkgdesc='Interface your HomeMatic BidCoS, HomeMatic Wired, MAX!, INSTEON or Philips hue devices with your home automation software or your own control scripts'
pkgver=0.7.18
pkgrel=1
arch=('x86_64' 'i686' 'armv6h' 'armv7h' 'aarch64')
license=('LGPL3')
url="https://homegear.eu"
depends=('sqlite3' 'libxslt' 'libzip' 'gnutls' 'homegear-nodes-core=0.7.18' 'php-homegear')
optdepends=('homegear-homematicbidcos: Support for eQ-3 HomeMatic BidCoS (wireless) devices'
            'homegear-homematicwired: Support for eQ-3 HomeMatic Wired devices'
            'homegear-insteon: Support for Insteon devices'
            'homegear-intertechno: Support for Intertechno devices'
            'homegear-max: Support for eQ-3 MAX! devices'
            'homegear-philipshue: Support for Philips Hue')
source=("https://github.com/Homegear/${_gitname}/archive/${pkgver}.tar.gz"
	    'homegear.service'
	    'homegear.logrotate'
        'homegear.sysusers'
        'homegear.tmpfiles'
        'homegear-makefile.patch'
        'homegear-config.patch'
        'homegear-ssl-optional.patch')
sha512sums=('32a480fc10a8acbee2670ecde57be4986e23eb73b8c98c6a6d71036ae5ea038036e1c8af14a3f358f6ab5559c8f7e2c8fd23c3b19eb0a8c892f304cbacfb4b4c'
            '825ff21b64323122108aba9d4aaf0a0a2ea5107eb225255d29fa95bd2710e00201fda0d99adeed2890fe7eec17b867e4626fd2dacddd5f9743cf6a07d7ca5333'
            'c58a093cc923551e8482503962bfb9f043ee651b2d9954df6a8bf478715848bdac226dc0f3eb4e4f4aa44cdc9c7ca041560db735e27d6cc89122d02e2ffecc2a'
            'aed267cb77c6a23a563152a17781cbe12fe14b68ed3d77dc75145c6422c3818f0d3550b5d20609d06e0bf937f24627806c0bfb3201fd27da0b420f6fbd4ebc66'
            '23fb3b1a49f7b3433bd71ca262545aa31d67e7ae88801b41a7c1e306be926a06b7b29389cc63f3342cf8f5e55f908dc0847be6ba7d6b2657018240883a658ce0'
            'c70d30f4f9ddd7a9fb876230f814e333d6319397049da97c6715887a471f6e4d62de236414323b70c87db8a039c95390e8cef33c30ed1aa47d694358ca1e8e13'
            'e09418e41f44e80aad18a342c1f4e7efc15e32d62483ea29c68c68ac7c644c2e42eb5673df9d8f90a51a0d65af8ee7867ca4d49df077f22195fb0d9e4970e398'
            '5b25817cbbf5a5fb1d7c8414d36441de18cef3c43693329facb84b4312fd83c92bfcf6100937f3e5c9a7329e4ba80de1418cc0b9374c46d14255a612e8617498')
install='homegear.install'
backup=('etc/homegear/main.conf'
        'etc/homegear/mqtt.conf'
        'etc/homegear/rpcclients.conf'
        'etc/homegear/rpcservers.conf'
        'etc/homegear/php.ini'
        'etc/homegear/families/miscellaneous.conf'
        'etc/homegear/devices/254/OpenWeatherMap.xml'
        'etc/homegear/devices/254/VirtualWindowContact.xml'
        'etc/logrotate.d/homegear')

prepare() {
    cd "${srcdir}/${_gitname}-${pkgver}"

    patch -p1 -i "${srcdir}"/homegear-makefile.patch
    patch -p1 -i "${srcdir}"/homegear-config.patch
    patch -p1 -i "${srcdir}"/homegear-ssl-optional.patch

    # Use the our version number instead of the script which would have fetched it from Github
    sed -i -e "s#m4_esyscmd_s(\[./getVersion.sh\])#${pkgver}#" configure.ac
    # Put the modules in /usr/lib instead of /var/lib because that is where they belong
    sed -i -e 's#libdir = $(localstatedir)/lib/homegear/modules#libdir = $(prefix)/lib/homegear/modules#' homegear-miscellaneous/src/Makefile.am
    # Fix enchant header path change
    sed -i -e 's# -lenchant # -lenchant-2 #' src/Makefile.am
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

    install -dm755 "${pkgdir}/etc/homegear"
    cp -r "misc/Config Directory/"* "${pkgdir}/etc/homegear"
	rm "${pkgdir}/etc/homegear/homegear-"{start,stop}.sh
    chmod 644 "${pkgdir}/etc/homegear/"*.conf

    install -dm750 "${pkgdir}/var/lib/homegear"
    install -dm755 "${pkgdir}/var/log/homegear"

    cp -r "misc/State Directory/"* "${pkgdir}/var/lib/homegear"
    find "${pkgdir}/var/lib/homegear/www" -type d -exec chmod 550 {} \;
	find "${pkgdir}/var/lib/homegear/www" -type f -exec chmod 440 {} \;
    install -dm750 "${pkgdir}/var/lib/homegear/flows/data"
    install -dm750 "${pkgdir}/var/lib/homegear/phpinclude"
    install -dm550 "${pkgdir}/var/lib/homegear/scripts"
    install -dm750 "${pkgdir}/var/lib/homegear/firmware"

    install -dm755 "${pkgdir}"/etc/homegear/devices/254
    cp -r "homegear-miscellaneous/misc/Device Description Files/"* "${pkgdir}/etc/homegear/devices/254"
    chmod 644 "${pkgdir}/etc/homegear/devices/254/"*

    install -Dm644 "${srcdir}/homegear.service" "${pkgdir}/usr/lib/systemd/system/homegear.service"
    install -Dm644 "${srcdir}/homegear.sysusers" "${pkgdir}/usr/lib/sysusers.d/homegear.conf"
    install -Dm644 "${srcdir}/homegear.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/homegear.conf"
    install -Dm644 "${srcdir}/homegear.logrotate" "${pkgdir}/etc/logrotate.d/homegear"
}
