# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=peertube-git
pkgver=1.0.0+beta.9+125+ga8bf1d82
pkgrel=1
pkgdesc='Federated (ActivityPub) video-streaming platform using P2P (BitTorrent) directly in the web browser with WebTorrent and Angular'
arch=(i686 x86_64)
depends=(nodejs-lts-carbon npm ffmpeg postgresql openssl redis)
makedepends=(git yarn python2)
optdepends=(nginx)
url=https://joinpeertube.org
license=(AGPL3)
provides=(peertube)
conflicts=(peertube)
backup=(etc/peertube/production.yaml)
install=peertube.install
source=(git+https://github.com/Chocobozzz/peertube)
sha512sums=(SKIP)

pkgver() {
  cd peertube
  git describe --tags | sed 's/v//;s/-/+/g'
}

build() {
  cd peertube
  yarn install --production --pure-lockfile
}

package() {
  install -d $pkgdir/usr/share/{webapps,doc/peertube}
  cp -a peertube $pkgdir/usr/share/webapps
  cd peertube
  install -Dm 644 config/production.yaml.example $pkgdir/etc/peertube/production.yaml
  sed -i s@/var/www/peertube@/var/lib/peertube@g $pkgdir/etc/peertube/production.yaml
  install -Dm 644 support/systemd/peertube.service $pkgdir/usr/lib/systemd/system/peertube.service
  sed -i 's@/var/www/peertube/config@/etc/peertube@;s@/var/www/peertube/peertube-latest@/usr/share/webapps/peertube@' $pkgdir/usr/lib/systemd/system/peertube.service
  cp -r support/doc/* $pkgdir/usr/share/doc/peertube
  cp support/nginx/peertube $pkgdir/usr/share/doc/peertube/example-nginx-config
  sed -i 's@/var/www/peertube/peertube-latest@/usr/share/webapps/peertube@;s@/var/www/peertube@/var/lib/peertube@' $pkgdir/usr/share/doc/peertube/example-nginx-config
  install -Dm 644 README.md $pkgdir/usr/share/doc/peertube/README.md
  install -Dm 644 FAQ.md $pkgdir/usr/share/doc/peertube/FAQ.md
  install -Dm 644 CREDITS.md $pkgdir/usr/share/doc/peertube/CREDITS.md
  install -Dm 644 LICENSE $pkgdir/usr/share/licenses/peertube/LICENSE
}
