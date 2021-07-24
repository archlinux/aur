# Maintainer: Jacqueline Fisher <jcfisher@reality-overwritten.net>

pkgname="postybirb"
pkgver=2.3.34
pkgrel=1
pkgdesc="An application that helps artists post art and other multimedia to multiple websites more quickly."
url="https://www.postybirb.com"
arch=('x86_64')
license=('BSD')
depends=('electron7')
makedepends=('npm' 'nvm' 'python2')
source=("$pkgname-v$pkgver.tar.gz::https://github.com/mvdicarlo/postybirb//archive/v${pkgver}.tar.gz"
        "${pkgname%}.desktop"
        "${pkgname%}.sh"
        "buildOptimizer.patch")
sha512sums=('b36e250d0cc24f2975b3fd5df7280d4b77c91915c2bfb7ca69cf17509dbd59f7145e0afe1f3b5565d83ba04e72ac6373f9fe001277dddf438b1bc8dd4535c187'
            '313afe3d7f1ea7da37cfff24d3976fbc926739d76d03114dd7d237ff91221ccc5ab28fcb3d3ab14b31235bd0de20e07b39ba1f42caba7f22ae3a2278e75384fd'
            'a522c36c98a63a90d45bac44294f4efa6b420d0c6411de32177f35849ab416c2dfd1470c71441e017ecb514903f44cbb2e28b22ac75efa05141627836385057d'
            'b4d3f076bb676bd7ac874177d6b06bae54d647c1c540dc800d20c05e90dbb537f1f406ae299e0c682b305485c343a7149fbcfbac04d5b1425e5d3e1e13e175e6')

prepare() {
    cd "$srcdir/${pkgname}-${pkgver}"
    source /usr/share/nvm/init-nvm.sh && nvm install 15.14.0
    patch --strip=1 < ../buildOptimizer.patch
}

build() {
	cd "$srcdir/${pkgname}-${pkgver}"
	source /usr/share/nvm/init-nvm.sh && nvm use --delete-prefix v15.14.0 --silent
	
	HOME="$srcdir/.node-gyp" npm ci
	sed -i "s|${srcdir}/${pkgname}-${pkgver}/node_modules/sshpk|.|g" node_modules/sshpk/package.json
	HOME="$srcdir/.node-gyp" npm run prod
	
	#use system electron version
	#see: https://wiki.archlinux.org/index.php/Electron_package_guidelines
	electronDist=$(dirname $(realpath $(which electron7)))
    electronVer=$(electron7 --version | tail -c +2)
    
	cd "$srcdir/${pkgname}-${pkgver}/electron"
	export npm_config_target=$(tail /usr/lib/electron7/version)
    export npm_config_arch=x64
    export npm_config_target_arch=x64
    export npm_config_disturl=https://atom.io/download/electron
    export npm_config_runtime=electron
    export npm_config_build_from_source=true
    sed -i '/"electron":/d' package.json
    HOME="$srcdir/.node-gyp" npm ci
    sed -i "s|${srcdir}/${pkgname}-${pkgver}/electron/node_modules/sshpk|.|g" node_modules/sshpk/package.json
    ./node_modules/.bin/electron-builder --linux --x64 --dir=release -c.electronDist=$electronDist \
         -c.electronVersion=$electronVer
}


package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    
    install -dm755 "${pkgdir}/usr/lib/${pkgname}"
    cp -dr --no-preserve=ownership electron/release/linux-unpacked/resources/* "${pkgdir}/usr/lib/${pkgname}/"
    
    install -Dm644 electron/build/icons/icon_256x256x32.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/${pkgname}.png"
    
    install -dm755 "${pkgdir}/usr/bin"
    install -Dm755 "$srcdir/${pkgname%}.sh" "$pkgdir/usr/bin/${pkgname%}"
    
    install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/postybirb/LICENSE"
    
    install -Dm644 "$srcdir/${pkgname%}.desktop" -t "$pkgdir/usr/share/applications"
}
