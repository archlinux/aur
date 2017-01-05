# Maintainer: Icaro Perseo <icaroperseo[at]protonmail[dot]com>

pkgname=dashing
pkgver=0.3.0
pkgrel=2
pkgdesc="A Dash Generator Script for Any HTML"
url="https://github.com/technosophos/dashing"
license=('MIT')
arch=('i686' 'x86_64')
makedepends=('go' 'glide')
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/technosophos/${pkgname}/archive/${pkgver}.tar.gz"
        "cli_context-deprecated.patch"
        "cli-output.patch")
sha256sums=('f6569f3df80c964c0482e7adc1450ea44532d8da887091d099ce42a908fc8136'
            'e0ec017227a3f8aa58095fbdfe18db3e5376e530b41b1d34164461c51623ac2b'
            'c412b3b2ccae6193aee5989d131bc6e8df7c80eee305794e406dd020a44c1ccb')

prepare() {
  cd ${pkgname}-${pkgver}
  patch -p1 -i ../cli_context-deprecated.patch
  patch -p1 -i ../cli-output.patch
  export GOPATH=${srcdir}/${pkgname}-${pkgver}
  mkdir -p src
  mv dashing.go src/
  glide install
  mv vendor/* src/
}

build() {
  cd ${pkgname}-${pkgver}/src
  go build -o dashing -ldflags "-X main.version=${pkgver}" dashing.go
}

package() {
  cd ${pkgname}-${pkgver}

  # Bin file
  install -Dm755 src/${pkgname} \
    "${pkgdir}/usr/bin/${pkgname}"

  # Doc files
  install -Dm644 README.md \
    "$pkgdir/usr/share/doc/${pkgname}/README.md"

  # License
  install -Dm644 LICENSE.txt \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 cc=80 et:
