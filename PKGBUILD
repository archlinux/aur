# Maintainer: TheFool <rn6l05d28@relay.firefox.com>
pkgname=firefoxpwa-git
pkgver=0.3.1.r.
pkgrel=2
epoch=
pkgdesc="This is a patched build of the FirefoxPWA from filips123's git"
arch=(x86_64)
url="https://github.com/filips123/FirefoxPWA.git"
license=('MPL-2.0')
groups=()
depends=()
makedepends=(git rust)
checkdepends=()
optdepends=()
provides=(firefoxpwa)
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+$url"
        "firefoxpwa-git.patch")
noextract=()
sha256sums=('SKIP'
            '4cf5c3edb1d87095c759affb803ea2bef13358aa63d047364ed5e7d5835f3177')
validpgpkeys=()

pkgver () {
cd "${_pkgname}"
printf "0.3.1.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    patch -p1 -i firefoxpwa-git.patch
}

package() {
	cd FirefoxPWA/native
	cargo build --release
	install -Dm755 target/release/firefoxpwa "$pkgdir/usr/bin/firefoxpwa"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -D target/release/firefoxpwa-connector "$pkgdir/usr/lib/firefoxpwa/firefoxpwa-connector"
    install -D manifests/linux.json "$pkgdir/usr/lib/mozilla/native-messaging-hosts/firefoxpwa.json"
    sudo mkdir -p /usr/share/firefoxpwa/runtime/
    chmod 777 /usr/share/firefoxpwa/runtime/
    echo WARNING: For FirefoxPWA to work run '"firefoxpwa runtime install"' after the installation!
}


