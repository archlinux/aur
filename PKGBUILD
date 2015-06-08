# Maintainer: Carl George < arch at cgtx dot us >
# Contributor: Julien Nicoulaud <julien.nicoulaud@gmail.com>
# Contributor: Superstar655 <choman000 at hotmail dot com>

pkgname="sickbeard"
pkgver="507"
pkgrel="1"
pkgdesc="A PVR application that downloads and manages your TV shows."
arch=("any")
url="http://sickbeard.com"
license=("GPL3")
depends=("python2-cheetah")
optdepends=("sabnzbd: a NZB downloader that integrates well with Sick-Beard"
            "python-notify: to enable desktop notifications")
backup=("etc/conf.d/${pkgname}"
        "var/lib/${pkgname}/config.ini")
install="${pkgname}.install"
conflicts=("${pkgname}-git")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/midgetspy/Sick-Beard/tarball/build-${pkgver}"
        "${pkgname}.sh"
        "${pkgname}.conf.d"
        "${pkgname}.service"
        "${pkgname}.tmpfiles"
        "${pkgname}.ini")
sha256sums=('5d5eed641e6493d9d765feba3e87cd1b17d8b415cce8d5f21956ba5bf7283a59'
            '92124fb1f92b1f28e9e5454fead8ee361ac6bc952e17672fdd324cc495be1d33'
            '6e8a542ab64a98db29f9f7ff5f259a2dad2980005f94b6b54f8fe0a014fce2e4'
            '410143de1f90a8bb432f48b9f30c0abea29ba17e54d3f2fb339edcbdf913c5f1'
            'c370f3a7539bcb1a65de6a7e95935279a33c1f8944939a1fd1e091552daa09e4'
            '04f02a812ab2eff2ba806d4b59b2fc408ee24e9872ac2b43dd871a153c66d77e')

build() {
    cd "${srcdir}"/midgetspy*/

    msg2 "Remove unneeded stuff..."
    rm -rvf tests/ init.* setup.py updater.py updates.txt googlecode_upload.py

    msg2 "Fix standalone Python scripts shebangs and permissions..."
    for f in autoProcessTV/autoProcessTV.py \
             autoProcessTV/hellaToSickBeard.py \
             autoProcessTV/sabToSickBeard.py \
             SickBeard.py
    do
        sed -i "1s/python/python2/" ${f}
        chmod -v +x ${f}
    done

    msg2 "Set version in version.py..."
    sed -i "1s/build Nonea/${pkgver}/" sickbeard/version.py
}

package() {
    cd "${srcdir}"/midgetspy*/

    msg2 "Install sources in /usr/lib/${pkgname}..."
    install -dm755                                                 "${pkgdir}/usr/lib/${pkgname}"
    cp -r {autoProcessTV,cherrypy,data,lib,sickbeard,SickBeard.py} "${pkgdir}/usr/lib/${pkgname}/"

    msg2 "Generate /usr/lib/${pkgname}/version.txt..."
    echo 0 > "${pkgdir}/usr/lib/${pkgname}/version.txt"

    msg2 "Install executable in /usr/bin..."
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

    msg2 "Install daemon script in /usr/lib/systemd/system..."
    install -Dm644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"

    msg2 "Install daemon conf file in /etc/conf.d..."
    install -Dm644 "${srcdir}/${pkgname}.conf.d" "${pkgdir}/etc/conf.d/${pkgname}"

    msg2 "Install temporary files configuration in /usr/lib/tmpfiles.d..."
    install -Dm644 "${srcdir}/${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"

    msg2 "Install configuration file in /var/lib/${pkgname}..."
    install -Dm644 "${srcdir}/${pkgname}.ini" "${pkgdir}/var/lib/${pkgname}/config.ini"

    msg2 "Install documentation resources in /usr/share/doc/${pkgname}..."
    install -Dm644 readme.md "${pkgdir}/usr/share/doc/${pkgname}/readme.md"

    msg2 "Install copyright resources in /usr/share/licenses/${pkgname}..."
    install -Dm644 COPYING.txt "${pkgdir}/usr/share/licenses/${pkgname}/COPYING.txt"
}

# vim:set ts=4 sts=4 sw=4 et:
