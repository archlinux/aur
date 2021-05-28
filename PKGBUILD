# Maintainer: dr460nf1r3 <dr460nf1r3@garudalinux.org>

pkgname=whoogle
pkgver=0.5.1
pkgrel=1
pkgdesc='A self-hosted, ad-free, privacy-respecting metasearch engine'
arch=(x86_64 aarch64)
url="https://github.com/benbusby/whoogle-search"
license=(MIT)
depends=(python)
makedepends=(python python-pip)
conflicts=(whoogle-git)
source=("$pkgname-$pkgver.tar.gz::https://github.com/benbusby/whoogle-search/archive/refs/tags/v$pkgver.tar.gz"
        whoogle.service)
sha256sums=('9031c4df31f154c82d893828729ad79cb5b915503fadbf4d0ce2db1f9c796c08'
            'b8474f3024d310b67454b8b59977fd26b66dba3930f31604058b773e13905e49')
install=whoogle.install

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
  rm -r docs test .dockerignore .gitignore .replit .travis.yml docker-compose.yml Dockerfile heroku.yml MANIFEST.in README.md requirements.txt setup.py
}

package() {
  install -dm0755 "$pkgdir/usr/lib/systemd/system/"
  install -m0644 "$srcdir/whoogle.service" "$pkgdir/usr/lib/systemd/system/whoogle.service"
  install -dm0755 "$pkgdir/opt/whoogle-search"
  cp -r "$srcdir/$pkgname-search/" "$pkgdir/opt/"
}
