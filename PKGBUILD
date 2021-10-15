# Maintainer: dr460nf1r3 <dr460nf1r3@garudalinux.org>

pkgname=whoogle-git
pkgver=0.6.0_r391.g20976f2
pkgrel=1
pkgdesc='A self-hosted, ad-free, privacy-respecting metasearch engine'
arch=(x86_64 aarch64)
url="https://github.com/benbusby/whoogle-search"
license=(MIT)
depends=(python)
makedepends=(git)
provides=(whoogle)
conflicts=(whoogle)
source=("git+$url.git"
        whoogle.service
        whoogle.conf
        whoogle)
sha256sums=('SKIP'
            '7630105a0613d6758f0e298a8d197f307cb2d1657f7cedf10dc340c8f21c4511'
            '51cda92f3ad2166eb2cb63ff80561f48b39688a57b66291d2eee5e1c7fcd8ee3'
            'e30ff5ecef199ce2a37b097709461c51ca07bdbbcc4609db74203834b62c60b1')
install=whoogle.install

pkgver() {
  cd whoogle-search
  _ver="$(grep -m1 'version=' setup.py | cut -d "'" -f2 | tr - .)"
  echo "${_ver}_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  # Following official instructions
  cd whoogle-search
  python3 -m venv venv
  source venv/bin/activate
  pip install -r requirements.txt
  
  # Cleanup unsed
  rm -r .git .github docs test .dockerignore .gitignore .replit docker-compose.yml Dockerfile heroku.yml MANIFEST.in README.md requirements.txt setup.py
}

package() {
  install -m0644 -D "$srcdir/whoogle.conf" "$pkgdir/usr/lib/sysusers.d/whoogle.conf"
  install -m0644 -D "$srcdir/whoogle.service" "$pkgdir/usr/lib/systemd/system/whoogle.service"
  install -dm0755 "$pkgdir/opt/whoogle-search"
  cp -r "$srcdir/whoogle-search/" "$pkgdir/opt/"
}
