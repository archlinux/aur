# Maintainer: HLFH <gaspard@dhautefeuille.eu>

pkgname=filtron-git
pkgver=0.2.0.r4.gfb26e98
pkgrel=1
pkgdesc="Filtering reverse HTTP proxy"
arch=('x86_64')
url='https://github.com/HLFH/filtron'
license=(AGPL3)
provides=(filtron)
conflicts=(filtron)
makedepends=(git go)
install=filtron.install
source=(git+$url
	filtron.service
        rules.json)
b2sums=('SKIP'
        '0f2184e0fd8d3467d5358f9b8caa0cce6bdc07561a50c84681d522aa5704e02a7a3aca1e8eb49e8e731b7c8d961ac4ce97f0c7b39119daa056ebf6e444c5b582'
        '347e84b34ce0ec4ca46dc8782ce9af995d8b7844e9020bcd9c059018a3ad1af0100a0bdf65a05956e53c16c5daf7c4aa87b4c47402a3d8b05ca981117131ce5c')

pkgver() {
  cd filtron
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/v//;s/-/./g'
}

build() {
  cd filtron
  go build -o filtron .
}

check() {
  cd filtron
  go test
}

package() {
  cd "$srcdir"
  install -Dm644 rules.json -t "$pkgdir"/etc/filtron
  install -Dm644 filtron.service -t "$pkgdir"/usr/lib/systemd/system
  cd filtron
  install -Dm755 filtron -t "$pkgdir"/usr/bin
  install -Dm644 README.md -t "$pkgdir"/usr/share/doc/filtron
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/filtron
}
