# Maintainer Mircea Mihalea <mircea at mihalea dot ro>

pkgname=rofi-menus-git
pkgver=c20044c
pkgrel=1
pkgdesc='A collection of rofi scripts used to provide different menus'
arch=('any')
url='https://gitlab.com/vahnrr/rofi-menus'
depends=('rofi')
builddepends=('sed')
optdepends=('python: Used to run the NetworkManager menu'
	    'mpc: Used to interact with mpd for music menu'
	    'scrot: Used to take screenshots')
provides=('rofi-appsmenu' 'rofi-i3layout' 'rofi-mpd' 'rofi-network' 'rofi-vpn' 'rofi-power' 'rofi-scrot')
source=('git+https://gitlab.com/vahnrr/rofi-menus.git')
sha256sums=('SKIP')

prepare() {
	cd rofi-menus
}

pkgver() {
    cd rofi-menus
    
    local _shorthash
    _shorthash="$(git rev-parse --short HEAD)"
    echo "$_shorthash"
    
}

build() {
    cd rofi-menus

    local _root="/usr/share/$pkgname"
    local _themes="$_root/themes"
    local _scripts="$_root/scripts"   

    find bins -type f -exec sed -i "s;~/.config/rofi;$_root;g" {} +
    find scripts -type f -exec sed -i "s;themes/;$_themes/;g" {} +
    echo "rofi -show drun -config $_root/config.rasi -theme $_themes/appsmenu.rasi" > bins/appsmenu

    sed -i "s;~/.config/networkmanager-dmenu;$_root/networkmanager;g" scripts/networkmenu.py
    sed -i "s;themes/;$_themes/;g" networkmanager-dmenu/config.ini
}

package() {
    cd rofi-menus

    local _installDir="$pkgdir/usr/share/$pkgname"
    mkdir -p $_installDir
    install -D -m755 config.rasi $_installDir
    cp -r themes $_installDir
    cp -r scripts $_installDir
    cp -r networkmanager-dmenu $_installDir/networkmanager


    install -D -m755 bins/appsmenu $pkgdir/usr/bin/rofi-appsmenu
    install -D -m755 bins/i3layoutmenu $pkgdir/usr/bin/rofi-i3layout
    install -D -m755 bins/mpdmenu $pkgdir/usr/bin/rofi-mpd
    install -D -m755 bins/networkmenu $pkgdir/usr/bin/rofi-network
    install -D -m755 bins/nmvpnmenu $pkgdir/usr/bin/rofi-vpn
    install -D -m755 bins/powermenu $pkgdir/usr/bin/rofi-power
    install -D -m755 bins/scrotmenu $pkgdir/usr/bin/rofi-scrot
}
