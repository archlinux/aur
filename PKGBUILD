# Maintainer: Marvin Dalheimer <me@marvin-dalheimer.de>
pkgname=godot-mono
pkgver=4.0.3
pkgrel=1
pkgdesc="An advanced, feature packed, multi-platform 2D and 3D game engine."
arch=('i686' 'x86_64')
url="https://godotengine.org/"
license=('MIT')
depends=("dotnet-sdk" "msbuild")
optdepends=()
makedepends=(
    'git'
    'scons>=3.0' 
    'libxcursor' 
    'libxinerama' 
    'libxi' 
    'libxrandr' 
    'mesa' 
    'glu' 
    'libglvnd'
    'alsa-lib' 
    'pulseaudio'
    'yasm'
    'freetype2'
    'gcc'
    'pkg-config'
    'rsync'
    'nuget'
    'xorg-server-xvfb'
)
provides=('godot-mono')
conflicts=('godot-mono-bin')
source=(${pkgname}::git+https://github.com/godotengine/godot.git)
md5sums=('SKIP')

build() {
    cd "${srcdir}/${pkgname}"

    #Checkout actual version of Godot
    git checkout ${pkgver}-stable

    #Build temporary binaries to generate needed files for mono support
    scons -j$(nproc) platform=linuxbsd tools=yes module_mono_enabled=yes mono_glue=no
    xvfb-run -s "-screen 0 1920x1080x24 -nolisten local" bin/godot.linuxbsd.editor.x86_64.mono --generate-mono-glue modules/mono/glue

    # Build normal binaries
    #scons -j$(nproc) platform=linuxbsd target=editor tools=yes module_mono_enabled=yes bits=64
    modules/mono/build_scripts/build_assemblies.py --godot-output-dir=./bin --godot-platform=linuxbsd
}

package() {
    install -d \
        "${pkgdir}/opt/${pkgname}/" \
        "${pkgdir}/usr/bin/" \
        "${pkgdir}/usr/share/applications/"

    rsync -a \
        "${srcdir}/${pkgname}/bin" "${pkgdir}/opt/${pkgname}"

    # I have to use TERM=xterm because of an bug in mono
    cat > "${pkgdir}/usr/bin/${pkgname}" <<-EOF
		#!/usr/bin/env bash
		/opt/godot-mono/bin/godot.linuxbsd.editor.x86_64.mono
	EOF
    
    chmod a+x ${pkgdir}/usr/bin/${pkgname}

    install -Dm644 \
        "${srcdir}/${pkgname}/icon.svg" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"

    cat > "${pkgdir}/usr/share/applications/${pkgname}.desktop" <<-EOF
		[Desktop Entry]
		Type=Application
		Name=Godot-Mono
		GenericName=Godot 2D and 3D game engine
		Comment=Godot is an Open-Source game engine for 2D and 3D games
		Keywords=game-dev;development;
		Categories=Development;
		Exec=/usr/bin/${pkgname}
		Icon=${pkgname}
	EOF
}
