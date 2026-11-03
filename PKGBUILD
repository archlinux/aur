# Maintainer: Yuri Nogueira <yuri.nogueira@siteware.com.br>
# Contributor: Jamie Magee <jamie dot magee at gmail dot com>
_name=azure-functions-core-tools
_pkgname=${_name}-4
pkgname=${_pkgname}-bin
pkgver=4.15.2 # renovate: datasource=github-tags depName=Azure/azure-functions-core-tools
pkgrel=1
pkgdesc="Command line tools for Azure Functions (v4)"
arch=('x86_64' 'aarch64')
url="https://github.com/Azure/${_name}"
license=('MIT')
depends=('gcc-libs' 'glibc' 'icu' 'openssl' 'zlib')
optdepends=('dotnet-runtime: to install extensions and run .NET functions')
provides=("${_name}" "${_pkgname}")
conflicts=("${_name}" "${_name}-bin" "${_pkgname}")
options=('!strip' 'staticlibs')
source_x86_64=("https://github.com/Azure/${_name}/releases/download/${pkgver}/Azure.Functions.Cli.linux-x64.${pkgver}.zip")
source_aarch64=("https://github.com/Azure/${_name}/releases/download/${pkgver}/Azure.Functions.Cli.linux-arm64.${pkgver}.zip")
b2sums_x86_64=('8815bcdc177a9bc237a26d97c720caff3dd7205e9e569299872250388db809b9a8fc30ab72198897eec868b43afbbf883635038476505596c4c19f2960e920df')
b2sums_aarch64=('38cae62d7009608147915832960d3b587745683ba952a1211ccb720e8e978a92bf7f3e44adb9809bdf906a33c63556d215e9a3ee0fb5c37bc31e73c355581159')

package() {
	install -dm 755 "${pkgdir}/usr/lib/${_pkgname}"

	# Copy extracted files while excluding the source zip symlink
	find "${srcdir}" -mindepth 1 -maxdepth 1 ! -name "*.zip" -exec cp -r {} "${pkgdir}/usr/lib/${_pkgname}/" \;

	# Ensure executable permissions on main and nested binaries
	for _bin in func gozip in-proc6/func in-proc8/func; do
		if [[ -f "${pkgdir}/usr/lib/${_pkgname}/${_bin}" ]]; then
			chmod 755 "${pkgdir}/usr/lib/${_pkgname}/${_bin}"
		fi
	done

	# Compatibility symlink for tools expecting the unversioned path
	ln -s "/usr/lib/${_pkgname}" "${pkgdir}/usr/lib/${_name}"

	# Main executable symlink in /usr/bin
	install -dm 755 "${pkgdir}/usr/bin"
	ln -s "/usr/lib/${_pkgname}/func" "${pkgdir}/usr/bin/func"
}
