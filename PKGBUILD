# Maintainer: kpcyrd <git@rxv.cc>

pkgname=tr1pd
pkgver=0.3.1
pkgrel=1
pkgdesc="tamper resistant audit log"
url="https://github.com/kpcyrd/tr1pd"
depends=('gcc-libs' 'libsodium' 'libseccomp' 'libcap' 'zeromq')
makedepends=('cargo')
arch=('i686' 'x86_64' 'armv6h' 'aarch64')
license=('AGPL3')
install='tr1pd.install'
source=("https://github.com/kpcyrd/${pkgname}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('eae536bd1227a7f605b7eefb0b3d6682474acbbea98cce9a4f8acb4fb98e8000f9d1840d11e38bd27ceaf8a72b31a3b4bdbebb7edc49e5e6964bdded5db64ab9')

build() {
  cd "${pkgname}-${pkgver}"
  cargo build --release --locked
}

check() {
  cd "${pkgname}-${pkgver}"
  cargo test --release --locked
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 target/release/tr1pd target/release/tr1pctl -t "${pkgdir}/usr/bin"

  install -Dm644 "contrib/tr1pd.service" "${pkgdir}/usr/lib/systemd/system/tr1pd.service"
  install -Dm644 "contrib/tr1pd-sysuser.conf" "${pkgdir}/usr/lib/sysusers.d/tr1pd.conf"
  install -Dm644 "contrib/tr1pd-tmpfiles.conf" "${pkgdir}/usr/lib/tmpfiles.d/tr1pd.conf"

  install -d "${pkgdir}/etc/bash_completion.d"
  "${pkgdir}/usr/bin/tr1pd" bash-completion > "${pkgdir}/etc/bash_completion.d/tr1pd"
  "${pkgdir}/usr/bin/tr1pctl" bash-completion > "${pkgdir}/etc/bash_completion.d/tr1pctl"
}

# vim:set ts=2 sw=2 et:
