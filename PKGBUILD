# Maintainer: Felipe BF <fprgw32 at gmail dot com>
# Contributor: Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: dr460nf1r3 <dr460nf1r3 at garudalinux dot org>
# Contributor: Max Niederman <max@maxniederman.com>

_name="ttyper"
pkgname="${_name}-git"
pkgver=1.6.0.r15.ge218bad
pkgrel=1
pkgdesc="Terminal-based typing test"
arch=('x86_64' 'aarch64' 'i686' 'armv7h')
url="https://github.com/max-niederman/${_name}"
license=("MIT")
provides=("${_name}=${pkgver%%.r*}")
conflicts=("${_name}")
depends=('gcc-libs' 'glibc')
makedepends=('cargo' 'git')

_pkgsrc="${_name}"
source=("${_pkgsrc}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgsrc}"
  git describe --long --tags --abbrev=7 | sed 's/v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${srcdir}/${_pkgsrc}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "${srcdir}/${_pkgsrc}"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -vDm755 "target/release/${_name}" "${pkgdir}/usr/bin/${_name}"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${_name}/README.md"
  install -vDm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE.md"
}

