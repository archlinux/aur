# Maintainer: DrRac27 <drrac27 at riseup dot net>

pkgname=guzuta-git
pkgver=v0.4.1.r4.075f9f2
pkgrel=1
pkgdesc="Custom repository manager for ArchLinux pacman"
arch=("x86_64" "aarch64")
url="https://github.com/eagletmt/guzuta"
license=("MIT")
provides=("guzuta")
makedepends=("cargo" "git")
conflicts=("guzuta")
source=("$pkgname::git+$url")
sha1sums=("SKIP")

build() {
    cd "$pkgname"
    sed -i 's/gpgme = "0.10"/gpgme = "0.11"/g' Cargo.toml
    cargo build --release --all-features --target-dir=target
}

pkgver() {
    cd "$pkgname"
    local tag=$(git tag --sort=-v:refname | head -1)
    local commits_since=$(git rev-list $tag..HEAD --count)
    echo "$tag.r$commits_since.$(git log --pretty=format:'%h' -n 1)"
}

package() {
    cd "$pkgname"
    install -Dm 755 target/release/guzuta -t "${pkgdir}/usr/bin"

    install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}

