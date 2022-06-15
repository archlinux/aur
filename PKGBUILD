# Maintainer: dr460nf1r3 <dr460nf1r3 at garudalinux dot org>

pkgname=whoogle
pkgver=0.7.4
pkgrel=1
pkgdesc='A self-hosted, ad-free, privacy-respecting metasearch engine'
arch=(x86_64 aarch64)
url="https://github.com/benbusby/whoogle-search"
license=(MIT)
depends=(python)
makedepends=(python python-pip)
optdepends=('tor: use the TOR network to perform searches')
conflicts=($pkgname-git)
backup=('etc/default/whoogle')
source=("$pkgname-$pkgver.tar.gz::https://github.com/benbusby/whoogle-search/archive/refs/tags/v$pkgver.tar.gz"
        $pkgname
        $pkgname.conf
        $pkgname.service)
sha256sums=('29649aa3337befaf9d9bc7e0fe0b1e6018b4b12e90a1005b7b3ff1863cee44aa'
            'e30ff5ecef199ce2a37b097709461c51ca07bdbbcc4609db74203834b62c60b1'
            '51cda92f3ad2166eb2cb63ff80561f48b39688a57b66291d2eee5e1c7fcd8ee3'
            'ab6256f3fdaac3ba58ddbb39bb5c24bde53312f0584ae4ed4ae74bc7752a07f4')
install=$pkgname.install

prepare() {
  mv $pkgname-search-$pkgver $pkgname-search
}

build() {
  # Following official instructions
  cd $pkgname-search
  python3 -m venv venv
  source venv/bin/activate
  pip install -r requirements.txt
  
  # Cleanup unsed
  rm -r docs test .dockerignore .gitignore .replit docker-compose.yml Dockerfile heroku.yml MANIFEST.in README.md requirements.txt setup.py
}

package() {
  install -m0644 -D "$srcdir/whoogle" "$pkgdir/etc/default/whoogle"
  install -m0644 -D "$srcdir/whoogle.conf" "$pkgdir/usr/lib/sysusers.d/whoogle.conf"
  install -m0644 -D "$srcdir/whoogle.service" "$pkgdir/usr/lib/systemd/system/whoogle.service"
  install -Dm0644 "$srcdir/$pkgname-search/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -dm0755 "$pkgdir/opt/whoogle-search"
  cp -r "$srcdir/whoogle-search/" "$pkgdir/opt/"
}
