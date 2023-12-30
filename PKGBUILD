# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

_pkgname=openandroidinstaller
pkgname=${_pkgname}-git
provides=("${_pkgname}")
conflicts=("${_pkgname}")
pkgver=v0.5.1.beta.r0.gfe5644f
pkgrel=1
pkgdesc='Makes installing alternative Android distributions nice and easy.'
url="https://${_pkgname}.org/"
license=('GPL3')
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
	sed -i 's/CountinuosRectangleBorder/ContinuousRectangleBorder/' 'openandroidinstaller/views/'{requirements_view.py,start_view.py,select_view.py,addon_view.py}
	sed -i 's/command_list = \[str(bin_path.joinpath(Path(f"{tool}")))\] + command/command_list = shlex.split(full_command)/' 'openandroidinstaller/tooling.py'
}

build() {
	cd "${_pkgname}"
	#python 'scripts/build.py'
	python -m build --wheel --no-isolation
}

package() {
	depends=('android-tools' 'heimdall' 'python-altgraph' 'python-attrs' 'python-beartype' 'python-black' 'python-click' 'python-tomli'
		'python-colorama' 'python-aiohttp' 'python-brotli' 'python-brotlicffi' 'python-certifi' 'python-cffi'
		'python-charset-normalizer' 'python-contextlib2' 'python-exceptiongroup' 'python-flet' 'python-schema' 'python-yaml'
		'python-regex')
	
	cd "${_pkgname}"
	python -m installer --destdir="$pkgdir" 'dist/'*.whl
	
	local site_packages="$(python -c "import site; print(site.getsitepackages()[0])")"
	
	install -Dm755 <(cat <<- EOF
		#!/usr/bin/env sh
		python '$site_packages/openandroidinstaller/openandroidinstaller.py'
		EOF
	) "${pkgdir}/usr/bin/${_pkgname}"
	
	install -Dm644 'flatpak/org.openandroidinstaller.OpenAndroidInstaller.desktop' -t "${pkgdir}/usr/share/applications"
	install -Dm644 'flatpak/org.openandroidinstaller.OpenAndroidInstaller.png' -t "${pkgdir}/usr/share/pixmaps"
}
