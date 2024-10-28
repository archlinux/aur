# Maintainer: FerrousInk <ferrousink-aur@proton.me>

pkgname=ttf-windows-fonts
pkgver=1.0.0
pkgrel=1
pkgdesc="All of the fonts needed for proper Microsoft services with automated installation"
arch=('any')
depends=('wimlib' 'sudo' 'curl' 'udftools')

prepare() {
    sudo echo Downloading Windows...
    curl -s "https://api.gravesoft.dev/msdl/proxy?product_id=3113&sku_id=18480" | grep -o '<a href="[^"]*">' | cut -d'"' -f2 > url.txt
    curl -o fonts.iso -# $(cat url.txt)

    mkdir mount
    mkdir fonts

    sudo mount fonts.iso mount/ -r
    cp mount/sources/install.wim ./fonts.wim
    sudo umount mount/
    
    wimlib-imagex mount fonts.wim 1 mount/
    cp mount/Windows/Fonts/*.ttf fonts/
    wimlib-imagex unmount mount/

    sudo bash -c 'ls fonts/ > /usr/share/fonts/ttf-windows-fonts.txt'
    sudo cp fonts/* /usr/share/fonts/TTF/
}

post_remove() {
    for font in $(cat /usr/share/fonts/ttf-windows-fonts.txt); do
	sudo rm /usr/share/fonts/TTF/$font
    done

    sudo rm /usr/share/fonts/ttf-windows-fonts.txt
}
