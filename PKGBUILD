# Contributor: Morten Linderud <foxboron@archlinux.org>
# Contributor: Frederik Schwan <freswa at archlinux dot org>
# Contributor: Sébastien "Seblu" Luttringer
# Contributor: Etienne Brodu<aur.archlinux ат etnbrd.com>
# Contributor: Quey-Liang Kao<s101062801 ат m101.nthu.edu.tw>
# Contributor: Iwan Timmer <irtimmer ат gmail.com>

pkgname=runc-git
pkgver=1.4.0rc.1.r40.g80486a207
pkgrel=1
pkgdesc="CLI tool for managing OCI compliant containers"
arch=('x86_64')
url="https://runc.io/"
license=('Apache-2.0')
depends=('libseccomp')
makedepends=('git' 'go' 'go-md2man')
optdepends=(
  'criu: checkpoint support'
)
provides=('runc' 'oci-runtime')
conflicts=('runc')
options=('!lto')
source=("git+https://github.com/opencontainers/runc")
sha256sums=('SKIP')

pkgver() {
  cd runc
  git describe --long --tags | sed -r 's/^v//;s/-rc/rc/;s/-([0-9]+)-g/.r\1.g/;s/-/./g'
}

prepare() {
  cd runc
  git worktree add ../src/github.com/opencontainers/runc HEAD
}

build() {
  cd src/github.com/opencontainers/runc
  export GOPATH="$srcdir"
  export BUILDTAGS='seccomp apparmor'
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-trimpath -mod=readonly -modcacherw"
  make runc man
}

package() {
  cd src/github.com/opencontainers/runc
  install -Dm755 runc "$pkgdir/usr/bin/runc"
  install -Dm644 contrib/completions/bash/runc \
    "$pkgdir/usr/share/bash-completion/completions/runc"

  install -d "$pkgdir/usr/share/man/man8"
  install -m644 man/man8/*.8 "$pkgdir/usr/share/man/man8"
}

# vim: set ts=2 sw=2 et:
