# Maintainer: Frank Endres <frankendres@tuxfamily.org>
pkgname=xfwm4-theme-generator
pkgver=git
pkgrel=1
pkgdesc="XFWM theme generator from Client Side Decorations - provides Adwaita light / dark themes"
arch=('x86_64' 'arm64')
url="https://github.com/andreldm/xfwm4-theme-generator"
license=('GPL')
makedepends=('xfwm4' 'git')
genthemes=('Adwaita' 'Adwaita-dark')

prepare() {
	if [ -d "$pkgname" ]; then
		git -C "$pkgname" fetch
	else
		git clone "https://github.com/andreldm/xfwm4-theme-generator.git"
	fi
}

build() {
	cd "$pkgname"
	make
	mv theme-generator xfwm-theme-generator
	cat > xfwm-theme-generator.sh << EOF
if [ -z "\$1" ]; then
	echo "usage: \$0 theme_name"
	echo "example: \$0 Adwaita"
	exit 1
fi
if [ ! -d "/usr/share/themes/\$1/gtk-3.0" ] && [ ! -d "~/.themes/\$1/gtk-3.0" ]; then
	echo -e "missing /usr/share/themes/\$1/gtk-3.0 and ~/.themes/\$1/gtk-3.0 directory"
	exit 2
fi
theme="\$1"
generator="\$(dirname \$1)/xfwm-theme-generator"
if [ \$(id -u) == 0 ] || [ ! -z "\$DESTDIR" ]; then
	destdir="\$DESTDIR/usr/share/themes"
else
	destdir=~/.themes
fi

GTK_THEME="\$theme" "\$generator"
for png in theme/*.png; do img=\${png%.png}; convert \$img.png -alpha set +dither \$img.xpm; done
for n in 2 3 4 5; do
	ln -sf title-1-active.xpm theme/title-\$n-active.xpm
	ln -sf title-1-inactive.xpm theme/title-\$n-inactive.xpm
done
rm -f theme/*.png theme/.name
mkdir -p "\$destdir/\$theme"
mv theme "\$destdir/\$theme/xfwm4"
EOF
	chmod +x xfwm-theme-generator.sh
}

package() {
	cd "$pkgname"
	mkdir -p "$pkgdir/usr/bin"
	cp xfwm-theme-generator xfwm-theme-generator.sh "$pkgdir/usr/bin/"
	for th in "${genthemes[@]}"; do
		DESTDIR="$pkgdir" ./xfwm-theme-generator.sh $th
	done
}
