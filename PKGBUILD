# Maintainer: Stefan <stefan@gehr.xyz>
_name=seniorpw
pkgname="${_name}"-git
pkgver=r203.77aa38a
pkgrel=1
pkgdesc='password manager using age as backend; inspired by pass'
arch=('any')
url='https://gitlab.com/retirement-home/seniorpw'
license=('AGPL3')
depends=(tree)
optdepends=(git wl-clipboard)
makedepends=(cargo git)
source=("git+${url}.git")
md5sums=('SKIP')
_rustdir="src/seniorpw"

pkgver() {
	cd "$_name"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$_name/$_rustdir"
	cargo build --bins --locked --release --target-dir target
}

package() {
	cd "$_name"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_name/LICENSE"
	install -Dm755 $_rustdir/target/release/senior -t "$pkgdir"/usr/bin/
	install -Dm644 src/completions/senior.zsh "$pkgdir"/usr/share/zsh/site-functions/_senior
	install -Dm644 src/completions/senior.bash "$pkgdir"/usr/share/bash-completion/completions/senior
	install -Dm644 src/man/* -t "$pkgdir"/usr/share/man/man1
}
