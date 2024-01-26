# Maintainer: Patrick Rogers <patrick@thewebzone.net>
pkgname='linux-air-combat'
pkgver=09p55
pkgrel=1
pkgdesc="Free open source combat flight simulator"
arch=('x86_64' 'aarch64' 'armv6h' 'armv7h')
url="https://askmisterwizard.com/2019/LinuxAirCombat/LinuxAirCombat.htm"
license=('unknown')
depends=('freeglut' 'sdl' 'sdl_mixer' 'glu' 'mesa')
makedepends=('gcc')
optdepends=('espeak: adds voice effects in-game'
	    'mumble: team voice integration')
source=("https://sourceforge.net/projects/linuxaircombat/files/Choose%20Your%20Platform/Most%20LINUX%20Desktops%20%28in%20the%20global%20usr%20filesystem%20for%20all%20users%29/Lac${pkgver}.tar.gz")
md5sums=('SKIP')
_resource_dir='usr/share/lac'

build() {
    cd "Lac${pkgver}"
    make
}

package() {
    cd "Lac${pkgver}"
    # Rename binary file to remove version naming
    install -Dm755 bin/Release/Lac${pkgver} "$pkgdir"/usr/bin/lac
    install -Dm644 lac.png "$pkgdir"/${_resource_dir}/lac.png
    install -Dm644 DefaultHeightMap.LAC "$pkgdir"/$_resource_dir/

    install -d "$pkgdir"/${_resource_dir}/music
    install -Dm644 bin/music/* "$pkgdir"/${_resource_dir}/music/

    install -d "$pkgdir"/${_resource_dir}/sounds
    install -Dm644 bin/sounds/* "$pkgdir"/${_resource_dir}/sounds
    
    install -d "$pkgdir"/${_resource_dir}/models
    install -Dm644 bin/models/* "$pkgdir"/${_resource_dir}/models
    
    install -d "$pkgdir"/${_resource_dir}/textures
    install -Dm644 bin/textures/* "$pkgdir"/${_resource_dir}/textures
    
    # Supplied .desktop file is broken
    # cp lac.desktop "$pkgdir"/usr/share/applications/
    # chmod +r "$pkgdir"/usr/share/applications/lac.desktop
    
    install -d "$pkgdir"/usr/share/applications
    # Write working .desktop file
    echo "[Desktop Entry]
Type=Application
Name=Linux Air Combat
GenericName=Flight Simulator
Comment=Open source combat flight simulator
Terminal=false
Icon=/usr/share/lac/lac.png
Exec=sh -c lac
Keywords=lac;game;air;flight;combat;linux;plane;
Categories=Game
StartupNotify=true" > "$pkgdir"/usr/share/applications/lac.desktop
    chmod 644 "$pkgdir"/usr/share/applications/lac.desktop
    
}
