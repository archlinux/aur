# Maintainer: gigas002 <gigas002@pm.me>

pkgname=sweet-theme-full-git
_pkgname=sweet
pkgver=r265.c7f8a15
pkgrel=1
pkgdesc="Sweet KDE Plasma theme"
arch=('x86_64')
url="https://github.com/EliverLara/$_pkgname"
license=('GPL3')
makedepends=('git' 'inkscape' 'optipng')
depends=('sweet-kde-theme-git'
		 'kvantum'
         'sweet-folders-icons-git'
         'candy-icons')
optdepends=('ttf-roboto: primary font face defined (GTK theme)'
			'ttf-ubuntu-font-family: secondary font face defined (GTK theme)'
			'cantarell-fonts: tertiary font face defined (GTK theme)')
provides=("sweet-theme")
conflicts=('sweet-kde' 'sweet-kde-git' 'sweet-gtk-theme' 'sweet-theme-git'
           'sweet-cursor-theme-git' 'sweet-cursor-theme' 'sweet-cursors-theme'
           'kvantum-theme-sweet-git' 'sweet-kvantum-theme-git' 'sweet-gtk-theme-dark'
		   'plasma5-theme-sweet-git')
options=('!strip')
source=("git+$url.git#branch=nova")
sha256sums=('SKIP')

pkgver() {
	cd $srcdir/$_pkgname
  	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd $srcdir/$_pkgname

	export THEME_FONT_FACE=${THEME_FONT_FACE:-Roboto}
	export THEME_FONT_SIZE=${THEME_FONT_SIZE:-10}

	msg2 "To customize the font and size for gnome-shell, build this package"
	msg2 "with the variables below set to the desired font family and size"
	msg2 "- THEME_FONT_FACE (default font family is Roboto)"
	msg2 "- THEME_FONT_SIZE (default font point size is 10)"

	msg2 "Rendering assets, please wait"
	pushd gtk-2.0
	while read $line; do echo -n "."; done < \
		<(./render-assets.sh 2>/dev/null); echo
	popd

	pushd src
	while read $line; do echo -n "."; done < \
		<(./render-gtk3-assets.py 2>/dev/null; \
		./render-gtk3-assets-hidpi.py 2>/dev/null; \
		./render-wm-assets-hidpi.py 2>/dev/null; \
		./render-wm-assets.py 2>/dev/null); echo
	popd
	msg2 "Done!"

	msg2 "Setting gnome-shell font face to $THEME_FONT_FACE"
	msg2 "Setting gnome-shell font size to $THEME_FONT_SIZE"

	if [ "$THEME_FONT_FACE" != "Roboto" ]; then
		sed -i -re "s/font-family: (.*);/font-family: $THEME_FONT_FACE, \1;/" \
			"$srcdir/$_pkgname/gnome-shell/gnome-shell.css"
	fi

	if [ $THEME_FONT_SIZE != "10" ]; then
		sed -i -re "s/font-size: (.*);/font-size: $THEME_FONT_SIZEpt;/" \
			"$srcdir/$_pkgname/gnome-shell/gnome-shell.css"
	fi
}

package() {
    cd $_pkgname/kde
    install -d $pkgdir/usr/share
    
    # Workaround: https://github.com/EliverLara/Sweet/issues/78 + fix for splashscreen
    mkdir -p aurorae/themes
    mv aurorae/Sweet-Dark aurorae/themes/Sweet-Dark
    mv aurorae/Sweet-Dark-transparent aurorae/themes/Sweet-Dark-transparent
    rm aurorae/.shade.svg
    mv colorschemes color-schemes
    mkdir -p plasma/look-and-feel
    mv look-and-feel plasma/look-and-feel/Sweet
    mv sddm sddm-Sweet
    mkdir -p sddm/themes
    mv sddm-Sweet sddm/themes/Sweet

    # cursors
	install -d $pkgdir/usr/share/icons
    mv cursors/Sweet-cursors $pkgdir/usr/share/icons

    # kvantum
    cp -r Kvantum $pkgdir/usr/share

    # GTK
    mkdir -p $pkgdir/usr/share/themes/$_pkgname
	cp -a $srcdir/$_pkgname/* $pkgdir/usr/share/themes/$_pkgname/

    # KDE theme
    cp -r aurorae $pkgdir/usr/share
    cp -r color-schemes $pkgdir/usr/share
    cp -r konsole $pkgdir/usr/share
    cp -r plasma $pkgdir/usr/share
    cp -r sddm $pkgdir/usr/share
}
