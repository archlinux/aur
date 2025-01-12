# Maintainer: Harish Rajagopal <harish dot rajagopals at gmail dot com>
# Contributor: Caleb Maclennan <caleb@alerque.com>

_pkgname=ReGreet
pkgname=greetd-${_pkgname,,}-git
pkgver=0.2.0.r0.c75486b
pkgrel=1
pkgdesc='Clean and customizable greeter for greetd'
url="https://github.com/rharish101/$_pkgname"
license=(GPL-3.0-or-later)
arch=(x86_64)
depends=(wayland-compositor
         greetd
         gcc-libs
         glibc
         gtk4)
provides=(greetd-greeter)
backup=("etc/greetd/${_pkgname,,}.toml")
makedepends=(cargo git)
install=$pkgname.install
source=("$_pkgname::git+$url.git"
        "${_pkgname,,}.toml")
sha256sums=('SKIP'
            'b80b3eb31f8cc463d512c9db0eef899bdbe232d977429a8a12e95a3b6df2e387')
conflicts=("greetd-${_pkgname,,}")
replaces=(regreet-git)

pkgver() {
    cd "$_pkgname"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
    cd "$_pkgname"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$_pkgname"
    cargo build --frozen --release --all-features
}

check() {
    cd "$_pkgname"
    cargo test --frozen --all-features
}

package() {
    cd "$_pkgname"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/${_pkgname,,}"
    install -Dm0644 -t "$pkgdir/etc/greetd/" ../"${_pkgname,,}.toml"
    install -Dm0644 -t "$pkgdir/usr/share/doc/greetd-${_pkgname,,}/" "${_pkgname,,}.sample.toml"
    install -Dm0644 systemd-tmpfiles.conf "$pkgdir/usr/lib/tmpfiles.d/${_pkgname,,}.conf"
}
