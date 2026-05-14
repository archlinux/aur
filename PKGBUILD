# Maintainer: bemxio <bemxiov at protonmail dot com>

pkgname="avalonia86"
pkgdesc="A cross-platform configuration manager for the 86Box emulator"

pkgver=1.5.0
pkgrel=1

arch=(aarch64 x86_64)

url="https://github.com/notBald/Avalonia86"
license=(MIT)

depends=(dotnet-runtime)
makedepends=('dotnet-sdk>=10.0' gendesk)
optdepends=('86box>=2.0: emulator used with this configuration manager')

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=(20dd20b39247caf9e776727c432dedf7)

prepare() {
	# move to source directory
	cd "Avalonia86-${pkgver}"

	# generate desktop entry file
	gendesk -f -n \
		--pkgname 'Avalonia 86' \
		--pkgdesc "${pkgdesc}" \
		--exec "${pkgname}" \
		--icon "${pkgname}.svg" \
		--categories 'System;Emulator'
}

build() {
	# move to source directory
	cd "Avalonia86-${pkgver}"

	# set correct runtime identifier
	case "${CARCH}" in
		aarch64) RID='linux-arm64' ;;
		x86_64) RID='linux-x64' ;;
		*) echo "Unsupported architecture: ${CARCH}" && exit 1 ;;
	esac

	# build project
	dotnet publish Avalonia86 -r "${RID}" -f net10.0 -c Release -o bin
}

package() {
	# move to build directory
	cd "Avalonia86-${pkgver}/bin"

	# copy built files to package directory
	find . -type f \
		-not -name '*.pdb' \
		-exec install -Dm644 {} "${pkgdir}/usr/share/${pkgname}/{}" \;

	# set executable permissions for main executable
	chmod +x "${pkgdir}/usr/share/${pkgname}/Avalonia86"

	# create symlink for executable
	mkdir -p "${pkgdir}/usr/bin" && ln -s "/usr/share/${pkgname}/Avalonia86" "${pkgdir}/usr/bin/${pkgname}"

	# copy desktop entry and icon
	install -Dm644 ../'Avalonia 86.desktop' "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	install -Dm644 Resources/86Box-gray.svg "${pkgdir}/usr/share/pixmaps/${pkgname}.svg"

	# copy license file
	install -Dm644 Resources/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}