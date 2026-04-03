# Maintainer: SelfRef <arch@selfref.dev>
# Contributor: Christian Schendel (doppelhelix@gmail.com)

_pkgbase=gnome-shell-extension-pano
pkgname=${_pkgbase}-git
pkgver=23.alpha5.r11.g1bb7d22
pkgrel=1
pkgdesc="Next-gen Clipboard Manager for Gnome Shell"
arch=('any')
url="https://github.com/oae/gnome-shell-pano"
license=('GPL-2.0')
depends=(
	'gnome-shell>=45'
	'libgda6'
)
makedepends=(
	'git'
	'nvm'
	'yarn'
)
provides=("$_pkgbase")
conflicts=("$_pkgbase")
source=(
	"$_pkgbase::git+https://github.com/oae/gnome-shell-pano.git"
	"0001-replace-validate-color-source.patch")
sha256sums=('SKIP'
            '19698b151b855c96ca52202bd5b0497d5cbf8511884e2b1494fe64096f11a010')

_ensure_local_nvm() {
	which nvm >/dev/null 2>&1 && nvm deactivate && nvm unload
	export NVM_DIR="${srcdir}/.nvm"
	source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
}

pkgver() {
	cd "$_pkgbase"
	git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

prepare() {
	cd "$_pkgbase"

	# Remove after https://github.com/oae/gnome-shell-pano/pull/379 is merged and released
	patch -Np1 -i "$srcdir/0001-replace-validate-color-source.patch"

	_ensure_local_nvm
	nvm install 20
	yarn install --cache-folder "$srcdir/yarn-cache"
}

build() {
	cd "$_pkgbase"
	_ensure_local_nvm
	yarn build
}

package() {
	cd "$_pkgbase/dist"
	mkdir -p "$pkgdir/usr/share/gnome-shell/extensions/pano@elhan.io"
	cp -r * "$pkgdir/usr/share/gnome-shell/extensions/pano@elhan.io/"
}

