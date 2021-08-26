# Maintainer: Francois Menning <f.menning at pm me>
# Contributor: Jelle van der Waa <jelle@archlinux.org>

_pkgname=meilisearch
pkgname=meilisearch-git
pkgver=v0.21.0.r13.g2d8dd87c
pkgrel=1
pkgdesc="Lightning Fast, Ultra Relevant, and Typo-Tolerant Search Engine"
arch=(x86_64)
url="https://docs.meilisearch.com/"
license=('MIT')
depends=(gcc-libs)
makedepends=(rust)
provides=('meilisearch')
source=(${_pkgname}::git+https://github.com/meilisearch/MeiliSearch.git
        ${_pkgname}.service ${_pkgname}.tmpfiles ${_pkgname}.sysusers ${_pkgname}.conf)
sha512sums=('SKIP'
            '9531963580e1d20cc87c7062d727367b628a02b3e599311df7272e59cc14b0b7d16218b793436587b4a64d7fe009f877a86f5b18bdd42783afd8f42af9be0af8'
            '76284bf4c436a6b3365edd6bd12ffcb186b721d284b29933e77ddc841d333be9eeb2701c89fba1567a8eedda52787be8d3c5f55809a051488b7295fbb6842bce'
            'b83518bd61cb587baac784b1b9bbe4a6a12be91c0a5b6cc0b3b631dde9cee1d59d6e43800a0d32b909fb2d90fe3f64e1ab63c3c8028428be3333d39f6c05d60c'
            '4ccbfd9c04a459f31cd24f6f90cf4e8fdebfd89d5aa12de529a3b71be9928e123a716bee1fa3161b363f0c1f55a328c3e9e8e2489f1e28cbf911aaa72a2eec9d')
validpgpkeys=()

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${_pkgname}"
  cargo build --release --locked --all-features
}

check() {
  cd "${srcdir}/${_pkgname}"
  cargo test --release --locked
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -Dm 755 target/release/${_pkgname} -t "${pkgdir}/usr/bin"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"

  install -D -m644 "${srcdir}/meilisearch.service"  "${pkgdir}/usr/lib/systemd/system/meilisearch.service"
  install -D -m644 "${srcdir}/meilisearch.sysusers" "${pkgdir}/usr/lib/sysusers.d/meilisearch.conf"
  install -D -m644 "${srcdir}/meilisearch.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/meilisearch.conf"
  install -D -m644 "${srcdir}/meilisearch.conf" "${pkgdir}/etc/meilisearch.conf"
}
