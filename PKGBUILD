# Maintainer: couldLover <https://github.com/numb747>
# Contributor: Andrej Benz <hello[at]benz[dot]dev>  (upstream elephant / original elephant-clipboard PKGBUILD)
#
# Patched variant of elephant-clipboard. The patch is exported from
# https://github.com/numb747/elephant (branch clipboard-substring-search, based on v2.22.1).
#
# NOTE: elephant providers are Go plugins (-buildmode=plugin). The .so must be
# built with the same Go toolchain and module versions as the installed elephant
# binary, otherwise it fails to load. Do not mix with elephant-bin, and rebuild
# this package whenever elephant is upgraded.

pkgname=elephant-clipboard-substring
_provider=clipboard
pkgver=2.22.1
pkgrel=1
pkgdesc='clipboard provider for elephant (case-insensitive substring search, space-separated AND terms, newest first)'
url='https://github.com/abenz1267/elephant'
arch=('x86_64' 'aarch64')
license=('GPL-3.0-only')
depends=('elephant' 'wl-clipboard' 'imagemagick')
makedepends=('go')
provides=("elephant-clipboard=${pkgver}")
conflicts=('elephant-clipboard')
source=("elephant-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        'clipboard-substring-search.patch')
sha256sums=('3d1d0d4c55ae531fa3f06406b96504b5165a0d7b53523d1f8351d9d93e457f44'
            '5b9145dacc6716c4a82de9911b5313f8e493791f4a66f4d34a9984aef92af2bb')

prepare() {
    cd elephant-${pkgver}
    patch -Np1 -i "${srcdir}/clipboard-substring-search.patch"
}

build() {
    cd elephant-${pkgver}/internal/providers/${_provider}
    export CGO_CPPFLAGS="${CPPFLAGS}" CGO_CFLAGS="${CFLAGS}" CGO_CXXFLAGS="${CXXFLAGS}" CGO_LDFLAGS="${LDFLAGS}"
    go build -ldflags="-s -w" -buildvcs=false -buildmode=plugin -trimpath
}

package() {
    cd elephant-${pkgver}/internal/providers/${_provider}
    install -Dm 755 ${_provider}.so -t "${pkgdir}/usr/lib/elephant"

    cd ../../../
    install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
