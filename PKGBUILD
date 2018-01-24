# Maintainer: Konrad Tegtmeier <konrad.tegtmeier+aur@gmail.com>

pkgname='hcloud'
pkgver='1.2.0'
pkgrel='1'
pkgdesc="CLI for Hetzner Cloud"
arch=('x86_64')
url='https://github.com/hetznercloud/cli'
license=('MIT')
makedepends=('go' 'git')
provides=('hcloud')
source=("$pkgname-$pkgver.tar.gz::https://github.com/hetznercloud/cli/archive/v${pkgver}.tar.gz")
sha256sums=('92b00d393e6029fc25fff93d74166c96c0b16aff963355d7ec2a26108e48427a')
_gourl='github.com/hetznercloud/cli'

prepare()
{
  rm -rf src
  mv cli-$pkgver/vendor src
  mv cli-$pkgver "src/${_gourl}"
}

build()
{
  GOPATH="$srcdir" go build \
    -ldflags "-w -X ${_gourl}.Version=${pkgver}" \
    "${_gourl}/cmd/hcloud"
}

check()
{
  GOPATH="$srcdir" go test -v -x "${_gourl}"
}

package()
{
  install -Dsm755 $pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "src/${_gourl}/LICENSE" \
          "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
