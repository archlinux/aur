# Maintainer: Lance G. <Gero3977@gmail.com>

pkgname="postybirb-plus"
pkgver=3.1.16
pkgrel=1
pkgdesc="An application that helps artists post art and other multimedia to multiple websites more quickly. Postybirb plus version (Client/Server)."
url="https://www.postybirb.com"
arch=(
  aarch64 #ALARM
  armv7h  #ALARM
  i686    #Arch Linux32
  x86_64  #Arch Linux
)

## Node uses different arch names than makepkg
case "$CARCH" in
	i686)    _arch=ia32;;
	x86_64)  _arch=x64;;
	armv7h)  _arch=armv7l;;
	aarch64) _arch=arm64;;
	*)       _arch=DUMMY;;
esac

license=('BSD')
depends=('electron19')
makedepends=('npm' 'nodejs-lts-fermium')
source=("$pkgname-v$pkgver.tar.gz::https://github.com/mvdicarlo/postybirb-plus/archive/v${pkgver}.tar.gz"
        "${pkgname%}.desktop"
        "${pkgname%}.sh")
sha512sums=('77ef9c8bf5062bfd514c6f705259f031e4342582cb3961fca5255fcc3894e5d145ba998d7e3feafd5a4cc25e43b1faf97266b71e1ba90d60cf8edec020b93fb0'
            'f2db5eb5f880e5c2e586ab6f2d6822409d13966af82f20a8a59b6ba967c98af728ca4d2a538c7d31f10b7009b5e1d21f13a76722c88ceb75d65ff42f1b17b142'
            '2ad0d9e6a9248bc616a30895fe40fb164f8175924f45ca17e3bb8631e348c27abb856f86d3a77c363595b169458c61f49cf67f24147b66c09ad25b29cb8a7c7a')

build() {
        # Define HOME only for npm to prevent npm from clogging user's home with cache 
        cd "$srcdir/${pkgname}-${pkgver}/commons"
        HOME="$srcdir/.node-tmp" npm ci 
        HOME="$srcdir/.node-tmp" npm run build

        cd "$srcdir/${pkgname}-${pkgver}/ui"
        HOME="$srcdir/.node-tmp" npm ci 
        HOME="$srcdir/.node-tmp" npm run build

        cd "$srcdir/${pkgname}-${pkgver}/electron-app"
	
	#use system electron version
	#see: https://wiki.archlinux.org/index.php/Electron_package_guidelines
	electronDist=/usr/lib/electron19
        electronVer=$(electron19 --version | tail -c +2)
    
	export npm_config_target=${electronVer}
        export npm_config_arch=${_arch}
        export npm_config_target_arch=${_arch}
        export npm_config_disturl=https://atom.io/download/electron
        export npm_config_runtime=electron
        export npm_config_build_from_source=true
        sed -i '/"electron":/d' package.json
        HOME="$srcdir/.node-tmp" npm ci 
        HOME="$srcdir/.node-tmp" npm run build 
        ./node_modules/.bin/electron-builder build --linux dir --dir=release --${_arch} -c.electronDist=$electronDist -c.electronVersion=$electronVer
}


package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    
    install -dm755 "${pkgdir}/usr/lib/${pkgname}"
    cp -dr --no-preserve=ownership electron-app/release/linux-${_arch}-unpacked/resources/* "${pkgdir}/usr/lib/${pkgname}/"
    
    install -Dm644 electron-app/packaging-resources/icons/icon_256x256x32.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/${pkgname}.png"
    
    install -dm755 "${pkgdir}/usr/bin"
    install -Dm755 "$srcdir/${pkgname%}.sh" "$pkgdir/usr/bin/${pkgname%}"
    
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/postybirb/LICENSE"
    
    install -Dm644 "$srcdir/${pkgname%}.desktop" -t "$pkgdir/usr/share/applications"
}
