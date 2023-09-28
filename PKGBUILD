# Maintainer: detiam <dehe_tian at outlook dot com>
# Contributor: Jakob Kreuze <jakob@memeware.net>
# Contributor: Bader <Bad3r@unsigned.sh>

# shellcheck disable=SC1090,SC2206
pkgname=pince-git
pkgver=r1360.161758a
pkgrel=1
pkgdesc="A Linux reverse engineering tool inspired by Cheat Engine."
arch=('any')
url="https://github.com/korcankaraokcu/PINCE"
license=('GPL3')
depends=('base-devel' 'python3' 'gdb')
makedepends=('git' 'qt6-tools' 'lsb-release')
optdepends=(
	'qt6-wayland: wayland support'
)
source=("$pkgname::git+$url.git" 'PINCE.desktop')
sha256sums=('SKIP' '33f145e61784d9f50b391e880d14a9d31a13d7b86cef0c8620f8f57fec0978bd')
_installpath='/usr/share/PINCE'
_installsh='install_pince.sh'

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	# Remove ".venv/PINCE" exist check
	sed -i '/^if \[ ! -d "\.venv\/PINCE" \]; /,/activate$/ s/^/# /' "./$pkgname/PINCE.sh"
	# Create a simple start script
	cat > pince <<- SHELL
		#!/bin/bash
		pushd "$_installpath" || exit
		sh PINCE.sh "\$@"
		popd || exit
	SHELL
}

build() {
	cd "$pkgname"
	# Source functions
	. <(sed -n '/^exit_on_error() /,/^}/p' $_installsh)
	. <(sed -n '/^set_install_vars() /,/^}/p' $_installsh)
	. <(sed -n '/^compile_translations() /,/^}/p' $_installsh)
	. <(sed -n '/^compile_libscanmem() /,/^}/p' $_installsh)
	. <(sed -n '/^install_libscanmem() /,/^}/p' $_installsh)
	# Execute functions
	set_install_vars "$(lsb_release -ds)" || exit_on_error
	install_libscanmem || exit_on_error
	compile_translations || exit_on_error
}

package() {

	pushd "$pkgname"

	# Source PKG_NAMES* vars
	. <(sed -n '/^PKG_NAMES/p' $_installsh)

	# Add new python depends
	for pipkg in $PKG_NAMES_PIP; do
		echo 'Added new depend '"$pipkg"''
		if [ "$pipkg" == "distorm3" ]; then
			depends+=("python-distorm")
		elif [ "$pipkg" == "pygobject" ]; then
			depends+=("python-gobject")
		elif [ "$pipkg" == "keystone-engine" ]; then
			depends+=("python-keystone")
		else
			depends+=("python-$pipkg")
		fi
	done

	# Copy files
	install -d "$pkgdir/usr/bin"
	install -Dm755 ../pince "$pkgdir/usr/bin"
	install -d "$pkgdir/$_installpath/i18n"
	install PINCE.sh PINCE.py \
		COPYING COPYING.CC-BY AUTHORS THANKS "$pkgdir/$_installpath"
	cp -r GUI libpince media tr "$pkgdir/$_installpath"
	cp -r i18n/qm "$pkgdir/$_installpath/i18n"

	popd

	# Compile Python bytecode
	# https://wiki.archlinux.org/title/Talk:Python_package_guidelines#Future_of_Python_packaging_in_Arch_Linux?
	python -m compileall -s "$pkgdir" -p / "$pkgdir"/usr/share

	# Install desktop entity
	install -d "$pkgdir"/usr/share/{applications,pixmaps}
	#ln -s '/usr/share/PINCE/media/logo/ozgurozbek/pince_big_white.png' \
	#	"$pkgdir/usr/share/pixmaps/PINCE.png"
	install -Dm755 PINCE.desktop "$pkgdir/usr/share/applications"

}
