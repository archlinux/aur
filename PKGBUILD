# Maintainer: Koutarou Tanaka <from.kyushu.island@gmail.com>

pkgname=koto
pkgver=1.1.0
pkgrel=1
pkgdesc="Decentralized and open source cryptocurrency"
arch=('x86_64')
url="https://ko-to.org"
license=(MIT)
depends=('bash' 'boost-libs' 'libevent' 'qpid-proton' 'zeromq')
makedepends=('boost' 'cargo' 'cmake' 'git' 'gmock' 'python' 'wget')
checkdepends=('python' 'python2' 'python2-pyzmq')
provides=('kotod' 'koto-cli' 'koto-tx' 'koto-fetch-params')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/KotoDevelopers/koto/archive/v1.1.0.tar.gz"
        "0001-fetch-param-directory-env.patch"
        "0002-libsnark-no-gtest.patch"
        "0003-use-system-rust.patch"
        "koto.install")
sha256sums=('d223a78abb90cf0cc915ef45007c6c28a478ba42aca93964b0d0f0a8a373cdd6'
            '3c45dfa284108753ad2610a74b6f62b37b891c19792360cd0db92f305d5e449d'
            '6a94d1d5a2dbafeb987444fac42a9992f6561b62b84f2a832ba286c3095744a8'
            '6d36dca0f576712ced711a56b214412c23f0b156bd5c00e1ee4f9fec1c666d0d'
            'd14f12274330dd30ac8430a086eef08b657c3b1dc4024c82aa59eab50e5fc366')
install=koto.install

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  patch -p1 -i "${srcdir}/0001-fetch-param-directory-env.patch"
  patch -p1 -i "${srcdir}/0002-libsnark-no-gtest.patch"
  patch -p1 -i "${srcdir}/0003-use-system-rust.patch"

  # Runs forever
  sed -e '/prioritisetransaction.py/d' -i qa/pull-tester/rpc-tests.sh
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  cd depends
  make install \
      native_packages='' \
      packages='bdb crate_libc librustzcash'
  cd ..

  BUILD="$(./depends/config.guess)"
  HOST="$BUILD"
  CPPFLAGS="${CPPFLAGS} -I${PWD}/depends/${BUILD}/include"
  LDFLAGS="${LDFLAGS} -L${PWD}/depends/${BUILD}/lib"

  ./autogen.sh
  depends_prefix="${PWD}/depends/${BUILD}" ./configure --prefix=/usr \
                                                       --build=$BUILD \
                                                       --enable-hardening \
                                                       --enable-proton=no \
                                                       --enable-werror
  make
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
}

package() {
  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/usr/share/doc/koto/examples"
  mkdir -p "${pkgdir}/usr/share/licenses/koto"
  mkdir -p "${pkgdir}/usr/share/man/man1"
  mkdir -p "${pkgdir}/usr/share/bash-completion/completions"

  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/src/koto-cli" "${pkgdir}/usr/bin/koto-cli"
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/src/kotod" "${pkgdir}/usr/bin/kotod"
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/src/koto-tx" "${pkgdir}/usr/bin/koto-tx"
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/zcutil/fetch-params.sh" "${pkgdir}/usr/bin/koto-fetch-params"

  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/doc/release-notes/release-notes-1.0.14.md" "${pkgdir}/usr/share/doc/${pkgname}/changelog"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/contrib/debian/copyright" "${pkgdir}/usr/share/doc/${pkgname}/copyright"
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/contrib/debian/examples/koto.conf" "${pkgdir}/usr/share/doc/${pkgname}/examples/koto.conf"

  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"

  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/doc/man/kotod.1" "${pkgdir}/usr/share/man/man1/kotod.1"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/doc/man/koto-cli.1" "${pkgdir}/usr/share/man/man1/koto-cli.1"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/doc/man/koto-fetch-params.1" "${pkgdir}/usr/share/man/man1/koto-fetch-params.1"

  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/contrib/kotod.bash-completion" "${pkgdir}/usr/share/bash-completion/completions/kotod"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/contrib/koto-cli.bash-completion" "${pkgdir}/usr/share/bash-completion/completions/koto-cli"
}
