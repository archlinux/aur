# Maintainer: Yuri Nogueira <yuri.nogueira@siteware.com.br>
# Contributor: Jamie Magee <jamie dot magee at gmail dot com>
_name=azure-functions-core-tools
_pkgname=${_name}-4
pkgname=${_pkgname}-bin
pkgver=4.17.0 # renovate: datasource=github-tags depName=Azure/azure-functions-core-tools
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
b2sums_x86_64=('26d71ff1d51a277752dfb6d9fe67d9542c3c9b2b45a088282d41e23efae6d68fb14f1321dbe5e7d44e2477382737e35a2a46526a42cc578b699ae3b71b95c455')
b2sums_aarch64=('fc8e4623d7e7632cbe93baddcd14e8b6e09a99198fcdc85aa331552c2a209b0cec0669b9cbfd52170c1476631ab48939564cbfb5bcdd8642031dae48274d4c87')

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
