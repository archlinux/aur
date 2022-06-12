_pkgname='akula'
pkgname="$_pkgname-git"
pkgver=0.1.0.r1
pkgrel=1
pkgdesc='Next generation Ethereum implementation.'
arch=('x86_64' 'aarch64')
license=('Apache-2.0')
makedepends=('git' 'clang' 'rustup')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=(
  'git+https://github.com/akula-bft/akula.git'
  'akula.service'
)
sha256sums=(
  'SKIP'
  'f7f4c5110f078ff57e91fb359ba88441a33fc1beaf6ba687c7cbfc6d2be717f5'
)

pkgver() {
  cd "${srcdir}/${_pkgname}"
  echo "0.1.0.r$(git rev-list --all --count)"
  # git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${_pkgname}"

  env CARGO_TARGET_DIR=${srcdir}/${_pkgname}/target cargo build --profile=production
}

package() {

  cd "${srcdir}/${_pkgname}"

  install -D -m755 "target/production/akula" "${pkgdir}/usr/bin/akula"
  install -D -m755 "target/production/akula-rpc" "${pkgdir}/usr/bin/akula-rpc"
  install -D -m755 "target/production/akula-sentry" "${pkgdir}/usr/bin/akula-sentry"
  install -D -m755 "target/production/akula-toolbox" "${pkgdir}/usr/bin/akula-toolbox"
  install -D -m644 ../../akula.service "${pkgdir}/usr/lib/systemd/user/akula.service"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
