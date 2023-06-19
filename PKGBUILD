# Maintainer: Bruce Patterson <contact at bpatterson dot dev>
pkgname='mqtt_vault'
pkgver=1.0.1
pkgrel=1
pkgdesc='JSON database controlled via MQTT'
arch=('x86_64')
url='https://bpatterson.dev/projects/mqtt_vault'
license=('MPL2')
depends=('openssl>=3' 'gcc-libs' 'glibc')
makedepends=('rustup' 'grep')
conflicts=('mqtt_vault-bin')
backup=('usr/share/mqtt_vault/mqtt_vault.conf.sample')
source=("https://github.com/bpatterson-gh/MqttVault/releases/download/v$pkgver/$pkgname-$pkgver-src.tar.gz")
sha256sums=('641501191f35b4fe58b53d6902c63cf7fe9c40140a8e756b601b6c38f37d8e54')

build() {
    if ! rustup toolchain list | grep -q '(default)'; then
        rustup toolchain install stable
    fi
    cd "$srcdir/$pkgname-$pkgver-src/"
    cargo build --release
}

package() {
    cd "$srcdir/$pkgname-$pkgver-src/"
    install -Dm755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    mkdir -p -m 755 "$pkgdir/usr/share/man/man1/"
    install -m644 -t "$pkgdir/usr/share/man/man1/" "$pkgname.1"
    mkdir -p -m 755 "$pkgdir/usr/share/$pkgname/"
	install -m664 -t "$pkgdir/usr/share/$pkgname/" "$pkgname.conf.sample"
}

