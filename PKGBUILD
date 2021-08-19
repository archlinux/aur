# Contributor: Chris Snell <chris.snell@gmail.com>

pkgname=aws-iam-authenticator-git
_pkgname=aws-iam-authenticator
pkgver=v0.5.3.r16.g375e2c90
pkgrel=1
pkgdesc='A tool to use AWS IAM credentials to authenticate to a Kubernetes cluster'
arch=('x86_64' 'aarch64')
url='https://github.com/kubernetes-sigs/aws-iam-authenticator'
license=('Apache')
makedepends=('go')
conflicts=('aws-iam-authenticator')
provides=('aws-iam-authenticator')
source=('git+https://github.com/kubernetes-sigs/aws-iam-authenticator.git')
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$srcdir/$_pkgname"
  go build \
    --trimpath \
    --ldflags "-X main.version=$pkgver" \
    ./cmd/aws-iam-authenticator
}

package() {
  install -Dm 755 "$srcdir/$_pkgname/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
