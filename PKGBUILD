# Maintainer: Koutarou Tanaka <from.kyushu.island@gmail.com>

pkgname=koto
pkgver=1.0.15
pkgrel=1
pkgdesc="Decentralized and open source cryptocurrency"
arch=('x86_64')
url="https://koto.cash"
license=(MIT)
depends=('bash' 'boost-libs' 'libevent' 'qpid-proton' 'zeromq')
makedepends=('boost' 'cargo' 'cmake' 'git' 'gmock' 'python' 'wget')
checkdepends=('python' 'python2' 'python2-pyzmq')
provides=('kotod' 'koto-cli' 'koto-tx' 'koto-fetch-params')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/koto-dev/koto/archive/dev-${pkgver}.tar.gz"
        "0001-fetch-param-directory-env.patch"
        "0002-boost-no-mt-suffix.patch"
        "0003-libsnark-no-gtest.patch"
        "0004-use-system-rust.patch"
        "koto.install")
sha1sums=('1cff15114e759b7246ccb5142857c3c6925d62da'
          'e27ee657c0652137537c1bb9b48ce1730cba3423'
          '9110b57e8eb569ad35992efd83b9cd70d6d2244a'
          'a9a7250c1a3c9a620dd21f9b5406027c05e7ddad'
          'a89b0e4b137881e27a89bd0c78f9caff087b501e'
          'e1e1155f7618c4da3c51517ba6530178f33cee28')
install=koto.install

prepare() {
  cd "${srcdir}/${pkgname}-dev-${pkgver}"

  patch -p1 -i "${srcdir}/0001-fetch-param-directory-env.patch"
  patch -p1 -i "${srcdir}/0002-boost-no-mt-suffix.patch"
  patch -p1 -i "${srcdir}/0003-libsnark-no-gtest.patch"
  patch -p1 -i "${srcdir}/0004-use-system-rust.patch"
}

build() {
  cd "${srcdir}/${pkgname}-dev-${pkgver}"

  cd depends
  make install \
      native_packages='' \
      packages='bdb librustzcash libgmp libsodium'
  cd ..

  BUILD="$(./depends/config.guess)"
  CPPFLAGS="${CPPFLAGS} -I${PWD}/depends/${BUILD}/include"
  LDFLAGS="${LDFLAGS} -L${PWD}/depends/${BUILD}/lib"

  ./autogen.sh
  depends_prefix="${PWD}/depends/${BUILD}" ./configure --prefix=/usr
  make
}

check() {
  cd "${srcdir}/${pkgname}-dev-${pkgver}"
}

package() {
  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/usr/share/doc/koto/examples"
  mkdir -p "${pkgdir}/usr/share/licenses/koto"
  mkdir -p "${pkgdir}/usr/share/man/man1"
  mkdir -p "${pkgdir}/usr/share/bash-completion/completions"

  install -Dm755 "${srcdir}/${pkgname}-dev-${pkgver}/src/koto-cli" "${pkgdir}/usr/bin/koto-cli"
  install -Dm755 "${srcdir}/${pkgname}-dev-${pkgver}/src/kotod" "${pkgdir}/usr/bin/kotod"
  install -Dm755 "${srcdir}/${pkgname}-dev-${pkgver}/src/koto-tx" "${pkgdir}/usr/bin/koto-tx"
  install -Dm755 "${srcdir}/${pkgname}-dev-${pkgver}/zcutil/fetch-params.sh" "${pkgdir}/usr/bin/koto-fetch-params"

  install -Dm644 "${srcdir}/${pkgname}-dev-${pkgver}/doc/release-notes/release-notes-1.0.14.md" "${pkgdir}/usr/share/doc/${pkgname}/changelog"
  install -Dm644 "${srcdir}/${pkgname}-dev-${pkgver}/contrib/debian/copyright" "${pkgdir}/usr/share/doc/${pkgname}/copyright"
  install -Dm755 "${srcdir}/${pkgname}-dev-${pkgver}/contrib/debian/examples/koto.conf" "${pkgdir}/usr/share/doc/${pkgname}/examples/koto.conf"

  install -Dm644 "${srcdir}/${pkgname}-dev-${pkgver}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"

  install -Dm644 "${srcdir}/${pkgname}-dev-${pkgver}/doc/man/kotod.1" "${pkgdir}/usr/share/man/man1/kotod.1"
  install -Dm644 "${srcdir}/${pkgname}-dev-${pkgver}/doc/man/koto-cli.1" "${pkgdir}/usr/share/man/man1/koto-cli.1"
  install -Dm644 "${srcdir}/${pkgname}-dev-${pkgver}/doc/man/koto-fetch-params.1" "${pkgdir}/usr/share/man/man1/koto-fetch-params.1"

  install -Dm644 "${srcdir}/${pkgname}-dev-${pkgver}/contrib/kotod.bash-completion" "${pkgdir}/usr/share/bash-completion/completions/kotod"
  install -Dm644 "${srcdir}/${pkgname}-dev-${pkgver}/contrib/koto-cli.bash-completion" "${pkgdir}/usr/share/bash-completion/completions/koto-cli"
}
