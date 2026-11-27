# Maintainer: Mohamed Hussein Al-Adawy <59349012+moheladwy@users.noreply.github.com>
pkgname=archoxide-git
_pkgname=archoxide
pkgver=r35.8c6c6a5
pkgrel=1
pkgdesc='Keyboard-driven terminal UI for Arch packages, Flatpaks, and AppImages'
arch=('x86_64')
url='https://github.com/moheladwy/ArchOxide'
license=('MIT')
depends=('glibc' 'libgcc' 'pacman' 'sudo')
makedepends=('cargo' 'git')
optdepends=(
    'curl: download AppImages over HTTPS'
    'flatpak: manage Flatpak apps'
    'fontconfig: discover installed font families'
    'glib2: open desktop applications with gio'
    'kitty: launch with the saved terminal font'
    'yay: search and manage AUR packages'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git#branch=main")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname" || return
    printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    cd "$srcdir/$_pkgname" || return
    RUSTUP_TOOLCHAIN=stable cargo fetch --locked --target host-tuple
}

build() {
    cd "$srcdir/$_pkgname" || return
    RUSTUP_TOOLCHAIN=stable cargo build --frozen --release --bin "$_pkgname" \
        --target host-tuple --target-dir target
}

check() {
    cd "$srcdir/$_pkgname" || return
    RUSTUP_TOOLCHAIN=stable cargo test --frozen --release \
        --target host-tuple --target-dir target
}

package() {
    cd "$srcdir/$_pkgname" || return
    local host
    host=$(RUSTUP_TOOLCHAIN=stable rustc --print host-tuple) || return
    install -Dm755 "target/$host/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
