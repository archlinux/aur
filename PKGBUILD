# Maintainer: Gaurav Atreya <allmanpride@gmail.com>
pkgname=local-mpv-git
pkgver=0.2.1
pkgrel=1
pkgdesc="Tool to run mpv with a local server"
arch=('x86_64')
url="https://github.com/Atreyagaurav/${pkgname%-git}"
license=('GPL3')
depends=('gcc-libs' 'mpv')
makedepends=('rust' 'cargo' 'git')
source=("git+https://github.com/Atreyagaurav/${pkgname%-git}.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "%s" "$(git describe --tags --abbrev=0 | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
    cd "$srcdir/${pkgname%-git}"
    git checkout "tags/$(git describe --tags --abbrev=0)"
    git apply local-arch.patch
    if [ ! -d "libmpv-rs" ]; then
	git clone https://github.com/ParadoxSpiral/libmpv-rs.git
    fi
    cp /usr/include/mpv/* libmpv-rs/libmpv-sys/include/
}

build() {
	cd "$srcdir/${pkgname%-git}"
	cargo build --release
}

package() {
    cd "$srcdir/${pkgname%-git}"
    mkdir -p "$pkgdir/usr/bin"
    cp "target/release/${pkgname%-git}" "$pkgdir/usr/bin/${pkgname%-git}"
    mkdir -p "$pkgdir/usr/share/applications"
    cp "${pkgname%-git}.desktop" "$pkgdir/usr/share/applications/${pkgname%-git}.desktop"
    mkdir -p "$pkgdir/usr/share/local-mpv"
    cp index.html favicon.ico "$pkgdir/usr/share/local-mpv/"
}

