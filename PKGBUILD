# Maintainer: Alex Henrie <alexhenrie24@gmail.com>
pkgname=sbom-tool-git
pkgver=2.2.1.r0.848944d
pkgrel=1
pkgdesc='Tool to create SPDX 2.2 compatible SBOMs'
arch=('x86_64')
url='https://github.com/microsoft/sbom-tool'
license=('MIT')
makedepends=('dotnet-sdk')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=('!strip')
source=('git+https://github.com/microsoft/sbom-tool.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g;s/^v//')"
}

build() {
	cd "${pkgname%-git}"
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
	cd "${pkgname%-git}"
	install \
		-Dm755 \
		src/Microsoft.Sbom.Tool/bin/Release/net8.0/linux-x64/publish/Microsoft.Sbom.Tool \
		"$pkgdir/usr/bin/sbom-tool"
}
