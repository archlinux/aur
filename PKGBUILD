# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>

pkgname=packer-builder-hcloud-git
pkgver=2018.02.17
pkgrel=1
pkgdesc="Packer builder plugin for Hetzner Cloud"
url="https://github.com/m110/packer-builder-hcloud"
arch=("x86_64")
license=(MIT)
makedepends=(go git dep)
provides=(packer-provider-hcloud)
conflicts=(packer-provider-hcloud)
source=("git+https://github.com/m110/packer-builder-hcloud.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/packer-builder-hcloud"
  git log -n 1 --pretty=format:"%cd" --date=short | sed "s/-/./g"
}

prepare() {
  mkdir -p "$srcdir/src/"
  cp -r packer-builder-hcloud "$srcdir/src"
}

build() {
  cd "$srcdir/src/packer-builder-hcloud"
  export GOPATH="$srcdir"
  dep ensure
  go build
}

package() {
  install -Dm755 "$srcdir/src/packer-builder-hcloud/packer-builder-hcloud" "$pkgdir/usr/bin/packer-builder-hcloud"
  install -Dm644 "$srcdir/packer-builder-hcloud/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
