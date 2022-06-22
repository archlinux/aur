# Maintainer: Julian Schmidhuber <aur at schmiddi dot anonaddy dot com>
pkgname=tubefeeder
pkgver=1.8.1
pkgrel=2
pkgdesc="A Youtube, Lbry and Peertube client made for the Pinephone"
arch=('x86_64' 'aarch64')
url="https://www.tubefeeder.de"
license=('GPL')
groups=()
depends=('libadwaita')
optdepends=('mpv: Play the videos', 'youtube-dl: Play and download the videos')
makedepends=('cargo')
provides=("${pkgname}")
conflicts=("${pkgname}")
replaces=()
backup=()
options=()
install=
source=("$pkgname.tar.gz::https://github.com/Schmiddiii/Tubefeeder/archive/refs/tags/v$pkgver.tar.gz")
noextract=()
md5sums=('3f1976d7c3cd2807760169413f75c71e')

prepare() {
	cd "$srcdir/Tubefeeder-${pkgver}"
        cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$srcdir/Tubefeeder-${pkgver}"
        export RUSTUP_TOOLCHAIN=stable
        export CARGO_TARGET_DIR=target
        cargo build --frozen --release --all-features
}

package() {
	cd "$srcdir/Tubefeeder-${pkgver}"
        # Binary
        install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/tubefeeder"
        # Desktop-file
        sed -i 's_/app/bin/tubefeeder_/usr/bin/tubefeeder_' packaging/de.schmidhuberj.tubefeeder.desktop
        install -D packaging/de.schmidhuberj.tubefeeder.desktop $pkgdir/usr/share/applications/de.schmidhuberj.tubefeeder.desktop
        # Icon
        install -D packaging/de.schmidhuberj.tubefeeder.512.png $pkgdir/usr/share/icons/hicolor/512x512/apps/de.schmidhuberj.tubefeeder.png
        install -D packaging/de.schmidhuberj.tubefeeder.svg $pkgdir/usr/share/icons/hicolor/scalable/apps/de.schmidhuberj.tubefeeder.png

        # Localization
        ls -ld po/locale/*/ | sed 's|.*po/locale/||' | xargs -I % install -D "po/locale/%LC_MESSAGES/de.schmidhuberj.tubefeeder.mo" "$pkgdir/usr/share/locale/%LC_MESSAGES/de.schmidhuberj.tubefeeder.mo"
}
