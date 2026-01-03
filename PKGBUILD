pkgname=whyis
pkgver=0.1.0
pkgrel=1
pkgdesc="A simple linux troubleshooting utility."
arch=('x86_64')
url="https://github.com/xZepyx/whyis"
license=('MIT')

depends=('glibc')
makedepends=('nim' 'git')

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4850fa4e2920951a16f8fb84d49fe41fcac9a75890617bc5aa4c407868b67b3c')

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
