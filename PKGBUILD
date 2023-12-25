# Maintainer: Nikos Toutountzoglou <nikos.toutou@protonmail.com>

pkgname=thor-flash-utility
pkgver=1.0.4
pkgrel=3
_pkgname="Thor-${pkgver}"
_exe="TheAirBlow.Thor.Shell"
pkgdesc="Thor Flash Utility (Developed with C#, based on dotnet 7.0)"
arch=('any')
url="https://github.com/Samsung-Loki/Thor"
license=('MPL2')
depends=('dotnet-runtime-7.0')
makedepends=('dotnet-sdk-7.0')
optdepends=('android-udev: Adds udev rules for non-root users (Group adbusers)')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Samsung-Loki/Thor/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('7c6a5482a2a6a0af2711849441f8a8227bca240e38ab56ba9a50ed6eb13ed78e')

build() {
	# https://learn.microsoft.com/en-us/dotnet/core/tools/#cli-commands
	# Add needed Nuget packages for building
	_NuPkgs=(
	"K4os.Compression.LZ4.Streams"
	"Serilog"
	"Serilog.Exceptions"
	"Serilog.Sinks.Console"
	"SharpCompress"
	"Spectre.Console"
	)
	_NuVers=(
	"1.3.5"
	"3.0.0-dev-02022"
	"8.4.0"
	"4.1.1-dev-00910"
	"0.33.0"
	"0.47.1-preview.0.8"
	)

	for i in "${!_NuPkgs[@]}"; do
		dotnet add ${_pkgname}/TheAirBlow.Thor.Library/TheAirBlow.Thor.Library.csproj \
		package ${_NuPkgs[$i]} -v ${_NuVers[$i]} \
		--package-directory NuGet
	done

	# Build Visual Studio solution
	dotnet build ${_pkgname}/Thor.sln \
		--source NuGet \
		--configuration Release \
		--output build

	# https://learn.microsoft.com/en-us/nuget/consume-packages/managing-the-global-packages-and-cache-folders
	# Cleanup NuGet global-packages (optional)
	#dotnet nuget locals all --clear
}

package() {
	# Install package
	install -d "$pkgdir"/opt/$pkgname "$pkgdir"/usr/bin
	cp -a --no-preserve=ownership build/* "$pkgdir"/opt/$pkgname
	find "$pkgdir" -name *.pdb -delete
	# Install executable shell file
	ln -s /opt/$pkgname/${_exe} "$pkgdir"/usr/bin/$pkgname
	# Install license
	install -Dm644 ${_pkgname}/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
