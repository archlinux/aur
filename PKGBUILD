# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=singlefileextractor-git
pkgver=r21.eadc323
pkgrel=1
pkgdesc=" A tool for extracting contents (assemblies, configuration, etc.) from a single-file dotnet application."
arch=('x86_64')
url="https://github.com/Droppers/SingleFileExtractor"
license=('MIT')
depends=('glibc' 'gcc-libs' 'zlib')
makedepends=('dotnet-sdk-6.0' 'git')
provides=(singlefileextractor)
conflicts=(singlefileextractor)
options=(!strip !debug)
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
	cd "$srcdir/$pkgname/src/SingleFileExtractor.CLI"
	dotnet publish -r linux-x64 --self-contained true -c Release -p:PublishSingleFile=true
}

package() {
	cd "$srcdir/$pkgname/src/SingleFileExtractor.CLI/bin/Release/net6.0/linux-x64/publish"
	install -Dm755 "SingleFileExtractor.CLI" "$pkgdir/usr/bin/${pkgname::-4}"
}
