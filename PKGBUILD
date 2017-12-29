pkgname=synapse-bt-git
provides=('synapse-bt')
conflicts=('synapse-bt')
pkgver=r538.cf0a0b4
pkgrel=1
pkgdesc='Lightweight bittorrent daemon'
arch=('i686' 'x86_64')
url='https://synapse-bt.org'
license=('ISC')
depends=('openssl' 'c-ares')
makedepends=('cargo')
source=(
	git+https://github.com/Luminarys/synapse
	synapse.service
)
sha256sums=('SKIP'
            'e21042763f6c56924a3063697d641855a0900285e6c7eacc6253e1c338cb2deb')

pkgver() {
  cd synapse
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd synapse
	cargo build --release --all
}

package() {
	cd synapse
    mkdir -p "$pkgdir"/usr/lib/systemd/user/ "$pkgdir"/usr/bin
    install -Dm755 target/release/synapse "$pkgdir"/usr/bin
    install -Dm755 target/release/sycli "$pkgdir"/usr/bin
	install -Dm644 "$srcdir"/synapse.service "$pkgdir"/usr/lib/systemd/user/
}
