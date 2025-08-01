# Maintainer: bemxio <bemxiov at protonmail dot com>

pkgname="avalonia86"
pkgdesc="A cross-platform configuration manager for the 86Box emulator"

pkgver=1.3.5
pkgrel=1

arch=(aarch64 x86_64)

url="https://github.com/notBald/Avalonia86"
license=(MIT)

depends=('dotnet-runtime>=9.0')
makedepends=('dotnet-sdk>=9.0' gendesk)
optdepends=('86box>=2.0: emulator used with this configuration manager')

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=(ef86d70d90e8562620005ea34869cb8b)

prepare() {
	# move to the source directory
	cd "Avalonia86-${pkgver}"

	# rename the API directory to match the expected name
	mv Avalonia86.Api Avalonia86.API

	# generate a desktop entry file
	gendesk -f -n \
		--pkgname 'Avalonia 86' \
		--pkgdesc "${pkgdesc}" \
		--exec "${pkgname}" \
		--icon "${pkgname}.svg" \
		--categories Utility
}

build() {
	# move to the source directory
	cd "Avalonia86-${pkgver}"

	# set the correct runtime identifier
	case "${CARCH}" in
		aarch64) RID='linux-arm64' ;;
		x86_64) RID='linux-x64' ;;
		*) echo "Unsupported architecture: ${CARCH}" && exit 1 ;;
	esac

	# build the project
	dotnet publish Avalonia86.sln --configuration Release --runtime "${RID}" --output bin
}

package() {
	# move to the build directory
	cd "Avalonia86-${pkgver}/bin"

	# copy the built files to the package directory
	find . -type f \
		-not -name '*.pdb' \
		-exec install -Dm644 {} "${pkgdir}/usr/share/${pkgname}/{}" \;

	# set executable permissions for the main executable
	chmod +x "${pkgdir}/usr/share/${pkgname}/Avalonia86"

	# create a symlink for the executable
	mkdir -p "${pkgdir}/usr/bin" && ln -s "/usr/share/${pkgname}/Avalonia86" "${pkgdir}/usr/bin/${pkgname}"

	# copy the desktop entry and icon
	install -Dm644 ../'Avalonia 86.desktop' "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	install -Dm644 Resources/86Box-gray.svg "${pkgdir}/usr/share/pixmaps/${pkgname}.svg"

	# copy the license file
	install -Dm644 Resources/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}