# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

_pkgname=openandroidinstaller
pkgname=${_pkgname}-git
provides=("${_pkgname}")
conflicts=("${_pkgname}")
pkgver=v0.5.4.beta.1.fixup.r0.g8cebde7
pkgrel=1
pkgdesc='Makes installing alternative Android distributions nice and easy.'
url="https://${_pkgname}.org/"
license=('GPL-3.0-only')
depends=('python')
arch=('any')
optdepends=()
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-poetry')
source=("git+https://github.com/${_pkgname}-dev/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
	( set -o pipefail
		git describe --tags --abbrev=7 --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
	)
}

prepare() {
	cd "${_pkgname}"
	sed -i 's/command_list = \[str(bin_path.joinpath(Path(f"{tool}")))\] + command/command_list = shlex.split(full_command)/' 'openandroidinstaller/tooling.py'
}

build() {
	cd "${_pkgname}"
	#python 'scripts/build.py'
	python -m build --wheel --no-isolation
}

package() {
	depends+=('android-tools' 'heimdall' 'python-altgraph' 'python-attrs' 'python-beartype' 'python-black' 'python-click' 'python-tomli'
		'python-colorama' 'python-aiohttp' 'python-brotli' 'python-brotlicffi' 'python-certifi' 'python-cffi'
		'python-charset-normalizer' 'python-flet' 'python-schema' 'python-yaml'
		'python-regex' 'python-loguru')

	cd "${_pkgname}"
	python -m installer --destdir="$pkgdir" 'dist/'*.whl

	local site_packages="$(python -c "import site; print(site.getsitepackages()[0])")"

	install -Dm755 <(cat <<- EOF
		#!/usr/bin/env sh
		python '$site_packages/openandroidinstaller/openandroidinstaller.py'
		EOF
	) "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 <(cat <<- EOF
		[Desktop Entry]
		Version=1.5
		Type=Application
		Name=OpenAndroidInstaller
		Comment=Makes installing alternative Android distributions nice and easy.
		Categories=Utility;FileTools;
		Icon=org.openandroidinstaller.OpenAndroidInstaller
		Exec=openandroidinstaller
		Terminal=false
		EOF
	) "${pkgdir}/usr/share/applications/org.openandroidinstaller.OpenAndroidInstaller.desktop"

	install -Dm644 'openandroidinstaller/assets/logo-192x192.png' "${pkgdir}/usr/share/pixmaps/org.openandroidinstaller.OpenAndroidInstaller.png"
}
