# Maintainer: Pierre Sauvage <m.sauvage.pierre@gmail.com>
pkgname=passel
pkgver=0.2.0
pkgrel=1
pkgdesc="A pass-compatible password manager for GNOME"
arch=('x86_64')
url="https://github.com/Pierrotws/passel"
license=('GPL-3.0-or-later')
depends=('gtk4' 'libadwaita' 'gpgme' 'libgit2' 'libssh2' 'gnupg')
conflicts=('gnome-vault' 'gnome-vault-bin')
replaces=('gnome-vault')
makedepends=('cargo' 'meson' 'ninja' 'pkgconf' 'blueprint-compiler' 'git')
source=("$pkgname-$pkgver::git+$url.git#tag=v$pkgver")
sha256sums=('a5ff4cca9439b76d3682c5c940e5e13347c577000c2e1a0d22b398c154d6bb9e')

prepare() {
    cd "$pkgname-$pkgver"
    git submodule update --init --recursive
}

build() {
    cd "$pkgname-$pkgver"
    # libssh2-sys defaults to a vendored static build via cc-rs. With
    # makepkg's -flto=auto in CFLAGS, the resulting libssh2.a is an LTO
    # archive that rust-lld cannot resolve symbols from at the final
    # link step. Force libssh2-sys to use the system libssh2 (dynamic
    # link via pkg-config) instead — libssh2 is in depends, so it's
    # always available.
    export LIBSSH2_SYS_USE_PKG_CONFIG=1
    arch-meson build
    meson compile -C build
}

package() {
    cd "$pkgname-$pkgver"
    DESTDIR="$pkgdir" meson install -C build
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
