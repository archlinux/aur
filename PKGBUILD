# Maintainer: a13xie <rostik.medved@gmail.com>
pkgbase=flamenco
pkgname=('flamenco-manager' 'flamenco-worker')
pkgver=3.2
pkgrel=1
pkgdesc="Flamenco render farm manager"
arch=('x86_64' 'aarch64')
url="https://projects.blender.org/studio/flamenco"
options=(!lto)
license=('GPL3')
depends=(
	'ffmpeg'
)
makedepends=(
	'npm'
	'go'
	'yarn'
)
source=(
		"${pkgbase}::git+https://projects.blender.org/studio/flamenco.git#tag=v${pkgver}"
		"placeholder.sh"
)
sha256sums=('SKIP'
            '286ee94a44bf49b4d1787d91a0e0bd03451ec59dfbb48c28bd2a33c997a89916')

build () {
	export GOPATH="$srcdir"/gopath
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export CGO_ENABLED=1
	build_flamenco-manager
	build_flamenco-worker
}

build_flamenco-manager() {
	if [ "$CARCH" = "aarch64" ]
	then
		cp "$srcdir/placeholder.sh" "$srcdir/$pkgbase/flamenco-manager"
	else
		cd "$srcdir/$pkgbase/web/app"
		npm install

		cd "$srcdir/$pkgbase"
		make flamenco-manager
	fi
}

build_flamenco-worker() {
	cd "$srcdir/$pkgbase"
	make flamenco-worker
}

package_flamenco-manager() {
optdepends=(
		'blender: for the initial setup'
)
	install "$srcdir/$pkgbase/flamenco-manager" -Dt "$pkgdir/usr/bin"
}

package_flamenco-worker() {
pkgdesc="Worker for the Flamenco render farm system"
optdepends=(
		'blender: for rendering projects'
)
	install "$srcdir/$pkgbase/flamenco-worker" -Dt "$pkgdir/usr/bin"
}
