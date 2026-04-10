# Maintainer: Anand Pant

pkgname=nyrra-foundry-cli-bin
pkgver=0.0.5
pkgrel=1
pkgdesc="Foundry DevOps automation CLI"
arch=('x86_64')
url="https://github.com/nyrra-labs/nyrra-foundry-cli"
license=('Apache-2.0')
install="${pkgname}.install"
makedepends=('github-cli')
provides=('nyrra-foundry-cli')
conflicts=('nyrra-foundry-cli')

_asset='nyrra-foundry-cli_0.0.5_linux_amd64.tar.gz'
_sha256='c83b04a2dc8e3790d33b0d27cf60eab32ed3e5dbfa136cb8093c1b8696e80a82'

prepare() {
  gh release download "v${pkgver}" \
    --repo nyrra-labs/nyrra-foundry-cli \
    --pattern "${_asset}" \
    --dir . --clobber

  echo "${_sha256}  ${_asset}" | sha256sum -c
  tar xzf "${_asset}"
}

package() {
  install -dm755 "${pkgdir}/usr/lib/nyrra-foundry-cli"
  install -Dm755 "nyrra-foundry-cli" \
    "${pkgdir}/usr/lib/nyrra-foundry-cli/nyrra-foundry-cli"
  cp -R templates "${pkgdir}/usr/lib/nyrra-foundry-cli/"

  # The current release archive omits templates/README.md, but the CLI requires
  # that sentinel file to resolve packaged templates at runtime.
  install -Dm644 /dev/stdin \
    "${pkgdir}/usr/lib/nyrra-foundry-cli/templates/README.md" <<'EOF'
# templates
EOF

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 NOTICE "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s ../lib/nyrra-foundry-cli/nyrra-foundry-cli \
    "${pkgdir}/usr/bin/nyrra-foundry-cli"
}
