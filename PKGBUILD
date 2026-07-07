# Maintainer: Mikhail f. Shiryaev <mr dot felixoid at gmail dot com>
# Maintainer: Luca Giugliardi <lukeemhigh plus dev at protonmail dot com>

pkgname='docker-scout'
pkgver=1.23.1
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
  0f778f9d833f28bc6cccff95e33039849c0afcecafa38d9f46fe74bfd0915714
)
sha256sums_aarch64=(
  88eecb7273f19bd18300d70e6f85b2e7d784e9e4f3cbb4a2b400db6b8355a52a
)

package() {
  # bin
  install -Dm755 "./docker-scout" "${pkgdir}/usr/lib/docker/cli-plugins/docker-scout"
}
