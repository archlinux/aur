# Maintainer: Eslam Allam eslamallam73@gmail.com
basename=deskreen-ce
pkgname=${basename}-git
conflicts=('deskreen' 'deskreen-ce')
pkgver=1.0.0
pkgrel=1
pkgdesc="Screen sharing and present screen: Turn any device into a secondary screen for your computer"
arch=('x86_64')
url="https://github.com/pavlobu/deskreen"
license=('AGPL-3.0') # Change as needed
makedepends=('pnpm' 'fuse2')
depends=() # List dependencies
source=("${basename}::git+https://github.com/pavlobu/deskreen.git")
sha256sums=('SKIP')

build() {
	cd "$basename" || exit 1
	echo "Installing dependencies..."
	pnpm i

	echo "Installing client-viewer dependencies..."
	cd src/client-viewer && pnpm i && cd ../..

	echo "Cleaning Dist Dir..."
	pnpm clean

	echo "Building Linux"
	pnpm build:linux
}
package() {
	set -euo pipefail
	bsdtar -xOf "$srcdir/${basename}/dist/${basename}"_*_amd64.deb data.tar.xz | bsdtar -C "$pkgdir" -xv
}
