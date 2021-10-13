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
        whoogle.service)
sha256sums=('SKIP'
            'b8474f3024d310b67454b8b59977fd26b66dba3930f31604058b773e13905e49')
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
 install -dm0755 "$pkgdir/usr/lib/systemd/system/"
 install -m0644 "$srcdir/whoogle.service" "$pkgdir/usr/lib/systemd/system/whoogle.service"
 install -dm0755 "$pkgdir/opt/whoogle-search"
 cp -r "$srcdir/whoogle-search/" "$pkgdir/opt/"
}
