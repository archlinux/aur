# Maintainer: Elia Nitsche <nitscheelia at gmail dot com>

pkgname="p2r3-convert-git"
_pkgname=${pkgname%-git}
pkgver=0.0.0.r474.g6998584
pkgrel=1
pkgdesc="Truly universal file converter"
arch=("x86_64")
url="https://github.com/p2r3/convert"
license=("GPL-2.0-only")
depends=(
	'alsa-lib'
	'at-spi2-core'
	'cairo'
	'dbus'
	'expat'
	'glib2'
	'glibc'
	'gtk3'
	'libcups'
	'libgcc'
	'libx11'
	'libxcb'
	'libxcomposite'
	'libxdamage'
	'libxext'
	'libxfixes'
	'libxkbcommon'
	'libxrandr'
	'mesa'
	'nspr'
	'nss'
	'pango'
	'systemd-libs'
)
makedepends=("git" "bun" "chromium")
optdepends=()
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("${pkgname}::git+${url}")
sha512sums=("SKIP")

pkgver() {
	cd "${pkgname}"

	# does not work
	#git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'

	#_latest_tag=$(git tag --sort=-v:refname | head -n 1)
	#_commit_count=$(git rev-list ${_latest_tag}..HEAD --count)
	_latest_tag="0.0.0"
	_commit_count=$(git rev-list 02a4441..HEAD --count)	# count from the initial commit
	_commit_hash=$(git rev-parse --short=7 HEAD)
	echo "${_latest_tag}.r${_commit_count}.g${_commit_hash}" | sed 's/^v//'
}

prepare() {
	cd "${pkgname}"
	git submodule update --init --recursive
	export PUPPETEER_SKIP_DOWNLOAD=1
	bun install
}

build() {
	cd "${pkgname}"
	export PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium
	bun run desktop:dist:linux
}

# currently fails
#test() {
#	bun test
#}

package() {
	cd "${pkgname}"
	./release/Convert\ to\ it\!-0.0.0.AppImage --appimage-extract
	outputDir="./squashfs-root"

	install -dm755 "${pkgdir}/opt/${_pkgname}"
	cp -a ${outputDir}/* "${pkgdir}/opt/${_pkgname}/"

	install -dm755 "${pkgdir}/usr/bin"
	ln -s "/opt/${_pkgname}/AppRun" "${pkgdir}/usr/bin/${_pkgname}"
	
	# fix some weird permissions
	find "${pkgdir}/opt/${_pkgname}" -type d -exec chmod +xr {} \;
	find "${pkgdir}/opt/${_pkgname}" -type f -exec chmod +r {} \;

	# icons
	for size in 16 32 48 64 128 256; do
		install -Dm644 \
			"${outputDir}/usr/share/icons/hicolor/${size}x${size}/apps/${_pkgname}.png" \
			"${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/${_pkgname}.png"
	done

	install -Dm644 "./LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
