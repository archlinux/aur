# Maintainer: Sulthan A. Karimov <sulthankarimov@gmail.com>
_pkgname=blender-studio-pipeline
pkgname=$_pkgname-git
pkgver=r2351.dbc09de
pkgrel=1
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
	if [ -d !$srcdir ]; then
		echo "directory exists"
		git clone $url $srcdir
	fi
	git pull
}

package() {
	# if you want to install to specific version just change this
	# variable to the desired version eg ver=3.3
	ver=$(ls ~/.config/blender/ | sort -n | tail -1)
	mkdir -p "$HOME/.config/blender/$ver/scripts/startup/bl_app_templates_user"
	cp -ur "${srcdir}/application-templates/blender-media-viewer/blender_media_viewer" "$HOME/.config/blender/$ver/scripts/startup/bl_app_templates_user/"
	cp -ur "${srcdir}/scripts-blender/addons/" "$HOME/.config/blender/$ver/scripts/"
	install -Dm644 "${srcdir}/application-templates/blender-media-viewer/blender_media_viewer.desktop" -t "${pkgdir}/usr/share/applications/"
}
