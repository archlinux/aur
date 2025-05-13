# Maintainer: Alexander Egorov <egoroff[at]gmail[dot]com>

pkgbase=dotnet-sdk-8.0.300-bin
pkgname=(
	'aspnet-runtime-8.0.300-bin'
	'dotnet-runtime-8.0.300-bin'
	'dotnet-sdk-8.0.300-bin'
	'dotnet-targeting-pack-8.0.300-bin'
	'aspnet-targeting-pack-8.0.300-bin'
)
pkgver=8.0.6.sdk302
_runtimever=8.0.6
_sdkver=8.0.302
pkgrel=6
arch=('x86_64' 'armv7h' 'aarch64')
url='https://www.microsoft.com/net/core'
license=('MIT')
options=('staticlibs')
source_armv7h=('https://download.visualstudio.microsoft.com/download/pr/6a909983-cf0f-4b23-823d-8db56fdb344f/6455cb1f9a9a0eebc8fa541d08d7717c/dotnet-sdk-8.0.302-linux-arm.tar.gz')
source_aarch64=('https://download.visualstudio.microsoft.com/download/pr/ccc923ed-10de-4131-9c65-2a73f51185cb/3c04869af60dc562d81a673b2fb95515/dotnet-sdk-8.0.302-linux-arm64.tar.gz')
source_x86_64=('https://download.visualstudio.microsoft.com/download/pr/dd6ee0c0-6287-4fca-85d0-1023fc52444b/874148c23613c594fc8f711fc0330298/dotnet-sdk-8.0.302-linux-x64.tar.gz')
sha512sums_x86_64=('43d0ea1df12c15a0e47560d2a84857ab50eb04ac693ab41413c04c591719101c4c8165e052a42a66719c67bd07ac299ca47edbb4944a2901df765042e56b316f')
sha512sums_armv7h=('2758d4844986794b34bcb34f24a153cee47d73fb787702dc7b6727e8dbe1e8c1c9e6bb350bf990c974be46821bcbf85e116ff2007727e2c3dcfa010c6f4cd3e0')
sha512sums_aarch64=('a6432f93056d74a7dd666f0deda80c96e6dd6a5e6291f71a0128846df9dee5aa0016fc3bd39f34ce5a859bb82ea4e4302790a78ffc2d05216f07f9bf94440c40')

package_dotnet-runtime-8.0.300-bin() {
	pkgdesc='The .NET Core runtime (binary)'
	depends=(
		"dotnet-host>=${_runtimever}"
		'gcc-libs'
		'glibc'
		'icu'
		'libunwind'
		'zlib'
		'openssl'
	)
	optdepends=('lttng-ust: CoreCLR tracing')
	provides=("dotnet-runtime=${_runtimever}" "dotnet-runtime-8.0.300")
	conflicts=("dotnet-runtime=${_runtimever}" "dotnet-runtime-8.0.300")

	install -dm 755 "${pkgdir}"/usr/share/{dotnet/shared,licenses}
	cp -dr --no-preserve='ownership' shared/Microsoft.NETCore.App "${pkgdir}"/usr/share/dotnet/shared/
	ln -s dotnet-host-bin "${pkgdir}"/usr/share/licenses/dotnet-runtime-8.0.300-bin
}

package_aspnet-runtime-8.0.300-bin() {
	pkgdesc='The ASP.NET Core runtime (binary)'
	depends=('dotnet-runtime-8.0.300-bin')
	provides=("aspnet-runtime=${_runtimever}" "aspnet-runtime-8.0.300")
	conflicts=("aspnet-runtime=${_runtimever}" "aspnet-runtime-8.0.300")

	install -dm 755 "${pkgdir}"/usr/share/{dotnet/shared,licenses}
	cp -dr --no-preserve='ownership' shared/Microsoft.AspNetCore.App "${pkgdir}"/usr/share/dotnet/shared/
	ln -s dotnet-host-bin "${pkgdir}"/usr/share/licenses/aspnet-runtime-8.0.300-bin
}

package_dotnet-sdk-8.0.300-bin() {
	pkgdesc='The .NET Core SDK (binary)'
	depends=(
		'glibc'
		'gcc-libs'
		'dotnet-runtime-8.0.300-bin'
		'dotnet-targeting-pack-8.0.300-bin'
		'netstandard-targeting-pack-bin'
		'aspnet-runtime-bin'
		'aspnet-targeting-pack-bin'
	)
	provides=("dotnet-sdk=${pkgver}" "dotnet-sdk-8.0.300")
	conflicts=("dotnet-sdk=${pkgver}" "dotnet-sdk-8.0.300")

	install -dm 755 "${pkgdir}"/usr/share/{dotnet,licenses}
	cp -dr --no-preserve='ownership' sdk sdk-manifests "${pkgdir}"/usr/share/dotnet/
	ln -s dotnet-host-bin "${pkgdir}"/usr/share/licenses/dotnet-sdk-8.0.300-bin
}

package_dotnet-targeting-pack-8.0.300-bin() {
	pkgdesc='The .NET Core targeting pack (binary)'
	depends=(
		'netstandard-targeting-pack-bin'
	)
	provides=(dotnet-targeting-pack=${_runtimever} dotnet-targeting-pack-8.0.300)
	conflicts=(dotnet-targeting-pack=${_runtimever} dotnet-targeting-pack-8.0.300)

	if [ $CARCH = 'x86_64' ]; then
		msarch=x64
	elif [ $CARCH = 'armv7h' ]; then
		msarch=arm
	elif [ $CARCH = 'aarch64' ]; then msarch=arm64; fi

	install -dm 755 "${pkgdir}"/usr/share/{dotnet,dotnet/packs,licenses}
	cp -dr --no-preserve='ownership' packs/Microsoft.NETCore.App.{Host.linux-${msarch},Ref} "${pkgdir}"/usr/share/dotnet/packs/
	ln -s dotnet-host-bin "${pkgdir}"/usr/share/licenses/dotnet-targeting-pack-8.0.300-bin
}

package_aspnet-targeting-pack-8.0.300-bin() {
	pkgdesc='The ASP.NET Core targeting pack (binary)'
	depends=(
		'dotnet-targeting-pack-8.0.300-bin'
	)
	provides=(aspnet-targeting-pack=${_runtimever} aspnet-targeting-pack-8.0.300)
	conflicts=(aspnet-targeting-pack=${_runtimever} aspnet-targeting-pack-8.0.300)

	install -dm 755 "${pkgdir}"/usr/share/{dotnet,dotnet/packs,licenses}
	cp -dr --no-preserve='ownership' packs/Microsoft.AspNetCore.App.Ref "${pkgdir}"/usr/share/dotnet/packs/
	ln -s dotnet-host-bin "${pkgdir}"/usr/share/licenses/aspnet-targeting-pack-8.0.300-bin
}
