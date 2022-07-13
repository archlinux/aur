# Maintainer: tioguda <tioguda@gmail.com>
# Contributor: Rafael Fontenlle <rafaelff@gnome.org>

pkgname=warsaw-bin
_pkgver=2.21.3-1
pkgver=${_pkgver/-/.}
pkgrel=2
pkgdesc="Banking security tool developed by GAS Tecnologia"
arch=(x86_64)
url="https://diagnostico.gasantifraud.com"
license=('GPL-3.0-or-later')
depends=('dbus' 'procps-ng' 'python')
optdepends=('python-gpgme')
backup=('etc/init.d/warsaw' 'etc/init/warsaw.conf')
options=('!strip' '!emptydirs')
install=${pkgname}.install
conflicts=('warsaw')
provides=('warsaw')
source=("https://www.gnu.org/licenses/gpl-3.0.txt")
source_x86_64=("warsaw-${pkgver}-64.run::https://cloud.gastecnologia.com.br/gas/diagnostico/ubuntu_64bits.run")
sha256sums=('3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')
sha256sums_x86_64=('b7ebf7f6ae8e5251ab0948a91aefdee7f23cc2142d2519ddff674d76ea18abe6')

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
    install -Dm644 "$pkgdir"/usr/share/{doc,licenses}/${pkgname%-bin}/copyright
    rm -rf "$pkgdir/usr/share/doc"
}
