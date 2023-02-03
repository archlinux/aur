# Maintainer: jzefklly <jzefklly@163.com>

_pkgname=ktra
pkgname=$_pkgname-git
pkgver=0.7.0.r0.g07ffd10
pkgrel=3
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
    "ktra-bypass-ssh-check.patch"
	"ktra.service"
	"ktra.sysusers"
	"ktra.tmpfiles"
	"ktra.toml"
)
sha256sums=(
	"SKIP"
    "566cdf531f9124fe4c771de5bd6281d62edaeb9c1c9f00a98037e85a7e2ca6b2"
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
    # git2 0.13 with libgit2 1.5 causes SIGSEGV, use a newer version of git2
    sed -i 's/git2 = "0.13"/git2 = "^0.16.0"/g' "${srcdir}/ktra/Cargo.toml"
    # Bypass ssh host key check. libgit2 < 1.5.1 did not check ssh host key
    # by default, which is considered as a security issue. See:
    # https://github.com/libgit2/libgit2/security/advisories/GHSA-8643-3wh5-rmjq
    # libgit2 1.5.1 fixed this problem. Unfortunately, ktra has not update to
    # newer version of libgit2 and failed to start. This patch disable host key
    # checking again.
    patch -p1 -d ${srcdir}/ktra/ < ${srcdir}/ktra-bypass-ssh-check.patch
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
