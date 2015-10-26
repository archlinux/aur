# Maintainer: Frederik “Freso” S. Olesen <freso.dk@gmail.com>
# Contributor: kpcyrd <git@rxv.cc>
# Contributor: Ian Naval <ianonavy@gmail.com>

pkgname=go-ipfs
pkgver=0.3.8
pkgrel=2
pkgdesc='global versioned p2p merkledag file system'
url="https://github.com/ipfs/$pkgname"
arch=('i686' 'x86_64' 'armv7h')
license=('MIT')
makedepends=('go')
optdepends=('fuse: for mounting/advanced use'
            'bash-completion: bash completion support')
source=("${url}/archive/v${pkgver}.tar.gz")
sha512sums=('d991714e8a0ed6111ed5585a59a964f4d16679b0c4d2af335592c742490c420f66ad2454e622dab952230675d336020a0f4747676a463ce2a9cff4dea5827e6b')

prepare() {
  cd "${pkgname}-${pkgver}"

  mkdir -p .gopath/src/github.com/ipfs
  ln -sf "$PWD" .gopath/src/github.com/ipfs/go-ipfs
}

build() {
  cd "${pkgname}-${pkgver}/cmd/ipfs"
  export GOPATH="$PWD/../../.gopath"

  go build -v
}

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm 755 cmd/ipfs/ipfs "${pkgdir}/usr/bin/ipfs"
  install -Dm 644 misc/completion/ipfs-completion.bash "${pkgdir}/etc/bash_completion.d/ipfs"
  install -Dm 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
  install -Dm 644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
    README.md \
    CHANGELOG.md
}
