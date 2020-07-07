# Maintainer: Christian Rebischke <chris.rebischke@archlinux.org>
# Contributor: Keerthan Jaic <jckeerthan at gmail dot com>
# Contributor: Rich Li <rich at dranek com>
# Contributor: Kevin MacMartin <prurigro at gmail dot com>
# Contributor: Markus Holtermann <aur@markusholtermann.eu>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=taskd
pkgver=1.1.0
pkgrel=5
pkgdesc="A lightweight, secure server providing multi-user, multi-client access to task data"
url="http://tasktools.org/projects/${pkgname}.html"
license=('MIT')
arch=('x86_64')
depends=('gnutls' 'libutil-linux')
makedepends=('cmake')
install="${pkgname}.install"
source=("https://taskwarrior.org/download/${pkgname}-${pkgver}.tar.gz"
        "${pkgname}.sysusers.conf")

sha512sums=('df2349c354258fd1b014b1a9c78f68dc10c9e5a48357e282e8a760cf4e4aaf4d36486796ad094ee2b050e7506195b778e3316c90ef543a2f8242de313daa13aa'
            '882ffe7de4bf569a16595d69cfd827fffd23beae7af19c90748bc2ee23e74f8313bcd2733131155d8fea4a37a207b052255fa5aeb6b61b47e4207332f7083e04')

build() {
    cd "${pkgname}-${pkgver}"
    cmake . \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release
    make
}

package() {
    cd "${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
    cp -a {pki,scripts} "${pkgdir}/usr/share/doc/taskd/"

    install -Dm644 "${srcdir}/${pkgname}.sysusers.conf" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
    install -Dm644 "scripts/systemd/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
