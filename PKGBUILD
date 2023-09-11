# Maintainer: Nikos Toutountzoglou <nikos.toutou@protonmail.com>

pkgname=syndical
pkgver=1.0.1
pkgrel=1
_pkgname="Syndical-${pkgver}"
_exe="Syndical.Application"
pkgdesc="An alternative to SamLoader - cleaner code, easier to understand and tamper with."
arch=('any')
url="https://github.com/Samsung-Loki/Syndical"
license=('MPL2')
depends=('dotnet-runtime-5.0' 'openssl-1.1')
makedepends=('dotnet-sdk-5.0')
optdepends=('android-udev: Adds udev rules for non-root users (Group adbusers)')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Samsung-Loki/Syndical/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('0f43a8a6013169eed41cfe58b5b05c93d941e4afc47f693e0af8cd2a04350ece')

build() {
	cd "$srcdir"

	# https://learn.microsoft.com/en-us/dotnet/core/tools/#cli-commands
	# Add needed Nuget packages for building
	_NuPkgs=(
	"BouncyCastle.NetCore"
	"CommandLineParser"
	"Serilog"
	"Serilog.Exceptions"
	"Serilog.Sinks.Console"
	"Spectre.Console"
	)
	_NuVers=(
	"1.8.10"
	"2.8.0"
	"2.10.0"
	"8.0.0"
	"4.0.1"
	"0.42.0"
	)

	for i in "${!_NuPkgs[@]}"; do
		dotnet add ${_pkgname}/${_exe}/${_exe}.csproj \
		package ${_NuPkgs[$i]} -v ${_NuVers[$i]} \
		--package-directory NuGet
	done

	# Build Visual Studio solution
	dotnet build ${_pkgname}/Syndical.sln \
		--source NuGet \
		--configuration Release \
		--output build

	# https://learn.microsoft.com/en-us/nuget/consume-packages/managing-the-global-packages-and-cache-folders
	# Cleanup NuGet global-packages (optional)
	#dotnet nuget locals all --clear
}

package() {
	cd "$srcdir"

	# Install package
	install -d "$pkgdir"/opt/$pkgname
	cp -dr --no-preserve=ownership build/* "$pkgdir"/opt/$pkgname
	find "$pkgdir" -name *.pdb -delete
	# Install executable shell file
	install -Dm0755 /dev/stdin "$pkgdir"/usr/bin/${_exe} << EOF
#!/bin/bash
dotnet /opt/syndical/Syndical.Application.dll "\$@"
EOF
	# Install license
	install -Dm644 ${_pkgname}/LICENCE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
