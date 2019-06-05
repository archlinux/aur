# Maintainer: Thor77 <thor77 at thor77 dot org>

pkgname=inlets
pkgver=2.0.4
pkgrel=1
pkgdesc='Expose your local endpoints to the Internet'
arch=('any')
url="https://github.com/alexellis/inlets"
license=('MIT')
options=('!strip')
_repo="github.com/alexellis"

source=('inlets-server.service' 'inlets-client.service' "https://github.com/alexellis/inlets/archive/${pkgver}.tar.gz")
sha256sums=('79bad343a925292d0a5cc5164bff28fe95d9512a5dded04568af61d71e1e0a79'
            'f7f85bb083b8839a89f715f882bf0e0f556cf183aa7ed653a1c87c5822762163'
            '9ac4cba2d7f862f0d8d79a4d5cedcda0f4826dc2f9746834572ba035e439b4d5')

prepare() {
  export GOPATH="${srcdir}/gopath"
  export GOBIN="${GOPATH}/bin"

  mkdir -p "${GOPATH}/src/${_repo}/"
  ln -fsT "${srcdir}/${pkgname}-${pkgver}" "${GOPATH}/src/${_repo}/${pkgname}"
}

build() {
  export GOPATH="${srcdir}/gopath"
  
  cd "${GOPATH}/src/${_repo}/${pkgname}"

  go build
}

package() {
  export GOPATH="${srcdir}/gopath"
  cd $srcdir
  install -Dm644 inlets-server.service "$pkgdir/usr/lib/systemd/system/inlets-server.service"
  install -Dm644 inlets-client.service "$pkgdir/usr/lib/systemd/system/inlets-client.service"
  install -Dm755 "${GOPATH}/src/${_repo}/${pkgname}/${pkgname}" "$pkgdir/usr/bin/inlets"
}
