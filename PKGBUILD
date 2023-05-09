# Maintainer: chappjc
pkgname=dcrdex
pkgver=0.6.1
pkgrel=1
pkgdesc="Self-custody multi-coin wallet with atomic swap capability, by Decred."
arch=('aarch64' 'armv7h' 'i686' 'x86_64')
makedepends=('git' 'go>=1.19')
groups=('decred')
url="https://dex.decred.org"
license=('custom:BlueOak-1.0.0')
options=('!strip' '!emptydirs')
source=("git+https://github.com/decred/$pkgname.git#tag=v$pkgver")
sha256sums=('SKIP')
#source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/decred/$pkgname/tar.gz/v0.6.1)
#source=($pkgname-$pkgver.tar.gz::https://api.github.com/repos/decred/dcrdex/tarball/v0.6.1)
#sha256sums=('f27bf92be2e4bcfe67f8a696fc89f2d15b7c04109cb160fb7ce6bcec1b983ab4')

build() {
  export CGO_ENABLED=0
  # NOTE: we could use a special GOPATH just for this, but we will use the
  # environment's instead since the modcache pushes 500 MB.
  #   export GOPATH="$srcdir"/gopath
  #   go clean -cache -modcache

  # cd "$pkgname-$pkgver"
  cd ${pkgname}
  mkdir -p build
  go build -trimpath -ldflags "-s -w" -o ./build/dexc ./client/cmd/dexc
  go build -trimpath -ldflags "-s -w" -o ./build/dexcctl ./client/cmd/dexcctl
  
  # If using local GOPATH, allow makepkg to delete srcdir:
  # chmod -R u+w,u+x $GOPATH
}

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm 644 LICENSE.md -t "$pkgdir/usr/share/licenses/dcrdex/LICENSE"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/dcrdex"
  install -Dm 755 ./build/dexc -t "$pkgdir/usr/bin"
  install -Dm 755 ./build/dexcctl -t "$pkgdir/usr/bin"
}
