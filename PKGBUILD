# Maintainer: Tom Carrio <tom@carrio.me>

pkgname=gamevox
pkgver=0.22.3
pkgrel=1
pkgdesc='GameVox: Voice Communication for Your Gaming Community'
arch=('x86_64')
url='https://www.gamevox.com/'
provides=('gamevox')
conflicts=('gamevox')
license=('unknown')
depends=('libsndfile' 'libxi' 'speech-dispatcher' 'speex' 'libx11' 'libpulse' 'nss' 'nspr' 'fontconfig' 'freetype2' 
         'atk' 'libxcursor' 'libxext' 'libxfixes' 'libxrender' 'libxcomposite' 'alsa-lib' 'libxdamage' 'libxtst'
         'libxrandr' 'flac' 'libgl' )
source=('https://download.gamevox.com/linux/GameVox-Install.run'
        'GameVox.desktop'
        'gamevox')
md5sums=('f8b3688a432b08d691927605e8f4e0b6'
         '50099dfda2cc6e48410ed930a9732dbf'
         '42df78d011bdcd3987f68883681db68a')
optdepends=('protobuf' 'qt5-webengine')
build(){
	chmod +x GameVox-Install.run
	./GameVox-Install.run --quiet --nox11 --target ${srcdir}/GameVox
}

package() {
    # Install files
    install -d "${pkgdir}/opt/gamevox"
    cp -a "${srcdir}/GameVox/." "${pkgdir}/opt/gamevox/"

    # Make binary executable
    chmod 755 "${pkgdir}/opt/gamevox/bin/gamevox"

    # Install desktop entry
    install -d "${pkgdir}/usr/share/applications"
    install "${srcdir}/GameVox.desktop" "${pkgdir}/usr/share/applications"

    # Create symbolic link to the main binary
    install -d "${pkgdir}/usr/bin"
    # GameVox script doesn't handle libraries correctly when symlinking
    # Hardcoded path to executable in `gamevox` file
    install -Dm755 "${srcdir}/gamevox" "${pkgdir}/usr/bin/gamevox"

    # Handle libraries 
    # install -d "${pkgdir}/usr/libexec"
    # cp -a "${srcdir}/GameVox/libexec/." "${pkgdir}/usr/libexec"
    # install -d "${pkgdir}/usr/lib"
    # ln -s "/usr/lib/libprotobuf.so.9" "${pkgdir}/usr/lib/libprotobuf.so.8"

    # If someone would like to extract the Windows ico to convert for this, please go ahead
    # install -d "${pkgdir}/usr/share/pixmaps"
    # install -Dm744 "${srcdir}/gamevox.png" "${pkgdir}/usr/share/pixmaps/gamevox.png"

    # Install license file
    install -Dm644 "${pkgdir}/opt/gamevox/doc/GVLICENSE.txt" "${pkgdir}/usr/share/licenses/gamevox/LICENSE"
}
