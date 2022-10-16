# Maintainer: jzefklly <jzefklly@163.com>

_pkgname=ktra
pkgname=$_pkgname-git
pkgver=0.7.0.r0.g07ffd10
pkgrel=1
pkgdesc="Your Little Cargo Registry"
arch=("x86_64")
url="https://github.com/moriturus/ktra"
license=("Apache" "MIT")
depends=("gcc-libs")
makedepends=("cargo" "git")
provides=("$_pkgname")
conflicts=("$_pkgname")
backup=("etc/ktra.toml")
source=(
	"$_pkgname::git+https://github.com/moriturus/ktra.git"
	"ktra.service"
	"ktra.sysusers"
	"ktra.tmpfiles"
	"ktra.toml"
)
sha256sums=(
	"SKIP"
    "8415def2810b845b3b960448f40bac214bb1bd21e481b624f0a3e2aab7b093dd"
    "838072db74b691e28cc28c46982dd9af9806b4283179ab4a96df8d7624685f96"
    "466c7ce99bace309a30ea753d9b8b46ebfd8868ef7bb5016abdfb0a00543bddd"
	"97f4f75a722dd239097d552b56a62f967f791ab6aac8859a3324893deb909e55"
)

export RUSTUP_TOOLCHAIN=stable
export CARGO_TARGET_DIR=target

pkgver() {
  cd "$_pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$_pkgname"
    cargo update
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$_pkgname"
    cargo build --frozen --release
}

# check() {
#     cd "$_pkgname"
#     cargo test --frozen
# }

package() {
    install -Dm0644 "$_pkgname.service"  "${pkgdir}/usr/lib/systemd/system/$_pkgname.service"
    install -Dm0644 "$_pkgname.sysusers" "${pkgdir}/usr/lib/sysusers.d/$_pkgname.conf"
    install -Dm0644 "$_pkgname.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/$_pkgname.conf"
    install -Dm0644 "$_pkgname.toml"     "${pkgdir}/etc/$_pkgname.toml"

    cd "$_pkgname"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$_pkgname"
}
