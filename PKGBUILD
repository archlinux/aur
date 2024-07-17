# Maintainer: k8ie <k8ie@firemail.cc>
pkgbase=flamenco
pkgname=('flamenco-manager' 'flamenco-worker')
pkgver=3.5
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
)
sha256sums=('87b2ef8c51c66a4ab9d7238e74434aa8c982b07a8811a27c7d244178a4cbf0ce')

build () {
  export GOPATH="$srcdir"/gopath
  export LDFLAGS=""
  build_flamenco-manager
  build_flamenco-worker
}

build_flamenco-manager() {
  cd "$srcdir/$pkgbase/web/app"
  npm install

  cd "$srcdir/$pkgbase"
  make flamenco-manager
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
