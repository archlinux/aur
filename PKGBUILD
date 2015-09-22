# Maintainer: Tomasz Maciej Nowak <com[dot]gmail[at]tmn505>
pkgname='minisatip-git'
pkgdesc="SAT>IP server for linux using local DVB-S2, DVB-S or DVB-T cards"
pkgver=r192.b4f0bdb
pkgrel=1
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
url="https://github.com/catalinii/minisatip"
license=('GPL2')
provides=('minisatip')
conflicts=('minisatip')
makedepends=('git')
depends=('libdvbcsa' 'linuxtv-dvb-apps')
optdepends=('oscam: channels descrambling')
backup=('etc/conf.d/minisatip')
install='minisatip.install'
source=("git+https://github.com/catalinii/minisatip"
        'minisatip.service'
        'minisatip.sysuser'
        'minisatip.conf')
sha256sums=('SKIP'
            'ea3b7b52c33946c156f174c043015e6922af0c28ef43f9a4b4615e3abb36d4ad'
            '9f0ea2c29ab6c69bd444a6e4021928bbafc332c71735e1af975c3a973c3e5c2e'
            '42f3bb7ed053afa338535bd649b4738bf142a9d039010f6bd1a356cf51e80dbc')

pkgver() {
    cd ${srcdir}/minisatip
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd ${srcdir}/minisatip
    make DVBCA=yes
}

package() {
    cd ${srcdir}/minisatip
    install -Dm644 ../minisatip.service ${pkgdir}/usr/lib/systemd/system/minisatip.service
    install -Dm644 ../minisatip.sysuser ${pkgdir}/usr/lib/sysusers.d/minisatip.conf
    install -Dm644 ../minisatip.conf ${pkgdir}/etc/conf.d/minisatip
    install -Dm755 minisatip ${pkgdir}/usr/bin/minisatip
    mkdir -p ${pkgdir}/var/lib/minisatip
    cp -ar html ${pkgdir}/var/lib/minisatip
    chown -fR 183:183 ${pkgdir}/var/lib/minisatip
}
