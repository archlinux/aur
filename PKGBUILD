# Maintainer: Alessandro Righi <alerighi4@gmail.com>

pkgname=turingarena-git
pkgver=r531.9351add2
pkgrel=1
pkgdesc="A framework to host programming competitions"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/turingarena/turingarena"
license=('MPL2')
depends=('task-maker-rust')
makedepends=('cargo' 'npm')
optdepends=()
options=()
provides=('turingarena')
conflicts=('turingarena')
source=(
	'git+https://github.com/turingarena/turingarena.git#master'
	'turingarena.env'
	'turingarena-git.install'
	'turingarena.service'
	'turingarena.sh'
)
sha256sums=(
	'SKIP'
	'108a01fdc4676fe774eec62380271201eef3a573b1458c060e41a403105a5f06'
	'92552b0d9c78bc4065f15c0c7cee155550fcf427da1679f54914cdc1fbd81b6a'
	'8bd2aa2553adb64dc194fd0668a2038b769fec0609a9ff96bd5c82317f6e112f'
	'32ba92628eeea6cf824f0d344424237d757ecf4183370cf1d1faecc0da6f6353'
)
install=turingarena-git.install

pkgver() {
	cd "$srcdir/turingarena"
	echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/turingarena"
	cargo build --release --no-default-features
	cd "$srcdir/turingarena/turingarena-web-client/web"
	npm install 
	./prepare.sh
	npm run build
}

package() {
	install -Dm755 "$srcdir/turingarena/target/release/turingarena" "$pkgdir/usr/lib/turingarena/turingarena"
	install -Dm755 "$startdir/turingarena.sh" "$pkgdir/usr/bin/turingarena"
	install -Dm644 "$startdir/turingarena.service" "$pkgdir/usr/lib/systemd/system/turingarena.service"
	install -Dm644 "$startdir/turingarena.env" "$pkgdir/etc/default/turingarena"

	# Since I know nobody will ever bother to do that, I will generate a secret for you!
	echo "SECRET=$(head -c32 /dev/urandom | base64)" >> "$pkgdir/etc/default/turingarena"

	mkdir -p "$pkgdir/usr/share/turingarena"
	cp -r "$srcdir/turingarena/turingarena-web-client/web/dist/turingarena-contest/" "$pkgdir/usr/share/turingarena/web"
}

