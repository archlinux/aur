# Maintainer: Chris Snell <chris.snell@gmail.com>

pkgname=aws-iam-authenticator-git
_pkgname=aws-iam-authenticator
_githubpath=github.com/kubernetes-sigs/aws-iam-authenticator
pkgver=v0.4.0.r5.gc2d2884d
pkgrel=1
pkgdesc="A tool to use AWS IAM credentials to authenticate to a Kubernetes cluster"
arch=('x86_64' 'i686' 'arm')
url="https://github.com/kubernetes-sigs/aws-iam-authenticator"
options=('!strip')
license=('Apache')
makedepends=('go' 'git' 'dep')
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
  mkdir -p ${srcdir}/src/$_githubpath
  cd "$srcdir/$_pkgname"
  git --work-tree=${srcdir}/src/$_githubpath checkout -f master
  cd "$srcdir/src/$_githubpath"
  export GOPATH=${srcdir}
  echo "Fetching dependencies with dep... (this will take a while)"
  dep ensure
  cd cmd/aws-iam-authenticator
  go build
}

package() {
  cd "$srcdir/src/$_githubpath"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
  cd "cmd/$_pkgname"
  install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}

