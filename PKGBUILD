# Maintainer: DisableGraphics elchifladod@gmail.com
pkgbase="eslauncher2"
pkgname="eslauncher2"
pkgcompletename="ESLauncher2"
pkgrel=1
pkgver=0.9.12
pkgdesc="The next generation Endless Sky Launcher"
depends=('rust' 'fuse2')
options=('!lto')
arch=('any')
url="https://github.com/EndlessSkyCommunity/ESLauncher2"
license=('GPL-3.0')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('da4f6b55221c35dfd8ed6b4eac41b3ba68904d013ffa4ee3b3f015079c6ab17e34251a470678f97bd6d7a752872ecb404b12e94a3f67dfb468ca9088d81babbe')
makedepends=('cargo' 'alsa-lib')
prepare() {
	export RUSTUP_TOOLCHAIN=stable
	cd "${pkgcompletename^}-${pkgver}"
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}
build() {
	export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
	cd "${pkgcompletename^}-${pkgver}"
    cargo build --frozen --release --all-features
}

package() {
	install -Dm755 ${pkgcompletename^}-${pkgver}/target/release/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
	for i in ${pkgcompletename^}-${pkgver}/packaging/icons/*.png; do
		export STR="${pkgcompletename^}-${pkgver}\/packaging\/icons\/${pkgname}_"
		export reswithpng="$(echo $i | sed -e s/${STR}//)";
		export res="$(echo ${reswithpng} | sed -e s/.png//)";
		install -Dm755 $i "${pkgdir}/usr/share/icons/hicolor/${res}/apps/${pkgname}.png";
	done
	install -Dm755 ${pkgcompletename^}-${pkgver}/packaging/${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
}


