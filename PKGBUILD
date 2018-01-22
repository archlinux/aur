# Maintainer: Joakim Nylen (jnylen) <me@jnylen.nu>

pkgname=jotta-cli
pkgver=0.3.4269
pkgrel=1
pkgdesc="Jottacloud CLI."
makedepends=()
arch=('x86_64' 'i686')
license=('custom: (C) Jotta AS 2018')
url="http://docs.jottacloud.com/jottacloud-command-line-tool"
options=('!strip' '!upx')

provides=('jotta-cli')
conflicts=()

sha256sums_x86_64=('17e569ca5772f8c1da48112511e259079ee245191d02663ab5f18877067e0eec')
sha256sums_i686=('cb7aa62d4346bb60de056b77605af8e621b641520ace7ecd952c5d4277f725b6')

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