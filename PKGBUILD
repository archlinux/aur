# Maintainer: Nicolas Lorin <androw95220@gmail.com>
# Contributor: Daniel McLarty <info@savagedevs.com>
pkgname='rose-pine-gtk-theme-full'
pkgver=2.2.0
pkgrel=3
pkgdesc="A GTK theme with the Rose Pine colour palette. Includes Icons."
arch=(any)
url="https://github.com/rose-pine/gtk"
license=('MIT')
conflicts=("rose-pine-gtk-theme")
options=(!strip !debug)
source=("gtk3-${pkgver}.tar.gz::https://github.com/rose-pine/gtk/releases/download/v$pkgver/gtk3.tar.gz"
"gtk4-${pkgver}.tar.gz::https://github.com/rose-pine/gtk/releases/download/v$pkgver/gtk4.tar.gz"
"rose-pine-icons-${pkgver}.tar.gz::https://github.com/rose-pine/gtk/releases/download/v$pkgver/rose-pine-icons.tar.gz"
"rose-pine-dawn-icons-${pkgver}.tar.gz::https://github.com/rose-pine/gtk/releases/download/v$pkgver/rose-pine-dawn-icons.tar.gz"
"rose-pine-moon-icons-${pkgver}.tar.gz::https://github.com/rose-pine/gtk/releases/download/v$pkgver/rose-pine-moon-icons.tar.gz"
"https://raw.githubusercontent.com/rose-pine/rose-pine-theme/e9388ed927c91d0f47726c410c3bb7964199dc48/license")
sha256sums=('3e790f6898b39f43b23fb4794217c5cc31b64060de951db6d37c4243452d0d93'
            'a7bf5e314d6f70f76eba2190b922774e7c2cc301b098c43e086c31c361198a90'
            '8abae3b594a654dc679712983b87aa02b2f19de05ea7a841c692f2a5e8cd5e73'
            '11b02684724d1e539dc0a1ff083ead35d83a97c42e9cddc8af2d817cf1532ac7'
            '2953cecf761814cb429921f09832f32f38d80f5ee40acfd7bca5422979b44d40'
            'fb2535bcb42729f0547691eea7feee12d6870d184d704a7a929513973974d7bd')

_build() {
	local _name="$1"
	mkdir "gtk3/$_name-gtk/gtk-4.0"
	cp "gtk4/$_name.css" "gtk3/$_name-gtk/gtk-4.0/gtk.css"
}

_build_icons() {
    local _icon_name="$1"
    tar -xzf "$_icon_name-${pkgver}.tar.gz" -C "icons/"
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
