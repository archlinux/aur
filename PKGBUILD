# Maintainer: Morten Linderud <morten@linderud.pw>

pkgname=buildah-git
_pkgname=buildah
pkgver=r1330.391a5bea
pkgrel=1
pkgdesc="A tool which facilitates building OCI images"
arch=('x86_64' 'i686')
url="https://github.com/containers/buildah"
license=('Apache')
makedepends=('go' 'git' 'bash-bats' 
             'btrfs-progs' 'device-mapper' 
             'gpgme' 'libassuan' 'bzip2' 
             'go-md2man' 'runc' 'skopeo'
             'libselinux')
provides=("buildah")
conflicts=("buildah")
source=("git://github.com/containers/buildah.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  rm -rf "${srcdir}/src"
  mkdir -p "${srcdir}"/src/github.com/containers
  ln -sf "${srcdir}/${_pkgname}" "${srcdir}/src/github.com/containers/buildah"
}

build() {
  export GOPATH="${srcdir}"
  cd "${GOPATH}/src/github.com/containers/buildah"
  make PREFIX=/usr
}

package() {
  cd "${_pkgname}"
  make -C "${srcdir}/${_pkgname}" DESTDIR="$pkgdir" PREFIX=usr install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
