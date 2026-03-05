# Maintainer: Yeyito <yeyito@yeyito.dev>
pkgname=laurel-server-git
pkgver=r0
pkgrel=1
pkgdesc='Laurel clip server — serves video clips with a management UI and API'
arch=('any')
url='https://github.com/Yeyito777/Laurel-server'
license=('MIT')
depends=('nginx' 'python' 'ffmpeg')
optdepends=(
    'certbot: HTTPS certificate management'
    'certbot-nginx: certbot nginx plugin'
)
makedepends=('git')
provides=('laurel-server')
conflicts=('laurel-server')
install=laurel-server.install
backup=(
    'etc/laurel-server.conf'
    'etc/nginx/sites-available/laurel.conf'
)
source=('git+https://github.com/Yeyito777/Laurel-server.git')
sha256sums=('SKIP')

pkgver() {
    cd Laurel-server
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd Laurel-server

    # API binary
    install -Dm755 laurel-api "$pkgdir/usr/bin/laurel-api"

    # Systemd service (vanilla — user edits /etc/laurel-server.conf, not this)
    install -Dm644 laurel-api.service "$pkgdir/usr/lib/systemd/system/laurel-api.service"

    # Config
    install -Dm644 laurel-server.conf.example "$pkgdir/etc/laurel-server.conf"

    # Nginx template
    install -Dm644 laurel.nginx.conf "$pkgdir/etc/nginx/sites-available/laurel.conf"

    # Shared files (homepage, deploy hook template)
    install -Dm644 index.html "$pkgdir/usr/share/laurel-server/index.html"
    install -Dm644 post-receive "$pkgdir/usr/share/laurel-server/post-receive"

    # Clip directory
    install -dm755 "$pkgdir/srv/clips"
}
