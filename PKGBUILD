# Package build for homegear (https://www.homegear.eu/index.php/Main_Page)
# Maintainer: Henning <me@hensur.de>
# Contributor: Niklas <dev@n1klas.net>
# Contributor: Michael Lipp <mnl at mnl dot de>

pkgname='homegear'
_gitname='Homegear'
pkgdesc='Interface your HomeMatic BidCoS, HomeMatic Wired, MAX!, INSTEON or Philips hue devices with your home automation software or your own control scripts'
pkgver=0.7.30
pkgrel=2
arch=('x86_64' 'i686' 'armv6h' 'armv7h' 'aarch64')
license=('LGPL3')
url="https://homegear.eu"
depends=('sqlite3' 'libxslt' 'libzip' 'gnutls' 'homegear-nodes-core=0.7.30' 'libhomegear-ipc=0.7.30' 'php-homegear')
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
sha512sums=('8f8065b05863b2c6e634cfadb982efe5f2281c616f47c1a0794642de9cec8d49decc6ff05f5d1b7c35da272ba8b257441ad1947eded9891adbe1fec28601df03'
            '825ff21b64323122108aba9d4aaf0a0a2ea5107eb225255d29fa95bd2710e00201fda0d99adeed2890fe7eec17b867e4626fd2dacddd5f9743cf6a07d7ca5333'
            'c58a093cc923551e8482503962bfb9f043ee651b2d9954df6a8bf478715848bdac226dc0f3eb4e4f4aa44cdc9c7ca041560db735e27d6cc89122d02e2ffecc2a'
            'aed267cb77c6a23a563152a17781cbe12fe14b68ed3d77dc75145c6422c3818f0d3550b5d20609d06e0bf937f24627806c0bfb3201fd27da0b420f6fbd4ebc66'
            '23fb3b1a49f7b3433bd71ca262545aa31d67e7ae88801b41a7c1e306be926a06b7b29389cc63f3342cf8f5e55f908dc0847be6ba7d6b2657018240883a658ce0'
            'b603487c3273c3e7abd9a4ad28ace16d309ef59750ea29737f5d93bbd607cfe322c6f79f68a555ed6fee7370d319ac9be3ff284794caad3be1ebb24f5b792647'
            '2681aa09982b621161c5d082064d4188dc97b738ffd8fa24e615bf22b338902d45c06d229ea480df80cc48878294d24325552a959d72649a1a4bd1adadb8ba41'
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

    cp -r "misc/State Directory/"{node-blue,www} "${pkgdir}/usr/lib/homegear"
    cp -r "misc/State Directory/scripts" "${pkgdir}/var/lib/homegear"
    find "${pkgdir}/usr/lib/homegear/www" -type d -exec chmod 755 {} \;
    find "${pkgdir}/usr/lib/homegear/node-blue" -type d -exec chmod 755 {} \;
    find "${pkgdir}/usr/lib/homegear/www" -type f -exec chmod 644 {} \;
    find "${pkgdir}/usr/lib/homegear/node-blue" -type f -exec chmod 644 {} \;
    install -dm750 "${pkgdir}/var/lib/homegear/node-blue/data"
    install -dm750 "${pkgdir}/var/lib/homegear/phpinclude"
    install -dm750 "${pkgdir}/var/lib/homegear/scripts"
    install -dm750 "${pkgdir}/var/lib/homegear/tmp"
    install -dm750 "${pkgdir}/var/lib/homegear/firmware"

    install -dm755 "${pkgdir}"/etc/homegear/devices/254
    cp -r "homegear-miscellaneous/misc/Device Description Files/"* "${pkgdir}/etc/homegear/devices/254"
    chmod 644 "${pkgdir}/etc/homegear/devices/254/"*

    install -Dm644 "${srcdir}/homegear.service" "${pkgdir}/usr/lib/systemd/system/homegear.service"
    install -Dm644 "${srcdir}/homegear.sysusers" "${pkgdir}/usr/lib/sysusers.d/homegear.conf"
    install -Dm644 "${srcdir}/homegear.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/homegear.conf"
    install -Dm644 "${srcdir}/homegear.logrotate" "${pkgdir}/etc/logrotate.d/homegear"
}
