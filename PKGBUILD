# Maintainer: kpcyrd <git@rxv.cc>

pkgname='evilginx'
pkgdesc='Standalone man-in-the-middle attack framework used for phishing login credentials along with session cookies, allowing for the bypass of 2-factor authentication'
pkgver='2.3.0'
pkgrel='1'
url='https://github.com/kgretzky/evilginx2'
license=('GPL3')
arch=('x86_64')
depends=('glibc')
makedepends=('go-pie' 'git' 'dep')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/kgretzky/evilginx2/archive/${pkgver}.tar.gz")
sha512sums=('385926bbd0a37568a4fa9fc9e500bd622a14209ecf0d60ff8b93e6e45b3d59b0649fe9f0c5571f6eade58e025d25a84f24bce9b64a63163939eabdea937bac69')

prepare() {
  export GOPATH="${srcdir}/go"
  mkdir -p "go/src/github.com/kgretzky"
  ln -rTsf "evilginx2-${pkgver}" "go/src/github.com/kgretzky/evilginx2"

  cd go/src/github.com/kgretzky/evilginx2
  dep ensure -v
}

build() {
  cd go/src/github.com/kgretzky/evilginx2
  export GOPATH="${srcdir}/go"
  go build -v \
    -gcflags "all=-trimpath=${GOPATH}" \
    -asmflags "all=-trimpath=${GOPATH}" \
    -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
    -o ./bin/evilginx main.go
}

package() {
  cd go/src/github.com/kgretzky/evilginx2
  install -Dm755 bin/evilginx "${pkgdir}/usr/bin/evilginx"

  install -D phishlets/* -t "${pkgdir}/usr/share/evilginx/phishlets"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  for file in README.md CHANGELOG.md ; do
    install -Dm644 "${file}" "${pkgdir}/usr/share/doc/${pkgname}/${file}"
  done
}
