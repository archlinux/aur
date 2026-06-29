# Maintainer: Anand Pant

pkgname=foundry-cli-bin
pkgver=0.0.26
pkgrel=1
pkgdesc="Foundry DevOps automation CLI"
arch=('x86_64')
url="https://github.com/nyrra-labs/nyrra-foundry-cli"
license=('Apache-2.0')
install="${pkgname}.install"
makedepends=('github-cli')
provides=('foundry-cli')
conflicts=('foundry-cli')

_asset='foundry-cli_0.0.26_linux_amd64.tar.gz'
_sha256='d124887fcc221b92f70a5dbd5aa26aaa093b791fab753f4f477dd8d5928aac65'

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
