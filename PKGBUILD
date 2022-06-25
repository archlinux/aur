# Maintainer: Julian Schmidhuber <aur at schmiddi dot anonaddy dot com>
pkgname=tubefeeder-git
pkgver=1.8.2.r0.549291f
pkgrel=1
pkgdesc="A Youtube, Lbry and Peertube client made for the Pinephone"
arch=('x86_64' 'aarch64')
url="https://www.tubefeeder.de"
license=('GPL')
groups=()
depends=('libadwaita')
optdepends=('mpv: Play the videos', 'youtube-dl: Play and download the videos')
makedepends=('git' 'cargo')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=("$pkgname::git+https://github.com/Tubefeeder/Tubefeeder.git")
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname}"
	printf "%s" "$(git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
	cd "$srcdir/${pkgname}"
        cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$srcdir/${pkgname}"
        export RUSTUP_TOOLCHAIN=stable
        export CARGO_TARGET_DIR=target
        cargo build --frozen --release --all-features
}

package() {
	cd "$srcdir/${pkgname}"
        # Binary
        install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/tubefeeder"
        # Desktop-file
        sed -i 's_/app/bin/tubefeeder_/usr/bin/tubefeeder_' packaging/de.schmidhuberj.tubefeeder.desktop
        install -D packaging/de.schmidhuberj.tubefeeder.desktop $pkgdir/usr/share/applications/de.schmidhuberj.tubefeeder.desktop
        # Icon
        install -D packaging/de.schmidhuberj.tubefeeder.512.png $pkgdir/usr/share/icons/hicolor/512x512/apps/de.schmidhuberj.tubefeeder.png
        install -D packaging/de.schmidhuberj.tubefeeder.svg $pkgdir/usr/share/icons/hicolor/scalable/apps/de.schmidhuberj.tubefeeder.png
        install -D packaging/de.schmidhuberj.tubefeeder.symbolic.svg $pkgdir/usr/share/icons/hicolor/symbolic/apps/de.schmidhuberj.tubefeeder-symbolic.png

        # Localization
        ls -ld po/locale/*/ | sed 's|.*po/locale/||' | xargs -I % install -D "po/locale/%LC_MESSAGES/de.schmidhuberj.tubefeeder.mo" "$pkgdir/usr/share/locale/%LC_MESSAGES/de.schmidhuberj.tubefeeder.mo"
}
