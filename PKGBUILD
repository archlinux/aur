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
	'go'
	'yarn'
)
optdepends=(
	    'blender: for rendering projects'
)
source=("${pkgbase}::git+https://projects.blender.org/studio/flamenco.git#tag=v${pkgver}")
sha256sums=('SKIP')

build () {
	build_flamenco-manager
	build_flamenco-worker
}

build_flamenco-manager() {
  cd "$srcdir/$pkgbase/web/app"
  npm install
  export GOPATH="$srcdir"/gopath
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_ENABLED=1

  cd "$srcdir/$pkgbase"
  make flamenco-manager
}

build_flamenco-worker() {
  export GOPATH="$srcdir"/gopath
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_ENABLED=1

  cd "$srcdir/$pkgbase"
  make flamenco-worker
}

package_flamenco-manager() {
  install "$srcdir/$pkgbase/flamenco-manager" -Dt "$pkgdir/usr/bin"
}

package_flamenco-worker() {
pkgdesc="Worker for the Flamenco render farm system"
  install "$srcdir/$pkgbase/flamenco-worker" -Dt "$pkgdir/usr/bin"
}
