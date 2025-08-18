# Maintainer: Matt Cuneo <m@cuneo.au>

pkgname=huntarr
pkgver=8.2.5
pkgrel=1
_repoorg=plexguide
_reponame=Huntarr.io
pkgdesc="an automatic missing content hunter for Sonarr, Radarr, Lidarr, Readarr, and Whisparr."
arch=('x86_64')
url="https://github.com/$_repoorg/$_reponame"
license=('GPL3')
depends=('python' 'python-flask' 'python-requests' 'python-waitress' 'python-bcrypt' 'python-qrcode' 'python-pyotp' 'apprise' 'python-pytz' 'python-markdown' 'python-pyyaml')
source=("${url}/archive/refs/tags/$pkgver.tar.gz" 'huntarr.service' 'huntarr.sysusers' 'huntarr.tmpfiles')
sha256sums=('a8c54c39b1c3c16dcdf860b8a2138e7f7ed827d35713e141011ac14ee210e426'
            '660e4f9dc6d38b06feeda7e7e8748191887a63a4a4087d6a23d36a4a4394bbd4'
            '42a4c3451509f4ee82aa555f83f80fa638fbef162a33e937127a82723e2ab19e'
            '57d8031a1a03293bc422cfd20cd8238219c4823557d17f5ad0874e633e864db5')
backup=(var/lib/huntarr/sleep.json)
prepare() {
  cd "$_reponame-$pkgver"
	sed -i "s|base_dir, 'frontend', 'static', 'data', 'sleep.json'|'/var','lib','huntarr','sleep.json'|" src/primary/cycle_tracker.py
}
package() {
	install -dm755 "$pkgdir/usr/share/webapps/huntarr"
	cp -r "$srcdir/$_reponame-$pkgver/"* "$pkgdir/usr/share/webapps/huntarr/"
	install -Dm755 "$srcdir/huntarr.service" "$pkgdir/usr/lib/systemd/system/huntarr.service"
	install -Dm644 "$srcdir/huntarr.sysusers" "$pkgdir/usr/lib/sysusers.d/huntarr.conf"
	install -Dm644 "$srcdir/huntarr.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/huntarr.conf"
	install -Dm755 "$srcdir/$_reponame-$pkgver/frontend/static/data/sleep.json" "$pkgdir/var/lib/huntarr/sleep.json"
}
