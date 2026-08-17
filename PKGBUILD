# Maintainer: Alex Henrie <alexhenrie24@gmail.com>
pkgname=sbom-tool
pkgver=4.1.5
pkgrel=1
pkgdesc='Tool to create SPDX 2.2 compatible SBOMs'
arch=('x86_64')
url='https://github.com/microsoft/sbom-tool'
license=('MIT')
makedepends=('dotnet-sdk')
options=('!strip')
source=("https://github.com/microsoft/sbom-tool/archive/refs/tags/v$pkgver.tar.gz"
        "https://github.com/microsoft/sbom-tool/pull/1457.diff")
sha256sums=('512d884ce8689026f45b54a1c2a242e66f7d570e7d9a1a590d88733cc3e1a108'
            'c2682da7871ac2a11cd0d9841c7ad72fe1de093c6182385c3cad2362fbd3ee00')

build() {
	cd "$pkgname-$pkgver"
	patch -p1 < "$srcdir/1457.diff"
	dotnet publish \
		--runtime linux-x64 \
		--self-contained true \
		-p:DebugType=None \
		-p:DebugSymbols=false \
		-p:PublishSingleFile=true \
		-p:IncludeAllContentForSelfExtract=true \
		--framework net8.0 \
		src/Microsoft.Sbom.Tool
}

package() {
	cd "$pkgname-$pkgver"
	install \
		-Dm755 \
		src/Microsoft.Sbom.Tool/bin/Release/net8.0/linux-x64/publish/Microsoft.Sbom.Tool \
		"$pkgdir/usr/bin/sbom-tool"
}
