# SPDX-License-Identifier: 0BSD
# Maintainer: a-catgirl <paws@a-catgirl.dev>

# pulls in `pandoc-cli` as a makedepend
: "${_generate_manual_page:=no}"

pkgname=hinoirisetr
pkgver=1.6.3
_pkgver=1.6.3
pkgrel=2
pkgdesc="A lightweight daemon that automatically adjusts your screen's color temperature and gamma based on the time of day"
arch=("i686" "x86_64" "aarch64")
url="https://git.vavakado.xyz/me/hinoirisetr.git"
license=("MIT")
makedepends=("cargo" "git")
source=("git+https://git.vavakado.xyz/me/hinoirisetr.git")
optdepends=(
    "ddcutil: ddcutil backend support"
    "hyprsunset: hyprland backend support"
    "wayland"
    "xsct: xsct backend support"
    "libnotify: desktop notifications support")
sha256sums=("SKIP")

if [[ $_generate_manual_page == "yes" ]]; then
    makedepends+=("pandoc-cli")
fi

prepare() {
    cd "$pkgname"
    git config --local advice.detachedHead false
    git checkout tags/v${_pkgver}
}

build() {
    cd "$pkgname"
    cargo build --release

    if [[ $_generate_manual_page == "yes" ]]; then
        pandoc manpages/hinoirisetr.1.md -s -t man -o manpages/hinoirisetr.1
    fi
}

package() {
    cd "$pkgname"
    install -Dm755 "target/release/hinoirisetr" "$pkgdir/usr/bin/hinoirisetr"
    if [[ $_generate_manual_page == "yes" ]]; then
      install -Dm644 "manpages/hinoirisetr.1" "$pkgdir/usr/share/man/man1/hinoirisetr.1"
    fi
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE-MIT"
}

