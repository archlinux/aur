# Maintainer: Edoardo Beltramo

pkgname=terragrunt-edo
_pkgname=terragrunt
pkgver=0.93.12.r3.g09a6c2cdf
pkgrel=1
pkgdesc="Terragrunt (Git master) – thin wrapper for OpenTofu/Terraform that provides extra tools for working with multiple modules"
url="https://github.com/gruntwork-io/${_pkgname}"
license=('MIT')
arch=('x86_64')
depends=('glibc')
optdepends=('opentofu: IaC engine (preferred)'
            'terraform: legacy HashiCorp Terraform CLI')
makedepends=('git' 'go')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+https://github.com/gruntwork-io/${_pkgname}.git")
sha256sums=('SKIP')

prepare() {
  cd "${srcdir}/${_pkgname}"
  export GOPATH="${srcdir}/go"
  export GOMODCACHE="${GOPATH}/pkg/mod"
  go mod download
}

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --tags --long | sed -E 's/^v?([0-9.]+)-([0-9]+)-g([0-9a-f]+)/\1.r\2.g\3/'
}

build() {
  export GOPATH="${srcdir}/.gopath"
  export GOCACHE="${srcdir}/.gocache"
  export CGO_ENABLED=0
  export GOFLAGS='-buildmode=pie -mod=readonly -trimpath'

  cd "${srcdir}/${_pkgname}"
  go build -ldflags "-s -w" -o "${srcdir}/${_pkgname}-bin" .
}

check() {
  "${srcdir}/${_pkgname}-bin" --version || true
}

package() {
  # Binary
  install -Dm755 "${srcdir}/${_pkgname}-bin" "${pkgdir}/usr/bin/${_pkgname}"

  # License + docs
  install -Dm644 "${srcdir}/${_pkgname}/LICENSE.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/${_pkgname}/README.md" \
    "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  # --- Shell completions (if supported by the CLI) ---
  if "${srcdir}/${_pkgname}-bin" --help 2>/dev/null | grep -qi 'install-autocomplete'; then
    # We cannot run --install-autocomplete in a package build (it edits user config),
    # so we leave completions to the user post-install. See note below.
    :
  elif "${srcdir}/${_pkgname}-bin" help 2>/dev/null | grep -q 'completion'; then
    # If a 'completion' generator exists, generate into system paths.
    "${srcdir}/${_pkgname}-bin" completion bash > "${srcdir}/terragrunt.bash"
    install -Dm644 "${srcdir}/terragrunt.bash" \
      "${pkgdir}/usr/share/bash-completion/completions/terragrunt"

    "${srcdir}/${_pkgname}-bin" completion zsh > "${srcdir}/_terragrunt"
    install -Dm644 "${srcdir}/_terragrunt" \
      "${pkgdir}/usr/share/zsh/site-functions/_terragrunt"

    "${srcdir}/${_pkgname}-bin" completion fish > "${srcdir}/terragrunt.fish"
    install -Dm644 "${srcdir}/terragrunt.fish" \
      "${pkgdir}/usr/share/fish/vendor_completions.d/terragrunt.fish"
  fi
}
