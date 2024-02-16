# Maintainer: Wasabi <wasabithumbs@gmail.com>
pkgname=open-goal-launcher
pkgver="2.4.1"
pkgrel=1
pkgdesc="A launcher for the OpenGOAL Project to simplify usage and installation"
arch=(any)
url='https://github.com/open-goal/launcher'
license=('ISC')
depends=('gtk3' 'webkit2gtk' 'openssl' 'appmenu-gtk-module' 'libappindicator-gtk3' 'librsvg' 'libvips' 'base-devel')
makedepends=('curl' 'wget' 'file' 'cargo' 'nodejs>=18.18.0' 'yarn')
conflicts=('open-goal-launcher-bin')
_tarball="v${pkgver}.tar.gz"
source=("https://github.com/open-goal/launcher/archive/refs/tags/${_tarball}" "${pkgname}.desktop")
md5sums=("f25a45fa8847512b68c2df145879c8a4" "SKIP")
options=(!strip)

prepare() {
    cd $srcdir
    tar -xf "${_tarball}"
    chmod +rw "launcher-${pkgver}"
    cd "launcher-${pkgver}"
    yarn install
    cd src-tauri
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd $srcdir
    sed -i '/^Comment=/d' "${pkgname}.desktop"
	sed -i '/^Version=/d' "${pkgname}.desktop"
	echo "Comment=${pkgdesc}" >> "${pkgname}.desktop"
	echo "Version=${pkgver}" >> "${pkgname}.desktop"

    cd "launcher-${pkgver}"
    yarn tauri build -b none
}

package() {
    _src="${srcdir}/launcher-${pkgver}/src-tauri"

	install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

	install -dm755 "${pkgdir}/usr/share/icons/hicolor"
	mkdir -p "${pkgdir}/usr/share/icons/hicolor/32x32/apps"
	cp "${_src}/icons/32x32.png" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/${pkgname}.png"
	mkdir -p "${pkgdir}/usr/share/icons/hicolor/128x128/apps"
	cp "${_src}/icons/128x128.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${pkgname}.png"
	mkdir -p "${pkgdir}/usr/share/icons/hicolor/256x256/apps"
	cp "${_src}/icons/128x128@2x.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname}.png"

	install -Dm755 "${_src}/target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}