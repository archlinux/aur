# Maintainer: Ethan Stokes <erstokes10@gmail.com>

pkgname=macros-git
pkgver=0.3.1.r137.cfec47a
pkgrel=1
pkgdesc='A libcosmic app to manage and run macros on Linux.'
url='https://github.com/EthanRStokes/macros'
arch=('x86_64')
license=('GPL-3.0-only')
makedepends=('rust' 'git' 'gcc' 'glibc')
depends=(
    'expat' 'fontconfig' 'libxkbcommon' 'freetype2' 'hicolor-icon-theme' 'cosmic-icon-theme'
    'libgcc' 'glibc'
    "libx11" "libxi" "libxtst"
)
conflicts=('macros')
provides=('macros')
source=("git+https://github.com/EthanRStokes/macros")
sha256sums=('SKIP')
options=('!lto')

pkgver() {
	cd "$srcdir/macros"
	printf "%s.r%s.%s" "$(git describe --tags --abbrev=0 | sed 's/^v//')" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    cd "$srcdir/macros"
    git reset --hard HEAD
    git_tag="$(git describe --tags --abbrev=0 | sed 's/^v//')"

    cargo fetch
}

build() {
    cd "$srcdir/macros"
    cargo build --release
}

package() {
    cd "$srcdir/macros"
    install -Dm755 "target/release/macros" "$pkgdir"/usr/bin/macros

    install -Dm644 "res/icons/macros.png" "$pkgdir"/usr/share/icons/hicolor/256x256/apps/macros.png
    install -Dm644 "res/macros.desktop" "$pkgdir"/usr/share/applications/macros.desktop

    install -Dm644 "res/icons/remove.svg" "$pkgdir"/usr/share/macros/icons/remove.svg
    install -Dm644 "res/icons/up.svg"     "$pkgdir"/usr/share/macros/icons/up.svg
    install -Dm644 "res/icons/down.svg"   "$pkgdir"/usr/share/macros/icons/down.svg
}
