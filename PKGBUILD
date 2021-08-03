# Maintainer: samarthj <dev@samarthj.com>
# Contributor: Morten Linderud <morten@linderud.pw>

pkgname=buildah-git
_pkgname=buildah
pkgver=1.21.0.r175.gaff9f6be
pkgrel=1
pkgdesc="A tool which facilitates building OCI images (git)"
arch=('any')
depends=(crun skopeo slirp4netns)
makedepends=('go' 'go-md2man' 'git' 'bash-bats'
  'btrfs-progs' 'libassuan' 'bzip2'
  'go-md2man' 'runc' 'skopeo'
  'systemd' 'containers-common')
provides=("$_pkgname")
conflicts=("$_pkgname")
url="https://github.com/containers/$_pkgname.git"
license=(Apache)
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  ver=$(git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g')
  echo ${ver#v}
}

build() {
  export SECURITYTAGS='seccomp apparmor'
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath"

  cd $_pkgname
  make EXTRA_LDFLAGS='-s -w -linkmode=external'
}

package() {
  depends+=('libseccomp.so' 'libdevmapper.so' 'libgpgme.so')

  cd $_pkgname
  make install install.completions DESTDIR="$pkgdir" PREFIX=/usr
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
