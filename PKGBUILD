# Maintainer: RedbeanW <redbeana44945 at gmail dot com>

pkgname=nfc-staticnested-git
pkgver=r31.454ed00
pkgrel=1
pkgdesc='Staticnested attack implemented in libnfc world.'
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url='https://github.com/Redbeanw44602/nfc-staticnested'
license=('GPL-3.0')
depends=('libnfc')
makedepends=('git')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

# cf ani2xcursor
_xmake_env() {
  export XMAKE_GLOBALDIR="$srcdir/.xmake-global"
  export XMAKE_PKG_CACHEDIR="$srcdir/.xmake-cache"
  export XMAKE_PKG_INSTALLDIR="$srcdir/.xmake-packages"
}

_xmake_arch() {
  local -A _arch_map=(
    [i686]='i386'
    [x86_64]='x86_64'
    [armv7h]='armv7'
    [aarch64]='arm64'
  )
  echo "${_arch_map[$CARCH]}"
}

pkgver() {
    cd "$pkgname"
    ( set -o pipefail
        git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

build() {
    cd "$pkgname"
    _xmake_env

    xmake f -p linux -a $(_xmake_arch) -m releasedbg --is-arch=true -y
    xmake build nfc-staticnested

    xrepo remove -y --all nfcpp
}

package() {
    cd "$pkgname"

    install -Dm755 "build/linux/$(_xmake_arch)/releasedbg/nfc-staticnested" \
        "${pkgdir}/usr/bin/nfc-staticnested"

    install -Dm644 LICENSE \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -Dm644 README.md \
        "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
