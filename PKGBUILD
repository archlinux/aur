# Maintainer: couldLover <https://github.com/numb747>
# Contributor: Andrej Benz <hello[at]benz[dot]dev>  (upstream elephant / original elephant-desktopapplications PKGBUILD)
#
# Patched variant of elephant-desktopapplications. The patch is exported from
# https://github.com/numb747/elephant (branch desktopapps-window-first, based on v2.22.1).
#
# NOTE: elephant providers are Go plugins (-buildmode=plugin). The .so must be
# built with the same Go toolchain and module versions as the installed elephant
# binary, otherwise it fails to load. Do not mix with elephant-bin.
# depends pins elephant to the exact same pkgver on purpose: pacman will refuse
# to upgrade elephant until this package has been updated to match, instead of
# silently leaving a plugin that no longer loads.

pkgname=elephant-desktopapplications-windowfirst
_provider=desktopapplications
pkgver=2.22.1
pkgrel=2
pkgdesc='desktopapplications provider for elephant (an app with open windows ranks directly below its own window)'
url='https://github.com/abenz1267/elephant'
arch=('x86_64' 'aarch64')
license=('GPL-3.0-only')
depends=("elephant=${pkgver}")
makedepends=('go')
provides=("elephant-desktopapplications=${pkgver}")
conflicts=('elephant-desktopapplications')
source=("elephant-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        'desktopapps-window-first.patch')
sha256sums=('3d1d0d4c55ae531fa3f06406b96504b5165a0d7b53523d1f8351d9d93e457f44'
            '088af5b4def6349880f3df8a6bcb47995231a48ff24f1ccd75a25260e6a9d480')

prepare() {
    cd elephant-${pkgver}
    patch -Np1 -i "${srcdir}/desktopapps-window-first.patch"
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
