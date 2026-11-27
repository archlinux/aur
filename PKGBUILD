# Maintainer: Anand Pant

pkgname=foundry-cli-bin
pkgver=0.2.9
pkgrel=1
pkgdesc="Foundry DevOps automation CLI"
arch=('x86_64')
url="https://github.com/shpitdev/foundry-cli"
license=('LicenseRef-proprietary')
install="${pkgname}.install"
makedepends=('github-cli')
optdepends=('nodejs>=26: foundry-cli-ts and foundry-cli superrepo')
options=('!strip' '!debug')
provides=('foundry-cli')
conflicts=('foundry-cli')

_asset="foundry-cli_${pkgver}_linux_amd64.tar.gz"
_sha256='9026cde26d3c9eb36514a52f552a4cb44a4575a9e4a30da74707f62fdb946ba0'

prepare() {
  gh release download "v${pkgver}" \
    --repo shpitdev/foundry-cli \
    --pattern "${_asset}" \
    --dir . --clobber

  echo "${_sha256}  ${_asset}" | sha256sum -c
  tar xzf "${_asset}"
}

package() {
  local prefix="${pkgdir}/usr/lib/foundry-cli"
  install -Dm755 foundry-cli "${prefix}/bin/foundry-cli-go"
  install -Dm755 bin/foundry-cli-ts "${prefix}/bin/foundry-cli-ts"
  cp -R libexec "${prefix}/libexec"
  if [[ -d templates ]]; then
    cp -R templates "${pkgdir}/usr/lib/foundry-cli/"

    if [[ ! -f "${pkgdir}/usr/lib/foundry-cli/templates/README.md" ]]; then
      install -Dm644 /dev/stdin \
        "${pkgdir}/usr/lib/foundry-cli/templates/README.md" <<'EOT'
# templates
EOT
    fi
  fi

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  if [[ -f NOTICE ]]; then
    install -Dm644 NOTICE "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE"
  fi
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -dm755 "${pkgdir}/usr/bin"
  local name
  for name in foundry-cli-go foundry-cli fcli; do
    ln -s ../lib/foundry-cli/bin/foundry-cli-go "${pkgdir}/usr/bin/${name}"
  done
  ln -s ../lib/foundry-cli/bin/foundry-cli-ts "${pkgdir}/usr/bin/foundry-cli-ts"
}
