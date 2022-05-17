pkgname=podman-remote
pkgver=4.1.0
pkgrel=1
conflicts=('podman')
provides=('podman')
pkgdesc='Remote client for managing podman containers.'
arch=(x86_64)
url='https://github.com/containers/podman'
license=(Apache)
makedepends=(go go-md2man git)
source=("git+$url#tag=v$pkgver?signed")
validpgpkeys=('B7DBDCA456F7335E91F1C25CD3624C551D0515C4'
              '7CE1E6F8C90CB53E7E4D8F2D502E08DB0BBF8EEE')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/podman"
  git describe --tags | sed 's/^v//;s/-/+/g'
}

build() {
  # NOTE: the BUILDTAGS may change over time
  export BUILDTAGS='apparmor seccomp systemd'
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath"

  cd $srcdir/podman
  make podman-remote BINSFX="" EXTRA_LDFLAGS='-s -w -linkmode=external'
}

package() {
  optdepends=('podman-docker: for Docker-compatible CLI')

  cd $srcdir/podman

  make install.remote install.completions BINSFX="" DESTDIR="$pkgdir" PREFIX=/usr
  # remove man pages provided by containers-common
  rm -rvf "${pkgdir}/usr/share/man/man5"
}
