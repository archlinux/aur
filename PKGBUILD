# Maintainer: Sulthan A. Karimov <sulthankarimov@gmail.com>
_pkgname=blender-studio-pipeline
pkgname=$_pkgname-git
pkgver=r2359.96dbb49
pkgrel=2
epoch=0
url="https://projects.blender.org/studio/blender-studio-pipeline.git"
pkgdesc="this will install Blender Media Viewer and Studio Addons. Learn more at $url."
arch=('x86_64')
license=('GPL')
depends=()
makedepends=('git-lfs')
optdepends=()
provides=('blender-studio-pipeline')
conflicts=()
#source=()
#sha256sums=('SKIP')

pkgver() {
	cd "$srcdir"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
	if [ ! -d $srcdir/.git ]; then
		git clone $url $srcdir
	fi
	echo "directory exists"
	git pull
	sed -i 's/\/path\/to\/blender_dir\///g' $srcdir/application-templates/blender-media-viewer/blender_media_viewer.desktop
	sed -i 's/Terminal=true/Terminal=false/g' $srcdir/application-templates/blender-media-viewer/blender_media_viewer.desktop
	sed -i 's/Icon=blender.svg/Icon=blender-studio-logo-white/g' $srcdir/application-templates/blender-media-viewer/blender_media_viewer.desktop
}

package() {
	# if you want to install to specific version just change this
	# variable to the desired version eg ver=3.3
	ver=$(ls ~/.config/blender/ | sort -n | tail -1)
	mkdir -p "$HOME/.config/blender/$ver/scripts/startup/bl_app_templates_user"
	cp -ur "${srcdir}/application-templates/blender-media-viewer/blender_media_viewer" "$HOME/.config/blender/$ver/scripts/startup/bl_app_templates_user/"
	cp -ur "${srcdir}/scripts-blender/addons/" "$HOME/.config/blender/$ver/scripts/"
	install -Dm644 "${srcdir}/application-templates/blender-media-viewer/blender_media_viewer.desktop" -t "${pkgdir}/usr/share/applications/"
	install -Dm644 "${srcdir}/docs/public/blender-studio-logo-white.svg" -t "${pkgdir}/usr/share/pixmaps/"
}
