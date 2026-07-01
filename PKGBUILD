# Maintainer: Mikhail f. Shiryaev <mr dot felixoid at gmail dot com>
# Maintainer: Luca Giugliardi <lukeemhigh plus dev at protonmail dot com>

pkgname='docker-scout'
pkgver=1.22.0
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
  a3c6c38741153a8477be61eccc9d48490745496bddbd0c5e0fc301c334fdd734
)
sha256sums_aarch64=(
  afab5324848098de9838b64f862979751b77e5fcf06f1840b87c0b99795e52a4
)

package() {
  # bin
  install -Dm755 "./docker-scout" "${pkgdir}/usr/lib/docker/cli-plugins/docker-scout"
}
