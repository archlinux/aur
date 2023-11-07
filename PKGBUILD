# Maintainer: Daniel McLarty <info@savagedevs.com>
pkgname='rose-pine-gtk-theme-full'
pkgver=2.1.0
pkgrel=1
pkgdesc="A GTK theme with the Rose Pine colour palette. Includes Icons."
arch=(any)
url="https://github.com/rose-pine/gtk"
license=('MIT')
conflicts=("rose-pine-gtk-theme")
options=(!strip)
source=("https://github.com/rose-pine/gtk/releases/download/v$pkgver/gtk3.tar.gz" 
"https://github.com/rose-pine/gtk/releases/download/v$pkgver/gtk4.tar.gz" 
"https://github.com/rose-pine/gtk/releases/download/v2.1.0/rose-pine-icons.tar.gz" 
"https://github.com/rose-pine/gtk/releases/download/v2.1.0/rose-pine-dawn-icons.tar.gz" 
"https://github.com/rose-pine/gtk/releases/download/v2.1.0/rose-pine-moon-icons.tar.gz" 
"https://raw.githubusercontent.com/rose-pine/rose-pine-theme/e9388ed927c91d0f47726c410c3bb7964199dc48/license")
sha256sums=('8eeb7aa0cc966157551a26e3f8e2085bdf5ac7b519ad8a441665dacf4b38bcc2'
	'3a29cfd42ee6ac1f9557dc4498dbdf9f79d44c2af268943768bae1c7a4d00831'
	'87d7a94882cbb4c28b91040f81a4d5099ee04645d23a8d18a18817c1d9e0257e'
	'024ac32b35161e775f248928e2a06cfd628f4df2c871d692d574894daea43921'
	'6e906160008abdd84f0f1407d0aa77b9cf27e17347dc843a8b9b482c38258919'
	'SKIP')

_build() {
	local _name="$1"
	mkdir "gtk3/$_name-gtk/gtk-4.0"
	cp "gtk4/$_name.css" "gtk3/$_name-gtk/gtk-4.0/gtk.css"
}

_build_icons() {
    local _icon_name="$1"
    tar -xzf "$_icon_name.tar.gz" -C "icons/"
}

build() {
    _build "rose-pine"
    _build "rose-pine-dawn"
    _build "rose-pine-moon"
    _build_icons "rose-pine-icons"
    _build_icons "rose-pine-dawn-icons"
    _build_icons "rose-pine-moon-icons"
}

_package() {
	local _name="$1"
	install -d "$pkgdir/usr/share/themes/$_name/"
	cp -a --no-preserve=ownership "$_name"/ "$pkgdir/usr/share/themes/"
}

_package_icons() {
    local _icon_name="$1"
    install -d "$pkgdir/usr/share/icons/$_icon_name/"
    cp -a --no-preserve=ownership "icons/$_icon_name/" "$pkgdir/usr/share/icons/"
}

package() {
    install -Dm644 license "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    cd gtk3
    _package "rose-pine-gtk"
    _package "rose-pine-moon-gtk"
    _package "rose-pine-dawn-gtk"
    cd ..
    cd icons
    _package_icons "rose-pine-icons"
    _package_icons "rose-pine-dawn-icons"
    _package_icons "rose-pine-moon-icons"
}