# Maintainer: Yuri Nogueira <yuri.nogueira@siteware.com.br>
# Contributor: Jamie Magee <jamie dot magee at gmail dot com>
_name=azure-functions-core-tools
_pkgname=${_name}-4
pkgname=${_pkgname}-bin
pkgver=4.16.0 # renovate: datasource=github-tags depName=Azure/azure-functions-core-tools
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
b2sums_x86_64=('a62b49688dd85eff1193d41e70ade871c10fab56c1ba527a5ca4ff339a14dba2227c1e06b63e69e9f334c27974e9743c2596b8eca73ed04bec7ec6ee4567366d')
b2sums_aarch64=('e549e5ad5cc4ab07a3166eb2e299e0473bab1dbd13899c3cd85dccfb1cbf446aad6e8b8051208e898976d5d4977592abb1da0109c4895e39028de55060c375ef')

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
