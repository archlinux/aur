# Maintainer: Anand Pant

pkgname=foundry-cli-bin
pkgver=0.0.58
pkgrel=1
pkgdesc="Foundry DevOps automation CLI"
arch=('x86_64')
url="https://github.com/shpitdev/foundry-cli"
license=('LicenseRef-proprietary')
install="${pkgname}.install"
makedepends=('github-cli')
provides=('foundry-cli')
conflicts=('foundry-cli')

_asset="foundry-cli_${pkgver}_linux_amd64.tar.gz"
_sha256='83edddc44b3f34e31d9de5a0c2a1aa7f17bde3082cddfde2ffb90a8814d89bba'

prepare() {
  gh release download "v${pkgver}" \
    --repo shpitdev/foundry-cli \
    --pattern "${_asset}" \
    --dir . --clobber

  echo "${_sha256}  ${_asset}" | sha256sum -c
  tar xzf "${_asset}"
}

package() {
  install -dm755 "${pkgdir}/usr/lib/foundry-cli"
  install -Dm755 "foundry-cli" \
    "${pkgdir}/usr/lib/foundry-cli/foundry-cli"
  cp -R templates "${pkgdir}/usr/lib/foundry-cli/"

  if [[ ! -f "${pkgdir}/usr/lib/foundry-cli/templates/README.md" ]]; then
    install -Dm644 /dev/stdin \
      "${pkgdir}/usr/lib/foundry-cli/templates/README.md" <<'EOT'
# templates
EOT
  fi

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  if [[ -f NOTICE ]]; then
    install -Dm644 NOTICE "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE"
  fi
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s ../lib/foundry-cli/foundry-cli \
    "${pkgdir}/usr/bin/foundry-cli"
}
