# Maintainer: Amael <nils.van-zuijlen@mailo.com> & llaq <contact@lelibreauquotidien.fr>
pkgname=cesium-desktop-deb
pkgver=1.6.7
pkgrel=2
pkgdesc="Cesium Wallet for Ğ1 currency. Cesium is a wallet (client-software) for Ğ1, a libre currency."
arch=('x86_64')
url="https://www.cesium.app"
license=('AGPL3')
groups=('')
makedepends=("unzip" "sed")
depends=("nodejs" "gtk3" "nss" "libxss")
provides=("cesium-desktop")
options=('!strip' '!emptydirs')
source=("https://github.com/duniter/cesium/releases/download/v${pkgver}/cesium-desktop-v${pkgver}-linux-x64.deb")
sha512sums=('e95e391c5af6999bacd0666cfb870101bcd464fc587f3331e64914f13424f8930046284c63cae5e5158b74533bbef3d1dc32c654edd82f0638da68112af65bed')

package(){

	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"

	mkdir $pkgdir/usr/bin

	# Do here what was done post_install by the debian package
	CESIUM_ROOT="${pkgdir}/opt/cesium"
        CESIUM_G1_TEST="${pkgdir}/opt/cesium-g1-test"
        CESIUM_NW=$CESIUM_ROOT/nw

        unzip -q -d $CESIUM_NW $CESIUM_ROOT/nw.nwb
	rm $CESIUM_ROOT/nw.nwb
        chmod +x $CESIUM_NW/nw $CESIUM_NW/lib $CESIUM_NW/locales

	cd $pkgdir/usr/bin
        ln -s ../../opt/cesium/nw/nw cesium

        chmod +r -R $CESIUM_ROOT

        # Create a Cesium for G1-Test
        cd $pkgdir/opt
        cp -r "$CESIUM_ROOT" "$CESIUM_G1_TEST"
        cd "$CESIUM_G1_TEST/nw/"
        sed -i 's/"cesium"/"cesium-g1-test"/g' package.json

        # Change title of Cesium test
        sed -i 's/Cesium/Cesium Ğ1-Test/g' splash.html
        sed -i 's/Cesium/Cesium Ğ1-Test/g' cesium/index.html
        sed -i 's/g1.duniter/g1-test.duniter/g' cesium/config.js
        sed -i 's/g1.data/g1-test.data/g' cesium/config.js
        sed -i 's/"g1"/"g1-test"/g' cesium-desktop.js
        sed -i 's/.config\/cesium\//.config\/cesium-g1-test\//g' cesium-desktop.js

	cd $pkgdir/usr/bin
        ln -s ../../opt/cesium-g1-test/nw/nw cesium-g1-test

        # Change title of Cesium classic
        cd "$CESIUM_ROOT/nw/"
        sed -i 's/Cesium/Cesium Ğ1/g' splash.html
        sed -i 's/Cesium/Cesium Ğ1/g' cesium/index.html
}
