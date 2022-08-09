# Maintainer: Barış İnandıoğlu <68742481+baris-inandi@users.noreply.github.com>

pkgname=fe
pkgver=1.1.10
pkgrel=3
pkgdesc="AUR helper with a familiar subcommand system"
arch=(x86_64)
url="https://github.com/baris-inandi/fe"
license=('GPL3')
depends=(bash sudo paru pacman-contrib)
makedepends=(git go)
source=("$pkgname-$pkgver.tar.gz::https://github.com/baris-inandi/fe/archive/refs/tags/$pkgver.tar.gz")
backup=("etc/feparu.conf" "etc/fepacman.conf")
md5sums=("skip")

build() {
  tar xvf fe-$pkgver.tar.gz
  cd "$pkgname-$pkgver"
  git checkout $(git describe --tags --abbrev=0)
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o "$pkgname-$pkgver-$pkgrel"
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm644 conf/pacman.conf "$pkgdir"/etc/fepacman.conf
  install -Dm644 conf/paru.conf "$pkgdir"/etc/feparu.conf
  install -Dm755 "$pkgname-$pkgver-$pkgrel" "$pkgdir"/usr/bin/$pkgname
}
