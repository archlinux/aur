# Maintainer: Ateles
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=excise-git
pkgver=1.4.1.r3.ga724dbb
pkgrel=1
pkgdesc="Surgical terminal storage navigator"
arch=("any")
url="https://github.com/findyourexit/excise"
license=("MIT")
depends=("gcc-libs")
makedepends=("cargo" "git")
provides=("excise")
conflicts=("excise")
source=("$pkgname::git+$url.git")
sha256sums=("SKIP")
options=(!lto)

pkgver() {
    cd "$pkgname"
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/$pkgname" || exit 1
    cargo build --release --config 'profile.release.opt-level="z"' --config 'profile.release.lto=true' --config 'profile.release.codegen-units=1' --config 'profile.release.panic="abort"'
}

package() {
    cd "$srcdir/$pkgname" || exit 1
    install -Dm755 "target/release/excise"             "$pkgdir/usr/bin/excise"
    install -Dm644 "LICENSE"                           "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "CHANGELOG.md"                      "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
    install -Dm644 "README.md"                         "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 "SECURITY.md"                       "$pkgdir/usr/share/doc/$pkgname/SECURITY.md"
	install -Dm644 "SUPPORT.md"                        "$pkgdir/usr/share/doc/$pkgname/SUPPORT.md"
	install -Dm644 "generated/completions/excise.fish" "$pkgdir/usr/share/fish/vendor_completions.d/excise.fish"
	install -Dm644 "generated/completions/excise.bash" "$pkgdir/usr/share/bash-completion/completions/excise"
	install -Dm644 "generated/completions/_excise"     "$pkgdir/usr/share/zsh/site-functions/_excise"
	cp -r          "docs"                              "$pkgdir/usr/share/doc/$pkgname/"
	install -Dm644 "generated/man/excise.1"            "$pkgdir/usr/share/man/man1/excise.1"
}
