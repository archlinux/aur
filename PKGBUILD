# Maintainer: David Parrish <daveparrish@tutanota.com>
# URL: https://github.com/lightningnetwork/lnd
# Upstream: https://github.com/lightningnetwork/lnd

#shellcheck disable=SC2034

pkgname='lnd'
pkgver=0.14.1_beta
_pkgver="${pkgver//_/-}"
pkgrel=1
pkgdesc='The Lightning Network Daemon, for secure off-chain bitcoin transactions.'
arch=('i686' 'x86_64')
url='https://github.com/lightningnetwork/lnd'
license=('MIT')
depends=('glibc')
makedepends=('go')
provides=('lnd' 'lncli')
conflicts=('lnd-git')
source_x86_64=("$pkgname-$pkgver.tar.gz::https://github.com/lightningnetwork/lnd/archive/v${_pkgver}.tar.gz")
sha512sums_x86_64=('b5eeb0f1dfa184d2d7f3fa40549926162f1ffcd0078be308a3a476689a31dfa3b4fadd7b5bfe8f01624461132b9d70e86c7d1b58bd581eba78fef6718b994af4')

# create a fake go path directory and pushd into it
# $1 real directory
# $2 gopath directory
_fake_gopath_pushd() {
    mkdir -p "$GOPATH/src/${2%/*}"
    rm -f "$GOPATH/src/$2"
    ln -rsT "$1" "$GOPATH/src/$2"
    pushd "$GOPATH/src/$2" >/dev/null || exit
}

_fake_gopath_popd() {
    popd >/dev/null || exit
}

prepare() {
  # Create GOPATH
  mkdir -p "${srcdir:?}/GOPATH"
  mv "$srcdir/$pkgname-$_pkgver" "$srcdir/lnd"
}

build() {
  # Use suggested GOFLAGS for Arch Linux.
  # https://wiki.archlinux.org/title/Go_package_guidelines
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  export GOPATH="$srcdir/GOPATH"
  _fake_gopath_pushd "$pkgname" github.com/lightningnetwork/lnd
  make && make install
  _fake_gopath_popd
}

package() {
  for _bin in lnd lncli; do
    install -Dm 755 "$srcdir/GOPATH/bin/$_bin" -t "${pkgdir:?}/usr/bin";
  done

  install -D -m644 "$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
