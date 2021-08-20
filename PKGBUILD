# Maintainer:
# Contributor: FabioLolix
# Contributor: micwoj92
# Contributor: Chris Snell <chris.snell@gmail.com>

pkgname=aws-iam-authenticator-git
_pkgname=aws-iam-authenticator
pkgver=0.5.3.r16.g375e2c90
pkgrel=1
pkgdesc='A tool to use AWS IAM credentials to authenticate to a Kubernetes cluster'
arch=('x86_64' 'aarch64')
url='https://github.com/kubernetes-sigs/aws-iam-authenticator'
license=('Apache')
makedepends=('go' git)
conflicts=('aws-iam-authenticator')
provides=('aws-iam-authenticator')
source=('git+https://github.com/kubernetes-sigs/aws-iam-authenticator.git')
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"

  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
    ./cmd/aws-iam-authenticator
}

package() {
  install -Dm 755 "$srcdir/$_pkgname/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
