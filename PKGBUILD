# Maintainer: Morten Linderud <morten@linderud.pw>

pkgname=buildah-git
_pkgname=buildah
pkgver=r233.21b1a93
pkgrel=1
pkgdesc="A tool which facilitates building OCI images"
arch=('x86_64' 'i686')
url="https://github.com/projectatomic/buildah"
license=('Apache-2.0')
makedepends=('go' 'git' 'bash-bats' 
             'btrfs-progs' 'device-mapper' 
             'gpgme' 'libassuan' 'bzip2' 
             'go-md2man' 'runc' 'skopeo')
source=("git://github.com/projectatomic/buildah.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  rm -rf "${srcdir}/src"
  mkdir -p "$srcdir"/src/github.com/projectatomic
  ln -sf "$srcdir/$_pkgname" "$srcdir"/src/github.com/projectatomic/buildah
}

build() {
  export GOPATH="${srcdir}"
  cd "$GOPATH"/src/github.com/projectatomic/buildah
  make PREFIX=/usr
}

package() {
  cd "${_pkgname}"
  make -C "$srcdir/$_pkgname" DESTDIR="$pkgdir" PREFIX=usr install
  # install -Dm755 "${_pkgname}" "$pkgdir/usr/bin/${_pkgname}"
  # install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
