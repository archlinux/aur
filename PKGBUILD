# Maintainer: Yuri Nogueira <yuri.nogueira@siteware.com.br>
# Contributor: Jamie Magee <jamie dot magee at gmail dot com>
_name=azure-functions-core-tools
_pkgname=${_name}-4
pkgname=${_pkgname}-bin
pkgver=4.16.1 # renovate: datasource=github-tags depName=Azure/azure-functions-core-tools
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
b2sums_x86_64=('9f909d77d090b36b625c3f137e4f2a9cba7446738927d06c5f7db8fd602ab85cd56547b3f7e49374e586efaf9d60d2a2c4f107994449abd6a8c6297c82bf43b1')
b2sums_aarch64=('e4bd5cf8531d63618e7ac850e824b1b460ce0210de445808938a7d167645b884bfc91daf05e49d3f77a4a58a6797c1d781c826da3f935089d687b1749e7d89cc')

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
