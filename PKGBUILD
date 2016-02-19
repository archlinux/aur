# Maintainer: Sonic-Y3k <sonic.y3k@googlemail.com>
pkgname=plex-email
pkgver=0.6.2
pkgrel=3
pkgdesc="This script aggregates all new TV and movie releases for the past x days then writes to your web directory and sends out an email."
arch=('any')
url="https://github.com/jakewaldron/PlexEmail"
license=('Apache')
depends=('python2' 'python2-requests')
optdepends=('php-apache: to use the Apache web server')
conflicts=('plex-email-git')
provides=("plex-email")
install="plex-email.install"
backup=("etc/plex-email/config.conf")
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz" 'plex-email.service' 'plex-email.timer' 'apache.example.conf')
sha256sums=('bb155a522506af45be2a4440b76a7b699c2bedca9f1f4a2d4dbf36b7f6402bf3'
            'ae65e511241c0c7b696b084a6bf614085ba618a3e76af012896ef969818de325'
            '71709fa4a62b50f9a2353dacedc3b63f11d3305fd6d3346de9bac48358dde801'
            'a0622fce81068e495a29928f93f3ba1f0e214111c8dd6370ae51cf6fc158c78c')

package() {
        cd "${srcdir}/PlexEmail-${pkgver}"

        # install run-time files
	install -d "${pkgdir}/opt/plex-email"
        install -Dm644 README.md "${pkgdir}/opt/plex-email/"
        install -Dm755 scripts/plexEmail.py "${pkgdir}/opt/plex-email/"
        cp -ar scripts/cloudinary "${pkgdir}/opt/plex-email/"	

	# install config file
	install -d "${pkgdir}/etc/plex-email"
	install -Dm600 scripts/config.conf "${pkgdir}/etc/plex-email/"

        # install web files
	install -d "${pkgdir}/usr/share/webapps/"
        cp -ar web/ "${pkgdir}/usr/share/webapps/plex-email"

        # install service file
        install -Dm644 "${srcdir}/plex-email.service" "${pkgdir}/usr/lib/systemd/system/plex-email.service"
        install -Dm644 "${srcdir}/plex-email.timer" "${pkgdir}/usr/lib/systemd/system/plex-email.timer"

        # install apache config file
	install -d "${pkgdir}/etc/webapps/plex-email/"
        install -Dm 644 ${srcdir}/apache.example.conf  ${pkgdir}/etc/webapps/plex-email/
}

