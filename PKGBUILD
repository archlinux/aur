# Maintainer: Peter Smit <peter@smitmail.eu>
# Maintainer: Chris Werner Rau <aur@cwrau.io>

pkgname=nova
pkgver=3.6.0
pkgrel=0
pkgdesc='A cli tool to find outdated Helm charts running in your Kubernetes cluster'
arch=(x86_64)
url="https://github.com/FairwindsOps/$pkgname"
license=(Apache)
makedepends=(go)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
md5sums=('12ae25095d6e32de8277b773b23c64dc')

build() {
  cd nova-$pkgver

  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-extldflags \"${LDFLAGS}\"" \
    .
}

package() {
  # conflicts with python-novaclient otherwise
  install -Dm 755 $srcdir/nova-$pkgver/$pkgname $pkgdir/usr/bin/$pkgname-helm
  $pkgdir/usr/bin/$pkgname-helm completion zsh > $srcdir/zsh_$pkgname
  $pkgdir/usr/bin/$pkgname-helm completion bash > $srcdir/bash_$pkgname
  install -D -m 0644 $srcdir/zsh_$pkgname $pkgdir/usr/share/zsh/site-functions/_$pkgname
  install -D -m 0644 $srcdir/bash_$pkgname $pkgdir/usr/share/bash-completion/completions/$pkgname
  install -Dm 755 $srcdir/nova-$pkgver/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
