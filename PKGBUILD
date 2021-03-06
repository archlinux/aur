# Maintainer: dr460nf1r3 <dr460nf1r3@garudalinux.org>

pkgname=whoogle-git
pkgver=0.3.1_r247.ge912b8f
pkgrel=3
pkgdesc='A self-hosted, ad-free, privacy-respecting metasearch engine'
arch=(x86_64 aarch64)
url="https://github.com/benbusby/whoogle-search"
license=(MIT)
depends=(python)
makedepends=(git)
source=("git+$url.git"
        whoogle.service)
sha256sums=('SKIP'
            '4b70638665c6d8865bae898b1c32636dfdadee26c53b068fcfc51c051a74d0d8')
install=whoogle.install

pkgver() {
  cd whoogle-search
  _ver="$(grep -m1 'version=' setup.py | cut -d "'" -f2 | tr - .)"
  echo "${_ver}_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cd whoogle-search
  python3 -m venv venv
  source venv/bin/activate
  pip install -r requirements.txt
  
}

package() {
 install -dm0755 "$pkgdir/usr/lib/systemd/system/"
 install -m0644 "$srcdir/whoogle.service" "$pkgdir/usr/lib/systemd/system/whoogle.service"
 install -dm0755 "$pkgdir/opt/whoogle-search"
 cp -r "$srcdir/whoogle-search/" "$pkgdir/opt/"
}
