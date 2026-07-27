# Maintainer: tioguda  <guda.flavio@gmail.com>
# Contributor: Rafael Fontenlle <rafaelff@gnome.org>

pkgname=warsaw-bin
_pkgver=2.22.1-6
pkgver=${_pkgver/-/.}
pkgrel=4
pkgdesc="Provides the needed software to use some banking services"
arch=(x86_64)
url="https://www.topaz.com.br"
license=('GPL-3.0-or-later')
depends=('dbus' 'fontconfig' 'gcc' 'libcurl-gnutls' 'libstdc++' 'libxcursor' 'libxft' 'libxinerama' 'nss' 'procps-ng' 'python')
optdepends=('python-gpgme')
backup=('etc/init.d/warsaw' 'etc/init/warsaw.conf')
options=('!strip' '!emptydirs')
install=${pkgname}.install
conflicts=('warsaw')
provides=('warsaw')
source=("https://www.gnu.org/licenses/gpl-3.0.txt")
source_x86_64=("warsaw-${pkgver}-64.run::https://guardiao.itau.com.br/warsaw/warsaw_ubuntu.run")
sha256sums=('3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')
sha256sums_x86_64=('7b7e27961ccfb5ed9fb9d5eef00a44db81a6a0e778f96886464ffcacc28b9144')

prepare() {
    cd "${srcdir}"
    bsdtar -xpf warsaw-${pkgver}-64.run

    cd warsaw_setup
    ar -x warsaw_${_pkgver}_amd64.deb
    tar -xJf data.tar.xz
}

package() {
    cd "${srcdir}/warsaw_setup"
    # dump etc files to /etc
    cp -r etc "$pkgdir"
    # dump usr files to /usr
    cp -r usr "$pkgdir"
    # dump lib files to /lib
    cp -r lib "$pkgdir/usr/"

    # Install copyright and license in proper directory
    install -Dm644 "${srcdir}/gpl-3.0.txt" "${pkgdir}/usr/share/licenses/${pkgname%-bin}/LICENSE"
    install -Dm644 "${srcdir}/warsaw_setup/license-pt.html" "${pkgdir}/usr/share/licenses/${pkgname%-bin}/license-pt.html"
    install -Dm644 "$pkgdir"/usr/share/{doc,licenses}/${pkgname%-bin}/copyright
    rm -rf "$pkgdir/usr/share/doc"
}
