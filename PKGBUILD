# Mainter: PratyushKing <pratyushking02@gmail.com>
pkgname='cosmoscli-git'
_pkgname='cosmoscli'
pkgver='v1.3.1'
pkgrel=1
pkgdesc="Easier way to use the CosmosOS C# toolkit! (C# Open Source Managed Operating Systems)"
makedepends=("git" "make" "dotnet-sdk-6.0")
arch=('x86_64')
url="https://github.com/PratyushKing/cosmosCLI"
license=('GPL v3.0')
# These depends are for the cosmos toolkit.
depends=("xorriso" "yasm" "dotnet-sdk-6.0" "nuget")
source=('cosmosCLI::git://github.com/PratyushKing/cosmosCLI')
md5sums=('SKIP')

pkgver() {
	echo "v1.3.1" # the package version and program version are same
}

build() {
	cd "$_pkgname"
	make clean
	make exe

	# build the toolkit (not really install due to no binaries, it binds with nuget)
	mkdir -p /etc/CosmosCLI/CosmosToolkit
	cp CustomCosmosMakefile/Makefile /etc/CosmosCLI/CosmosToolkit/
	cd /etc/CosmosCLI/CosmosToolkit
	git clone https://github.com/CosmosOS/Cosmos --depth 1
	git clone https://github.com/CosmosOS/IL2CPU --depth 1
	git clone https://github.com/CosmosOS/XSharp --depth 1
	git clone https://github.com/CosmosOS/Common --depth 1
	mv Makefile Cosmos/Makefile
	cd Cosmos
	make
}

package() {
	cd "$_pkgname"
	cp cosmos /usr/bin/cosmos
	mkdir -p /etc/CosmosCLI
	cp RequiredFiles/* /etc/CosmosCLI/
	sudo cosmos --setup

	echo "PLEASE NOTE: Install VMWare Player from the AUR for auto-run vmware profiles."
}
