# Maintainer: Alessandro Righi <alerighi4@gmail.com>

pkgname=turingarena-git
pkgver=r596.e21ed289
pkgrel=1
pkgdesc="A framework to host programming competitions"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/turingarena/turingarena"
license=('MPL2')
depends=('task-maker-rust' 'python-requests' 'python-yaml')
makedepends=('cargo' 'npm' 'python-setuptools')
optdepends=()
options=()
provides=('turingarena')
conflicts=('turingarena')
source=(
	'git+https://github.com/turingarena/turingarena.git'
	'turingarena.env'
	'turingarena.service'
)
sha256sums=(
	'SKIP'
	'SKIP'
	'SKIP'
)
install=turingarena-git.install

pkgver() {
	cd "$srcdir/turingarena"
	echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
	msg2 'building python CLI'
	cd "$srcdir/turingarena/python-turingarena-cli"
	python setup.py build

	msg2 'building rust server'
	cd "$srcdir/turingarena/turingarena-web-server"
	cargo build --release --no-default-features
	
	msg2 'building web client'
	cd "$srcdir/turingarena/turingarena-web-client/web"
	npm install 
	npm run codegen
	npm run build
}

package() {
	msg2 'installing server code'
	install -Dm755 "$srcdir/turingarena/target/release/turingarena-serve" "$pkgdir/usr/lib/turingarena/turingarenad"
	install -Dm644 "$srcdir/turingarena.service" "$pkgdir/usr/lib/systemd/system/turingarena.service"
	install -Dm644 "$srcdir/turingarena.env" "$pkgdir/etc/default/turingarena"

	# Since I know nobody will ever bother to do that, I will generate a secret for you!
	echo "SECRET=$(head -c32 /dev/urandom | base64)" >> "$pkgdir/etc/default/turingarena"

	msg2 'installing web client'
	mkdir -p "$pkgdir/usr/share/turingarena"
	cp -r "$srcdir/turingarena/turingarena-web-client/web/dist/turingarena-contest/" "$pkgdir/usr/share/turingarena/web"

	msg2 'installing python CLI'
	cd "$srcdir/turingarena/python-turingarena-cli"
	python setup.py install --skip-build -O1 --root="$pkgdir"

}

