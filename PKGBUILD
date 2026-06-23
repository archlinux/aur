# Maintainer: Anand Pant

pkgname=foundry-cli-bin
pkgver=0.0.21
pkgrel=1
pkgdesc="Foundry DevOps automation CLI"
arch=('x86_64')
url="https://github.com/nyrra-labs/nyrra-foundry-cli"
license=('Apache-2.0')
install="${pkgname}.install"
makedepends=('github-cli')
provides=('foundry-cli')
conflicts=('foundry-cli')

_asset='foundry-cli_0.0.21_linux_amd64.tar.gz'
_sha256='826b33677a48a7d2de0efd4b524bcc1ca758eac7b2ca5d4a4a3b9aeb8476fccf'

prepare() {
  gh release download "v${pkgver}" \
    --repo nyrra-labs/nyrra-foundry-cli \
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

  # Some historical release archives omitted templates/README.md, but the CLI
  # requires that sentinel file to resolve packaged templates at runtime.
  install -Dm644 /dev/stdin \
    "${pkgdir}/usr/lib/foundry-cli/templates/README.md" <<'EOT'
# templates
EOT

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  if [[ -f NOTICE ]]; then
    install -Dm644 NOTICE "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE"
  fi
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s ../lib/foundry-cli/foundry-cli \
    "${pkgdir}/usr/bin/foundry-cli"
}
