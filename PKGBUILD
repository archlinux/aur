# Maintainer: Byeonghoon Yoo <bhyoo@bhyoo.com>

_pkgname=linear-cli
pkgname=linear-cli-schpet
pkgver=2.3.0
pkgrel=1
pkgdesc="Linear without leaving the command line: list, start, and create PRs for linear issues. Agent friendly. (Built from source)"
arch=('x86_64' 'aarch64')
url="https://github.com/schpet/linear-cli"
license=('MIT')
depends=('glibc' 'gcc-libs')
makedepends=('deno')
provides=('linear-cli')
conflicts=('linear-cli' 'linear-cli-schpet-bin')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/schpet/linear-cli/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('af720b184192442fc648cb3b19354419766519f70caf3791ea63debdfb9c738c')
options=('!strip')

prepare() {
  cd "${_pkgname}-${pkgver}"
  export DENO_DIR="${srcdir}/deno_dir"
  deno task codegen
}

build() {
  cd "${_pkgname}-${pkgver}"
  export DENO_DIR="${srcdir}/deno_dir"
  deno compile --allow-all --output linear src/main.ts
}

package() {
  cd "${_pkgname}-${pkgver}"

  # Install the compiled executable.
  install -Dm755 linear -t "${pkgdir}/usr/bin/"

  # Generate and install shell completions
  install -dm755 "${pkgdir}/usr/share/bash-completion/completions"
  install -dm755 "${pkgdir}/usr/share/fish/vendor_completions.d"
  install -dm755 "${pkgdir}/usr/share/zsh/site-functions"

  ./linear completions bash > "${pkgdir}/usr/share/bash-completion/completions/linear"
  ./linear completions fish > "${pkgdir}/usr/share/fish/vendor_completions.d/linear.fish"
  ./linear completions zsh > "${pkgdir}/usr/share/zsh/site-functions/_linear"

  # Install documentation and license files.
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
