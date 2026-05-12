# Maintainer: detiam <dehe_tian at outlook dot com>
# Contributor: Jakob Kreuze <jakob@memeware.net>
# Contributor: Bader <Bad3r@unsigned.sh>
# Contributor: p0358

# shellcheck disable=SC1090,SC2207
pkgname=pince-git
pkgver=r1693.b3db730
pkgrel=1
pkgdesc="A Linux reverse engineering tool inspired by Cheat Engine."
arch=('any')
url="https://github.com/korcankaraokcu/PINCE"
license=('GPL-3.0-or-later WITH CC-BY-3.0')
provides=('pince')
conflicts=('pince')
depends=('polkit') # follow upstream, set this later
makedepends=('cmake' 'python-pip' 'qt6-tools' 'lsb-release' 'pkgconf' 'git' 'sed')
optdepends=(
	'qt6-wayland: wayland support'
)
source=("$pkgname::git+$url.git"
		'pince.desktop'
		'pince.sh')
sha1sums=('SKIP'
          '916ca418f86982ee96937da468e3fa2d7d04c9ae'
          '4d9901d48437cf6870650d343d94774763e4916f')
_installpath='/usr/lib/pince'
_installsh='install.sh'

pkgver() {
	cd "$pkgname" || exit 1
	printf "r%s.%s" \
		"$(git rev-list --count HEAD)" \
		"$(git rev-parse --short HEAD)"
}

build() {
	cd "$pkgname" || exit 1

	# Source functions
	. <(sed -n '/^exit_on_error() /,/^}/p' $_installsh)
	. <(sed -n '/^set_install_vars() /,/^}/p' $_installsh)
	. <(sed -n '/^compile_translations() /,/^}/p' $_installsh)
	. <(sed -n '/^compile_libmemscan() /,/^}/p' $_installsh)
	. <(sed -n '/^install_libmemscan() /,/^}/p' $_installsh)
	. <(sed -n '/^install_libptrscan() /,/^}/p' $_installsh)

	# Execute functions
	set_install_vars "Arch Linux" || exit_on_error
	install_libmemscan || exit_on_error
	install_libptrscan || exit_on_error
	compile_translations || exit_on_error
}

package() {
	install -Dm755 pince.sh "$pkgdir/usr/bin/pince"
	install -Dm644 pince.desktop "$pkgdir/usr/share/applications/io.github.korcankaraokcu.PINCE.desktop"

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

	# Copy app files
	install -d "$pkgdir/$_installpath/i18n"
	install -Dm755 PINCE.py -t "$pkgdir/$_installpath/"
	cp -r GUI libpince media tr "$pkgdir/$_installpath/"
	cp -r i18n/qm "$pkgdir/$_installpath/i18n"

	# Copy system files
	install -Dm644 COPYING COPYING.CC-BY -t "$pkgdir"/usr/share/licenses/$pkgname/
	install -Dm644 README.md AUTHORS THANKS -t "$pkgdir"/usr/share/doc/$pkgname/
	install -Dm644 media/logo/ozgurozbek/pince_small_transparent.png "$pkgdir"/usr/share/icons/hicolor/256x256/apps/io.github.korcankaraokcu.PINCE.png

	popd || exit 1

	# Compile Python bytecode
	# https://wiki.archlinux.org/title/Talk:Python_package_guidelines#Future_of_Python_packaging_in_Arch_Linux?
	python -m compileall -q -s "$pkgdir" -p / "$pkgdir"/usr/share
}
