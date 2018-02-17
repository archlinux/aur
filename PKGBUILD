# Maintainer: Joakim Nylen (jnylen) <me@jnylen.nu>

pkgname=jotta-cli
pkgver=0.4.4914
pkgrel=1
pkgdesc="Jottacloud command line client to back up/share your files to/on Jottacloud."
makedepends=()
arch=('x86_64' 'i686')
license=('custom: (C) Jotta AS 2018')
url="http://docs.jottacloud.com/jottacloud-command-line-tool"
options=('!strip' '!upx')

provides=('jotta-cli')
conflicts=()

sha256sums_x86_64=('3882cea8ba0af218e4fc959effa02bf8eb58e9c88ceadd2f4a2aca549a82b6bb')
sha256sums_i686=('4ca3271901c734c9994e7726b81aa11a03ceabcb1e92b534ac20429974ba6d92')

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