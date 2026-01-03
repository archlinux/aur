pkgname=whyis
pkgver=0.2.0
pkgrel=1
pkgdesc="A simple linux troubleshooting utility."
arch=('x86_64')
url="https://github.com/xZepyx/whyis"
license=('MIT')

depends=('glibc')
makedepends=('nim' 'git')

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b5fcba395c457ab42d0259eb8d9c21be25061d42be493f2303a4818e13aa08c2')

pkgver() {
  git ls-remote --tags "$url.git" \
    | awk -F/ '{print $3}' \
    | grep -v '\^{}' \
    | sed 's/^v//' \
    | sort -V \
    | tail -n1
}

build() {
  cd "$pkgname-$pkgver"
  nim c -d:release -o:whyis whyis.nim
}

package() {
  cd "$pkgname-$pkgver"

  # Binary
  install -Dm755 whyis "$pkgdir/usr/bin/whyis"

  # Runtime data
  install -d "$pkgdir/usr/share/whyis"
  cp -r collectors rules symptoms.db "$pkgdir/usr/share/whyis/"

  # License
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
