# Maintainer: robertfoster
# Contributor: Joseph R. Prostko <joe dot prostko at gmail dot com>

pkgname=aptly
pkgver=1.4.0
pkgrel=3
pkgdesc="A Swiss Army knife for Debian repository management."
url="https://www.aptly.info"
license=('MIT')
options=('!strip')
arch=('i686' 'x86_64')
_commit="f9d08e1377970d2b13410da3d1d452b935041a4e"
_org="aptly-dev"
_repo="aptly"
source=("https://github.com/${_org}/${_repo}/archive/${_commit}.tar.gz")

build() {
  cd "${srcdir}/${pkgname}-${_commit}"
  export GO11MODULE=on
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOPATH="$srcdir"
  export GOFLAGS="-buildmode=pie -ldflags=-linkmode=external -trimpath -mod=readonly -modcacherw"
  go build -o aptly_build
}

package() {
  cd "${srcdir}/${pkgname}-${_commit}"
  install -Dm755 "${pkgname}_build" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${pkgname}.service" -t "${pkgdir}/usr/lib/systemd/system"

  mkdir -p "${pkgdir}/usr/share/man/man1" \
    "${pkgdir}/usr/share/bash-completion/completions/" \
    "${pkgdir}/usr/share/zsh/site-functions/"
  cp completion.d/aptly "${pkgdir}/usr/share/bash-completion/completions/"
  cp completion.d/_aptly "${pkgdir}/usr/share/zsh/site-functions/"
  cp man/aptly.1 "${pkgdir}/usr/share/man/man1"
  gzip "${pkgdir}/usr/share/man/man1/aptly.1"
}

sha256sums=('7904a9422d93d79839e315931dd7061b41a7d8b414612c6a9cfc1b0609fa4d45')
