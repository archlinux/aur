# Maintainer: gigas002 <gigas002@pm.me>

pkgname=plasma5-themes-sweet-full-git
_pkgname=sweet
pkgver=r327.8bb5040
pkgrel=1
pkgdesc="Sweet KDE Plasma theme"
arch=('x86_64')
url="https://github.com/EliverLara/$_pkgname"
license=('GPL3')
makedepends=('git' 'inkscape' 'optipng')
depends=('plasma5-themes-sweet-kde-git'
		 'kvantum'
         'candy-icons-git')
optdepends=('ttf-roboto: primary font face defined (GTK theme)'
			'ttf-ubuntu-font-family: secondary font face defined (GTK theme)'
			'cantarell-fonts: tertiary font face defined (GTK theme)'
			'sweet-folders-icons-git: sweet folder icons')
provides=("sweet-theme")
conflicts=('sweet-kde' 'sweet-kde-git' 'sweet-gtk-theme' 'sweet-theme-git'
           'sweet-cursor-theme-git' 'sweet-cursor-theme' 'sweet-cursors-theme'
           'kvantum-theme-sweet-git' 'sweet-kvantum-theme-git' 'sweet-gtk-theme-dark'
		   'plasma5-theme-sweet-git' 'sweet-theme-full-git')
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
    cd $srcdir/$_pkgname/kde
    mkdir -p $pkgdir/usr/share
    
    # Workaround: https://github.com/EliverLara/Sweet/issues/78 + fix for splashscreen
    mkdir -p aurorae/themes
    mv -f aurorae/Sweet-Dark aurorae/themes/Sweet-Dark
    mv -f aurorae/Sweet-Dark-transparent aurorae/themes/Sweet-Dark-transparent
    rm aurorae/.shade.svg
    mv -f colorschemes color-schemes
    mkdir -p plasma/look-and-feel
    mv -f look-and-feel plasma/look-and-feel/Sweet
    mv -f sddm sddm-Sweet
    mkdir -p sddm/themes
    mv -f sddm-Sweet sddm/themes/Sweet

    # KDE theme
    mv -f aurorae $pkgdir/usr/share
    mv -f color-schemes $pkgdir/usr/share
    mv -f konsole $pkgdir/usr/share
    mv -f plasma $pkgdir/usr/share
    mv -f sddm $pkgdir/usr/share

    # cursors
	mkdir -p $pkgdir/usr/share/icons
    mv -f cursors/Sweet-cursors $pkgdir/usr/share/icons

    # kvantum
    mv -f Kvantum $pkgdir/usr/share

    # GTK
	cd $srcdir/$_pkgname
    mkdir -p $pkgdir/usr/share/themes/$_pkgname
	mv -f assets $pkgdir/usr/share/themes/$_pkgname/
	mv -f cinnamon $pkgdir/usr/share/themes/$_pkgname/
	mv -f gnome-shell $pkgdir/usr/share/themes/$_pkgname/
	mv -f gtk-2.0 $pkgdir/usr/share/themes/$_pkgname/
	mv -f gtk-3.0 $pkgdir/usr/share/themes/$_pkgname/
	mv -f gtk-4.0 $pkgdir/usr/share/themes/$_pkgname/
	mv -f metacity-1 $pkgdir/usr/share/themes/$_pkgname/
	mv -f xfwm4 $pkgdir/usr/share/themes/$_pkgname/
	mv -f index.theme $pkgdir/usr/share/themes/$_pkgname/
}
