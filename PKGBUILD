# Maintainer: Cedric Girard <cgirard [dot] archlinux [at] valinor [dot] fr>

pkgname=hypershift-git
pkgver=r3267.b9f9d94
pkgrel=1
pkgdesc="Hyperscale OpenShift - clusters with hosted control planes - CLI"
arch=('x86_64')
url="https://hypershift-docs.netlify.app/"
license=('Apache')
makedepends=('go' 'git')
provides=('hypershift')
conflicts=('hypershift')
source=("git+https://github.com/openshift/hypershift.git")
sha256sums=('SKIP')

pkgver() {
  cd "hypershift"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "$srcdir"/hypershift
  mkdir -p build/
}

build(){
  cd "$srcdir"/hypershift
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  export GOTMPDIR="${srcdir}"

  go build -o build/hypershift .
}


package() {
  cd "$srcdir"/hypershift
  install -Dm755 build/hypershift "${pkgdir}"/usr/bin/hypershift
}
