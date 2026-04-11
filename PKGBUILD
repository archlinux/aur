# Maintainer: Mikhail f. Shiryaev <mr dot felixoid at gmail dot com>
# Maintainer: Luca Giugliardi <lukeemhigh plus dev at protonmail dot com>

pkgname='docker-scout'
pkgver=1.20.4
pkgrel=1
pkgdesc="Docker Scout is a set of software supply chain features integrated into Docker's user interfaces and command line interface (CLI)."
url='https://github.com/docker/scout-cli'
arch=('aarch64' 'x86_64')
license=('PROPRIETARY')

get_sums() {
  # usage: bash -c 'source PKGBUILD && get_sums'
  for CARCH in x86_64 aarch64; do
    pkgver=$(grep '^pkgver=' PKGBUILD | cut -f2 -d=)
    CARCH=$CARCH makepkg --verifysource --nobuild --noextract
  done
  for CARCH in x86_64 aarch64; do
    echo "sha256sums_${CARCH}=("
    [ "$CARCH" == aarch64 ] && CARCH=arm64
    sha256sum "docker-scout_${pkgver}_${CARCH}.tar.gz" | sed -r 's|(\w+).+|  \1|'
    echo ')'
  done
}

source_aarch64=("${pkgname}_${pkgver}_arm64.tar.gz::https://github.com/docker/scout-cli/releases/download/v${pkgver}/docker-scout_${pkgver}_linux_arm64.tar.gz")
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/docker/scout-cli/releases/download/v${pkgver}/docker-scout_${pkgver}_linux_amd64.tar.gz")
sha256sums_x86_64=(
  92e20757cf18f4698aec56d32e15cb4435e9dcbfcb1b09708cd97674c70f845e
)
sha256sums_aarch64=(
  ee207d69c541958caef5bce5d5b8875a99dd74af8824cf4944ff8f21e2d8c8ac
)

package() {
  # bin
  install -Dm755 "./docker-scout" "${pkgdir}/usr/lib/docker/cli-plugins/docker-scout"
}
