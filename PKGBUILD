# Maintainer: Raflos <raflos@gmx.com>
# Previous maintainer:  Alexis Aguilar <aaguilar1892@gmail.com>

pkgname="supabase"
pkgver=2.114.0
pkgrel=1
pkgdesc="CLI for Supabase, an open source Firebase alternative"
arch=('aarch64' 'x86_64')
options=(!strip)
url="https://supabase.com/docs/reference/cli/about"
_url="https://github.com/${pkgname}/cli"
license=('MIT')
depends=('glibc')
makedepends=('bun' 'go' 'nodejs' 'pnpm')
# checkdepends=('docker')
_pkgsrc="cli-${pkgver}"
source=("${pkgname}-${_pkgsrc}.tar.gz::${_url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('ae02a1daff7d0d5f243af61cc30aeb0e6698168cdbca03c8495986b13a32280afdf0bf830410ee686cc00934c6ea2014b3a4ee1015e5a2bfb9650fa6e22a2aee')

prepare() {
  export GOMODCACHE="${srcdir}/go-mod-cache"

  cd "${srcdir}/${_pkgsrc}"
  pnpm install --frozen-lockfile

  sed -i 's/process.env.SUPABASE_CLI_VERSION ?? "0.0.0-dev"/"'"${pkgver}"'"/' \
    apps/cli/src/shared/cli/version.ts

  cd "${srcdir}/${_pkgsrc}/apps/cli-go"
  go mod download -x
  find "${GOMODCACHE}" -type d -exec chmod 755 {} +
  find "${GOMODCACHE}" -type f -exec chmod 645 {} +
}

build() {
  export GOCACHE="${srcdir}/go-cache"
  export GOMODCACHE="${srcdir}/go-mod-cache"

  cd "${srcdir}/${_pkgsrc}"

  cd "${srcdir}/${_pkgsrc}/apps/cli-go"
  CGO_ENABLED=0 go build -v -trimpath \
    -ldflags="-s -w -X ${_url#https://}/internal/utils.Version=${pkgver}" \
    -o "supabase-go" .

  cd "${srcdir}/${_pkgsrc}/apps/cli"
  bun scripts/build-binary.ts legacy

  mkdir -p "${srcdir}/${_pkgsrc}/apps/cli-go/completions"
  for _sh in bash fish zsh powershell; do
    node --experimental-strip-types --no-warnings --input-type=module -e "
      import { legacyGenerateCompletionScript } from './src/legacy/commands/completion/legacy-completion-scripts.ts';
      process.stdout.write(legacyGenerateCompletionScript('${_sh}', { noDescriptions: false }));
    " > "${srcdir}/${_pkgsrc}/apps/cli-go/completions/supabase.${_sh}"
  done
}

# check() {
#   cd "${srcdir}/${_pkgsrc}"
#   pnpm test
# }

package() {
  cd "${srcdir}/${_pkgsrc}"

  install -vDm755 "apps/cli/dist/supabase-legacy" "${pkgdir}/usr/bin/${pkgname}"
  install -vDm755 "apps/cli-go/supabase-go"      "${pkgdir}/usr/bin/${pkgname}-go"
  install -vDm644 "apps/cli-go/LICENSE"           "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -vDm644 "README.md"                     "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  cd "apps/cli-go/completions"
  install -vDm644 "supabase.bash"       "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
  install -vDm644 "supabase.fish"       "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}.fish"
  install -vDm644 "supabase.zsh"        "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
  install -vDm644 "supabase.powershell" "${pkgdir}/usr/share/powershell/Modules/${pkgname}/${pkgname}.psm1"
}
