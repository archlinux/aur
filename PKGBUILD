# Maintainer: dr460nf1r3 <dr460nf1r3@garudalinux.org>

pkgname=whoogle-git
pkgver=0.8.4.r6.g7313edf
pkgrel=1
pkgdesc='A self-hosted, ad-free, privacy-respecting metasearch engine'
arch=(x86_64 aarch64)
url="https://github.com/benbusby/whoogle-search"
license=(MIT)
depends=(python)
makedepends=(git)
provides=(whoogle)
conflicts=(whoogle)
backup=('etc/default/whoogle')
source=("git+$url.git"
	whoogle.service
	whoogle.conf
	whoogle)
sha256sums=('SKIP'
	'ab6256f3fdaac3ba58ddbb39bb5c24bde53312f0584ae4ed4ae74bc7752a07f4'
	'51cda92f3ad2166eb2cb63ff80561f48b39688a57b66291d2eee5e1c7fcd8ee3'
	'e30ff5ecef199ce2a37b097709461c51ca07bdbbcc4609db74203834b62c60b1')
install=whoogle.install

pkgver() {
	cd whoogle-search
	git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/v//g'
}

build() {
	# Following official instructions
	cd whoogle-search
	python3 -m venv venv
	source venv/bin/activate
	pip install -r requirements.txt

	# Cleanup unsed
	rm -r .git .github docs test .dockerignore .gitignore .replit docker-compose.yml Dockerfile heroku.yml MANIFEST.in README.md requirements.txt
}

package() {
	install -m0644 -D "$srcdir/whoogle" "$pkgdir/etc/default/whoogle"
	install -m0644 -D "$srcdir/whoogle.conf" "$pkgdir/usr/lib/sysusers.d/whoogle.conf"
	install -m0644 -D "$srcdir/whoogle.service" "$pkgdir/usr/lib/systemd/system/whoogle.service"
	install -Dm0644 "$srcdir/whoogle-search/LICENSE" "$pkgdir/usr/share/licenses/whoogle-search/LICENSE"
	install -dm0755 "$pkgdir/opt/whoogle-search"
	cp -r "$srcdir/whoogle-search/" "$pkgdir/opt/"
}
