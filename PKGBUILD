# Maintainer: detiam <dehe_tian at outlook dot com>
# Contributor: Jakob Kreuze <jakob@memeware.net>
# Contributor: Bader <Bad3r@unsigned.sh>

# shellcheck disable=SC1090,SC2207
pkgname=pince
pkgver=0.4.4
pkgrel=1
pkgdesc="A Linux reverse engineering tool inspired by Cheat Engine."
arch=('any')
url="https://github.com/korcankaraokcu/PINCE"
license=('GPL-3.0-or-later WITH CC-BY-3.0')
depends=() # follow upstream, set this later
makedepends=('cmake' 'python-pip' 'qt6-tools' 'lsb-release' 'pkgconf' 'git' 'sed')
optdepends=(
	'qt6-wayland: wayland support'
)
source=("$pkgname::git+$url.git#tag=v$pkgver" 'PINCE.desktop')
install="note.install"
sha1sums=('1c3ca9cb323937ab0ee254a1ebb63a828e78d341'
          '719d18d69abc299f739cc04041967e9d05a34104')
_installpath='/usr/share/PINCE'
_installsh='install.sh'

prepare() {
	# Remove ".venv/PINCE" exist check
	sed -e '/^if \[ ! -d .*.venv.* \]; /,/venv.*activate$/ s/^/# /' \
		-e 's|[^ ]*python3|python3|' \
		-i "./$pkgname/PINCE.sh"
}

build() {
	cd "$pkgname" || exit 1

	# Source functions
	. <(sed -n '/^exit_on_error() /,/^}/p' $_installsh)
	. <(sed -n '/^set_install_vars() /,/^}/p' $_installsh)
	. <(sed -n '/^compile_translations() /,/^}/p' $_installsh)
	. <(sed -n '/^compile_libscanmem() /,/^}/p' $_installsh)
	. <(sed -n '/^install_libscanmem() /,/^}/p' $_installsh)
	. <(sed -n '/^install_libptrscan() /,/^}/p' $_installsh)

	# Execute functions
	set_install_vars "Arch Linux" || exit_on_error
	install_libscanmem || exit_on_error
	install_libptrscan || exit_on_error
	compile_translations || exit_on_error
}

package() {
	# Install desktop entity
	install -d "$pkgdir"/usr/share/applications
	install -Dm755 PINCE.desktop "$pkgdir/usr/share/applications"

	pushd "$pkgname" || exit 1

	if [[ -e requirements.txt ]]; then
		# Get $PKG_NAMES_PIP from requirements.txt
		PKG_NAMES_PIP=$(
			sed 's/=.*//g' requirements.txt \
			| tr '[:upper:]' '[:lower:]'
		)
	fi

	# Add new Python depends
	for pipkg in $PKG_NAMES_PIP; do
		msg2 'Added new Python depend '"$pipkg"''
		if [ "$pipkg" == "distorm3" ]; then
			depends+=("python-distorm")
		elif [ "$pipkg" == "pygobject" ]; then
			depends+=("python-gobject")
		elif [ "$pipkg" == "keystone-engine" ]; then
			depends+=("python-keystone")
		elif [ "$pipkg" == "pyqt6-qt6" ]; then
			depends+=("python-pyqt6")
		else
			depends+=("python-$pipkg")
		fi
	done

	# Add new depends
	. <(sed -n '/^PKG_NAMES_ARCH/p' $_installsh)
	for dep in $PKG_NAMES_ARCH; do
		if [[ ! ${makedepends[*]} =~ $dep ]]; then
			msg2 'Added new depend '"$dep"''
			depends+=("${dep:-base-devel}")
		fi
	done

	depends=($(printf "%s\n" "${depends[@]}" | sort -u))

	# Copy files
	install -d "$pkgdir/usr/bin"
	install -d "$pkgdir/$_installpath/i18n"
	install PINCE.sh PINCE.py \
		COPYING COPYING.CC-BY AUTHORS THANKS "$pkgdir/$_installpath"
	cp -r GUI libpince media tr "$pkgdir/$_installpath"
	cp -r i18n/qm "$pkgdir/$_installpath/i18n"

	# Create a start script
	install -Dm755 /dev/stdin "$pkgdir/usr/bin/pince" <<- SHELL
		#!/usr/bin/env bash

		syncicon() {
		    local logo_path iconpath destpath
		    . <(grep '^logo_path=.*' "\${XDG_CONFIG_HOME:-"\$HOME/.config"}/PINCE/PINCE.conf")
		    iconpath="/usr/share/PINCE/media/logo/\$logo_path"
		    destpath="\${XDG_DATA_HOME:-"\$HOME/.local/share"}/icons/hicolor/256x256/apps/PINCE.png"
		    mkdir -p "\$(dirname "\$destpath")"
		    ln -sf "\$iconpath" "\$destpath"
		    echo -e "\nDesktop icon updated: \$destpath"
		    echo "If the setting of icon changed, Re-login for setting to take effect."
		}

		pushd "$_installpath" || exit 1
		sh PINCE.sh "\$@"
		syncicon
		popd || exit 1

		read -p "Press enter to exit..."

	SHELL

	popd || exit 1

	# Compile Python bytecode
	# https://wiki.archlinux.org/title/Talk:Python_package_guidelines#Future_of_Python_packaging_in_Arch_Linux?
	python -m compileall -q -s "$pkgdir" -p / "$pkgdir"/usr/share
}
