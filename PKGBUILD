pkgname=freepass-git
_pkgname=freepass
pkgdesc="The free password manager for power users."
pkgrel=1
pkgver=0.0.0.67
arch=('i686' 'x86_64')
conflicts=('freepass')
provides=('freepass')
url="https://github.com/myfreeweb/freepass"
license=('UNLICENSE')
depends=('libsodium')
makedepends=('rust' 'cargo' 'git' 'python-pytoml')
source=('git+https://github.com/quininer/freepass.git')
# source=('git+https://github.com/myfreeweb/freepass.git')
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname/cli"
	echo "$(python -c "print(__import__('pytoml').loads(open('Cargo.toml').read())['package']['version'])").$(git rev-list --count HEAD)"
}

build() {
	cd $_pkgname
	git checkout fix
	git submodule init
	git submodule update libsodium rusterpassword
	cd "cli"
	cargo update
	cargo build --release
}

package() {
	cd "$_pkgname/cli"
	export PATH="$PATH:$pkgdir/usr/bin"
	cargo install --root "$pkgdir/usr"
	rm "$pkgdir/usr/.crates.toml"
}
