# Maintainer: Koutarou Tanaka <from.kyushu.island@gmail.com>

pkgname=koto
pkgver=1.0.14
_tag=180210
pkgrel=1
pkgdesc="Decentralized and open source cryptocurrency"
arch=('i686' 'x86_64')
url="https://koto.cash"
license=(MIT)
depends=('bash')
makedepends=('wget' 'unzip')
provides=('kotod' 'koto-cli' 'koto-tx' 'koto-fetch-params')
backup=('etc/koto.conf')
source=("${pkgname}-${_tag}.tar.gz::https://github.com/koto-dev/koto/archive/${_tag}.tar.gz"
        "0001-fetch-param-directory-env.patch"
        "koto.install"
        "koto.conf"
        "kotod.service")
sha1sums=('0ceb84cdd7087ec7bcd91a3fe1c2e7b941fb4fa3'
          'e27ee657c0652137537c1bb9b48ce1730cba3423'
          '47a54c280e049495900d8c4c39115e3c11b971df'
          '2c4e98f61b702cbfaf656c7e3ae50f030a5a3543'
          '51c9722a954b3e9573f418881330194052fffc4c')
install=koto.install

prepare() {
  cd "${srcdir}/${pkgname}-${_tag}"

  patch -p1 -i "${srcdir}/0001-fetch-param-directory-env.patch"
}

build() {
  cd "${srcdir}/${pkgname}-${_tag}"
  ./zcutil/build.sh
}

package() {
  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/usr/share/doc/koto/examples"
  mkdir -p "${pkgdir}/usr/share/licenses/koto"
  mkdir -p "${pkgdir}/usr/share/man/man1"
  mkdir -p "${pkgdir}/usr/share/bash-completion/completions"

  install -Dm755 "${srcdir}/${pkgname}-${_tag}/src/koto-cli" "${pkgdir}/usr/bin/koto-cli"
  install -Dm755 "${srcdir}/${pkgname}-${_tag}/src/kotod" "${pkgdir}/usr/bin/kotod"
  install -Dm755 "${srcdir}/${pkgname}-${_tag}/src/koto-tx" "${pkgdir}/usr/bin/koto-tx"
  install -Dm755 "${srcdir}/${pkgname}-${_tag}/zcutil/fetch-params.sh" "${pkgdir}/usr/bin/koto-fetch-params"

  install -Dm644 "${srcdir}/${pkgname}-${_tag}/doc/release-notes/release-notes-1.0.14.md" "${pkgdir}/usr/share/doc/koto/changelog"
  install -Dm644 "${srcdir}/${pkgname}-${_tag}/contrib/debian/copyright" "${pkgdir}/usr/share/doc/koto/copyright"
  install -Dm755 "${srcdir}/${pkgname}-${_tag}/contrib/debian/examples/koto.conf" "${pkgdir}/usr/share/doc/koto/examples/koto.conf"

  install -Dm644 "${srcdir}/${pkgname}-${_tag}/COPYING" "${pkgdir}/usr/share/licenses/koto/COPYING"

  install -Dm644 "${srcdir}/${pkgname}-${_tag}/doc/man/kotod.1" "${pkgdir}/usr/share/man/man1/kotod.1"
  install -Dm644 "${srcdir}/${pkgname}-${_tag}/doc/man/koto-cli.1" "${pkgdir}/usr/share/man/man1/koto-cli.1"
  install -Dm644 "${srcdir}/${pkgname}-${_tag}/doc/man/koto-fetch-params.1" "${pkgdir}/usr/share/man/man1/koto-fetch-params.1"

  install -Dm644 "${srcdir}/${pkgname}-${_tag}/contrib/kotod.bash-completion" "${pkgdir}/usr/share/bash-completion/completions/kotod"
  install -Dm644 "${srcdir}/${pkgname}-${_tag}/contrib/koto-cli.bash-completion" "${pkgdir}/usr/share/bash-completion/completions/koto-cli"

  install -Dm644 "${srcdir}/kotod.service" "${pkgdir}/usr/lib/systemd/system/kotod.service"
  install -Dm644 "${srcdir}/koto.conf" "${pkgdir}/etc/koto.conf"
}
