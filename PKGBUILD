# Maintainer: nikp123 <nikp123 at e.email>
# Maintainer: Takstaartje <takstaartje at proton /dot/ me>

pkgname=minecraft-plymouth-theme-git
pkgver=r13.a4498c6
pkgrel=1
pkgdesc="A Minecraft loading screen styled Plymouth theme, inspired by MineGRUB"
arch=('any')
url="https://github.com/nikp123/minecraft-plymouth-theme"
license=('MIT')
makedepends=('git' 'imagemagick')
provides=("${pkgname%-git}")
source=("repo::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/repo"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/repo"

	install -d -m 0755 "${srcdir}/resized-assets"

	# Create smaller versions of assets
	for j in "padlock" "bar"; do
		for i in $(seq 1 6); do
			magick -define profile:skip=ICC plymouth/${j}.png \
				-interpolate Nearest -filter point -resize ${i}00% \
				"${srcdir}/resized-assets/${j}-${i}.png"
		done
	done

	# Create smaller versions of dirt wallpaper tile
	for i in $(seq 1 12); do
		magick plymouth/dirt.png \
			-channel R -evaluate multiply .2509803922 \
			-channel G -evaluate multiply .2509803922 \
			-channel B -evaluate multiply .2509803922 \
			-interpolate Nearest -filter point -resize ${i}00% \
			"${srcdir}/resized-assets/dirt-${i}.png"
	done
}

package() {
	cd "$srcdir/repo"

	PLYMOUTH_THEME_BASEDIR="${PLYMOUTH_THEME_BASEDIR:=/usr/share/plymouth/themes/mc}"
	FONTCONFIG_PATH="${FONTCONFIG_PATH:=/etc/fonts/conf.d/}"

	# Copy font and font config
	install -d -m 0755 "${pkgdir}/${FONTCONFIG_PATH}"
	cp font/config/* "${pkgdir}/${FONTCONFIG_PATH}"
	install -d -m 0755 "${pkgdir}/usr/share/fonts/OTF/"
	install -m 0644 font/Minecraft.otf "${pkgdir}/usr/share/fonts/OTF/"

	# Copy plymouth theme
	install -d -m 0755                        "${pkgdir}/${PLYMOUTH_THEME_BASEDIR}"
	install -m 0644 plymouth/mc.script        "${pkgdir}/${PLYMOUTH_THEME_BASEDIR}"
	install -m 0644 plymouth/mc.plymouth      "${pkgdir}/${PLYMOUTH_THEME_BASEDIR}"
	install -m 0644 plymouth/progress_bar.png "${pkgdir}/${PLYMOUTH_THEME_BASEDIR}"
	install -m 0644 plymouth/progress_box.png "${pkgdir}/${PLYMOUTH_THEME_BASEDIR}"

	# Import smaller versions of assets compiled previously
	cp ${srcdir}/resized-assets/* "${pkgdir}/${PLYMOUTH_THEME_BASEDIR}"
	
	# Install mkinitcpio file that will add the required theme files to initram	
	install -d -m 0755 "${pkgdir}/etc/mkinitcpio.conf.d"
	install -m 0644 mkinitcpio/minecraft-plymouth.conf "${pkgdir}/etc/mkinitcpio.conf.d"

	# Install dracut config, in case the user uses dracut
	install -d -m 0755 "${pkgdir}/etc/dracut.conf.d"
	install -m 0644 dracut/99-minecraft-plymouth.conf \
		"${pkgdir}/etc/dracut.conf.d/99-minecraft-plymouth.conf"

	# Install license
	install -d -m 0755      "${pkgdir}/usr/share/licenses/${pkgname}/"
	install -m 0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/"
}
