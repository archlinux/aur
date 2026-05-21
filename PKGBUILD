# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=flutterdec-bin
pkgver=0.1.0_alpha.2
pkgrel=1
pkgdesc='Static Flutter AOT decompiler — emits pseudo-Dart from libapp.so (ARM64)'
arch=('x86_64')
url='https://github.com/caverav/flutterdec'
license=('MIT')
depends=('glibc' 'libgcc')
makedepends=('patchelf')
provides=('flutterdec')
conflicts=('flutterdec')
options=('!debug')

_tag="v${pkgver//_/-}"
source=("flutterdec-${pkgver}-Linux-X64.tar.gz::https://github.com/caverav/flutterdec/releases/download/${_tag}/flutterdec-${_tag}-Linux-X64.tar.gz"
        "LICENSE::https://raw.githubusercontent.com/caverav/flutterdec/${_tag}/LICENSE")
sha256sums=('e831964bdc748e681ed8b68dd5adf24e8aa7552d1fab741e3bfa13be95da309c'
            'ecbfc79ff871cb1044de5dadf508288fbfabe92d25670f4a176117c20889150d')

latestver() {
    gh api --paginate repos/caverav/flutterdec/releases --jq \
        '.[] | select(.draft == false) | .tag_name' |
        sed -nE 's/^v([0-9]+\.[0-9]+\.[0-9]+(-[a-zA-Z0-9.]+)?)$/\1/p' |
        sed 's/-/_/g' | sort -V | tail -1
}

package() {
    patchelf --set-interpreter /usr/lib/ld-linux-x86-64.so.2 flutterdec
    install -Dm755 flutterdec "${pkgdir}/usr/bin/flutterdec"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
