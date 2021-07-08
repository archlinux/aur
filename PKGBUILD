# Maintainer: TheFool <rn6l05d28@relay.firefox.com>
pkgname=firefoxpwa-git
pkgver=0.4.0.r.
pkgrel=3
epoch=
pkgdesc="This is a patched build of the FirefoxPWA from filips123's git"
arch=(x86_64)
url="https://github.com/filips123/FirefoxPWA.git"
license=('MPL-2.0')
groups=()
depends=()
makedepends=(git cargo rust)
checkdepends=()
optdepends=()
provides=(firefoxpwa)
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+$url")
noextract=()
sha256sums=('SKIP')
validpgpkeys=()

pkgver () {
cd "${_pkgname}"
printf "$pkgver.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd FirefoxPWA/native
    sed -i -e "s/^version = .*$/version = \"$pkgver\"/" Cargo.toml
    sed -i 's\"path": "/usr/libexec/firefoxpwa-connector",\"path": "/usr/lib/firefoxpwa/firefoxpwa-connector",\g'  manifests/linux.json 
}

build() {
    cd FirefoxPWA/native
	cargo build --release

}

package() {
	cd FirefoxPWA/native
	install -Dm755 target/release/firefoxpwa "$pkgdir/usr/bin/firefoxpwa"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -D target/release/firefoxpwa-connector "$pkgdir/usr/lib/firefoxpwa/firefoxpwa-connector"
    install -D manifests/linux.json "$pkgdir/usr/lib/mozilla/native-messaging-hosts/firefoxpwa.json"
    mkdir -p "$pkgdir/usr/share/firefoxpwa/userchrome/"
    cp -R userchrome/* "$pkgdir/usr/share/firefoxpwa/userchrome/"
    mkdir -p "$pkgdir/usr/share/firefoxpwa/runtime"
    chmod 777 "$pkgdir/usr/share/firefoxpwa/runtime"
    echo WARNING: For FirefoxPWA to work run '"firefoxpwa runtime install"' after the installation!
}


