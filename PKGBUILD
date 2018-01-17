# Maintainer: Joakim Nylen (jnylen) <me@jnylen.nu>

pkgname=jotta-cli
pkgver=0.3.4195
pkgrel=1
pkgdesc="Jottacloud CLI."
makedepends=()
arch=('x86_64' 'i686')
license=('custom: (C) Jotta AS 2018')
url="http://docs.jottacloud.com/jottacloud-command-line-tool"
options=('!strip' '!upx')

provides=('jotta-cli')
conflicts=()

sha256sums_x86_64=('fe249d2e6406e1bcb3c7006a02a4bad7ebc1c60187b22ead4216e9ae1a391563')
sha256sums_i686=('ff1539e894d6744661de67bcf5fd32e3568ec4201a50e940bd12782430d7f55e')

source_x86_64=("https://repo.jotta.us/debian/pool/main/j/jotta-cli/jotta-cli_${pkgver}_amd64.deb")

source_i686=("https://repo.jotta.us/debian/pool/main/j/jotta-cli/jotta-cli_${pkgver}_i386.deb")

depends=('systemd')
optdepends=()

package() {
    cd ${srcdir}

    tar -xvf data.tar.gz -C ${pkgdir} --exclude='./control'

    mv "${pkgdir}"/lib "${pkgdir}"/usr/lib
    mv "${pkgdir}"/etc "${pkgdir}"/usr/etc

    chmod -R go-w "${pkgdir}"/usr
}

post_install() {
    echo "Enabling systemd services"
    systemctl enable jottad.service
    echo "Starting systemd services"
    systemctl start jottad.service
}

post_upgrade() {
    echo "Reloading systemd"
    systemctl daemon-reload
}