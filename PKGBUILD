pkgname=laurel-audit
pkgver=0.8.2
pkgrel=2
pkgdesc='Transform Linux Audit logs for SIEM usage'
arch=('x86_64' 'aarch64')
url='https://github.com/threathunters-io/laurel'
license=('GPL-3.0')
depends=('acl' 'audit')
makedepends=('cargo' 'clang')
conflicts=('laurel-audit-bin' 'laurel-audit-git')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('9cacc0d7097a0e8e7c7eccfe6fcc7fd7958e3b403ed8270a8691ad68299dec23')

prepare() {
  cd "laurel-${pkgver}"

  sed -i \
    's|^path = /usr/local/sbin/laurel$|path = /usr/bin/laurel|' \
    etc/audit/plugins.d/laurel.conf

  cargo fetch --locked
}

build() {
  cd "laurel-${pkgver}"

  CARGO_TARGET_DIR=target cargo build --release --frozen
}

check() {
  cd "laurel-${pkgver}"

  CARGO_TARGET_DIR=target cargo test --frozen
}

package() {
  cd "laurel-${pkgver}"

  local docdir="${pkgdir}/usr/share/doc/${pkgname}"
  local doc
  local -a docs=(
    'man/laurel.8.md'
    'man/laurel-about.7.md'
    'man/laurel-audit-rules.7.md'
    'INSTALL.md'
    'README.md'
    'performance.md'
  )

  install -Dm755 target/release/laurel \
    "${pkgdir}/usr/bin/laurel"

  install -Dm644 LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm644 etc/laurel/config.toml \
    "${docdir}/config.toml.example"

  install -Dm644 etc/audit/plugins.d/laurel.conf \
    "${docdir}/laurel.conf.example"

  for doc in "${docs[@]}"; do
    install -Dm644 "${doc}" "${docdir}/${doc##*/}"
  done
}
