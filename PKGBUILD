# Maintainer: Konstantin Stepanov <me@kstep.me>
pkgname=systemd-cron-next
pkgver=1.0.0
_gitver=1.0.0
pkgrel=1
pkgdesc="systemd generator to generate timers/services from crontab and anacrontab files"
url="https://github.com/systemd-cron/systemd-cron-next"
arch=('i686' 'x86_64')
license=('MIT')
depends=('systemd>=217' 'run-parts')
optdepends=('smtp-forwarder: sending emails')
makedepends=('rust>=1.4.0' 'cargo>=0.6.0')
provides=('cron' 'anacron')
conflicts=('cron' 'anacron')
replaces=('cron' 'anacron')
source=("https://github.com/systemd-cron/systemd-crontab-generator/archive/v${_gitver}.zip")
md5sums=('dc23fc6d65f4e01336d1db3ebea98d16')

build() {
    cd "${srcdir}/${pkgname}-${_gitver}"
    if which multirust; then
        multirust override stable
    fi
    ./configure --prefix="/usr" --confdir="/etc"
    DESTDIR="${pkgdir}" make build
}

package() {
    cd "${srcdir}/${pkgname}-${_gitver}"
    DESTDIR="${pkgdir}" make install
    install -d -m 775 ${pkgdir}/var/spool/cron
}
