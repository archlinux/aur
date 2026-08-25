# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=certora-prover-bin
_prover_dir=/usr/share/certora-prover
pkgver=8.19.0
pkgrel=1
pkgdesc="Certora Prover verification engine, run locally by certora-cli instead of Certora's cloud"
arch=('any')
url="https://www.certora.com"
license=('GPL-3.0-only')
depends=('certora-cli' 'certora-tac-optimizer' 'cvc5' 'java-runtime>=19' 'z3')
optdepends=('graphviz: TAC reports')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
noextract=("certora-prover-${pkgver}.jar")
source=("certora-prover-${pkgver}.jar::https://github.com/Certora/CertoraProver/releases/download/${pkgver}/certora-prover-${pkgver}.jar")
sha256sums=('09b7a2d4696adea2cf59f50549cb5b1302f3c73b3b5c4b8c3d475ada54aca07a')

latestver() {
    gh api --paginate repos/Certora/CertoraProver/releases --jq \
        '.[] | select(.prerelease == false and .draft == false) | .tag_name' |
        sed -nE 's/^v?([0-9]+(\.[0-9]+)*)$/\1/p' | sort -V | tail -1
}

package() {
    # certora-cli resolves the engine as $CERTORA/emv.jar (Shared/certoraUtils.py),
    # and treats its presence as the signal to verify locally rather than upload.
    install -Dm644 "certora-prover-${pkgver}.jar" "${pkgdir}${_prover_dir}/emv.jar"

    install -d "${pkgdir}/etc/profile.d"
    printf 'export CERTORA=%s\n' "${_prover_dir}" > "${pkgdir}/etc/profile.d/certora-prover.sh"
    chmod 644 "${pkgdir}/etc/profile.d/certora-prover.sh"
}
