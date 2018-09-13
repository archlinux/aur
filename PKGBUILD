# Maintainer: Lukas Zimmermann <luk.zim91 at gmail dot com> 

pkgname=docker-ls
pkgver=0.3.1
pkgrel=1
pkgdesc='Tools for browsing and manipulating docker registries'
url='https://github.com/mayflower/docker-ls'
license=('MIT')
arch=('x86_64')
makedepends=('fakeroot' 'git' 'gcc' 'go')
options=('strip' '!staticlibs' '!emptydirs')
changelog=ChangeLog

source=("https://github.com/mayflower/${pkgname}/archive/v${pkgver}.tar.gz"
        'LICENSE')
sha256sums=('da40737b5e8bb5c1d4ee14c90ffa419ac7f9e7687618fe4dc020e786f61ea88a'
            '36f5440582577e61065f48b6fc26e2dd563ef2eb11a04255fed3bf47d138ca9e')

# Custom variables
_os=linux
_arch=amd64
_release=release

build() {
  # Remove GOPATH  
  rm -rf "${srcdir}/go" && mkdir -p "${srcdir}/go"  

  # Get all the dependencies for the command line tools
  cd "${srcdir}/${pkgname}-${pkgver}/cli/docker-ls"
  GOPATH="${srcdir}/go" go get -v -t -d
  cd "${srcdir}/${pkgname}-${pkgver}/cli/docker-rm"
  GOPATH="${srcdir}/go" go get -v -t -d

  # Test and build the necessary library
  cd "${srcdir}/${pkgname}-${pkgver}"
  rm -rf "${_release}" && mkdir -p "${_release}/${_os}_${_arch}"
  GOPATH="${srcdir}/go" go test github.com/mayflower/docker-ls/lib/...
  GOPATH="${srcdir}/go" go generate github.com/mayflower/docker-ls/lib/...

  # Build the executables for the AMD64 platform
  GOPATH="${srcdir}/go" CGO_ENABLED=0 GOOS="${_os}" GOARM=5 GOARCH="${_arch}" go build -o "${_release}/${_os}_${_arch}/docker-ls" github.com/mayflower/docker-ls/cli/docker-ls
  GOPATH="${srcdir}/go" CGO_ENABLED=0 GOOS="${_os}" GOARM=5 GOARCH="${_arch}" go build -o "${_release}/${_os}_${_arch}/docker-rm" github.com/mayflower/docker-ls/cli/docker-rm
}

package() {
   
  install -D -m755 "${pkgname}-${pkgver}/${_release}/${_os}_${_arch}/docker-ls" "${pkgdir}/usr/bin/docker-ls"
  install -D -m755 "${pkgname}-${pkgver}/${_release}/${_os}_${_arch}/docker-rm" "${pkgdir}/usr/bin/docker-rm" 
  install -D -m644 "${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=4 sw=4 et:
