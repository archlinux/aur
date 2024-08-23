# Maintainer: Yuji Nakao <contact at yujinakao dot com>

pkgname=matrirc
pkgver=1.0
pkgrel=1
pkgdesc="irc gateway to matrix"
arch=(x86_64)
url="https://github.com/martinetd/matrirc"
license=('WTFPL')
depends=('gcc-libs' 'glibc' 'openssl' 'sqlite')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/martinetd/${pkgname}/archive/refs/tags/${pkgver}.tar.gz"
        "${pkgname}.service"
        "${pkgname}.sysusers"
        "${pkgname}.tmpfiles")
sha256sums=('a139d022b23951694f403f7b392d72ff887f26f3dce394f4c1f796f3054116d1'
            'b47df86911f82af9090f84b04376631a84ebc69a7347b7476f3cfdab2cab27c3'
            '45ecdbe6e339c1a84f39d09a9134dfe9fd5543bc5ddfb5c55c2156f21d503f6a'
            '5ad4c29dc31ced4572c9c5e0cc37adbedbb420b3159ad34288c8555f0eaa40ed')

prepare() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm 755 "target/release/${pkgname}" -t "${pkgdir}/usr/bin/"
  install -Dm 644 "${srcdir}/${pkgname}.service" -t "${pkgdir}/usr/lib/systemd/system/"
  install -Dm 644 "${srcdir}/${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
  install -Dm 644 "${srcdir}/${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
}

# vim: ts=2 sw=2 et:
