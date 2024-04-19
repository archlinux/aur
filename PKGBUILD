# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: Luis Martinez (https://aur.archlinux.org/account/lmartinez-mirror)

pkgname=amdgpud-git
_name="${pkgname%-git}"
pkgver=1.0.12+15.r139.20240411.2d20203
pkgrel=1
pkgdesc="Fan control service for AMD GPUs."
arch=('x86_64')
url="https://github.com/eraden/amdgpud"
license=('Apache-2.0' 'MIT')
depends=(
  'gcc-libs'
)
makedepends=(
  'git'
  # 'cargo'
  'rustup' # 2023-11-27: -nightly is needed because otherwise compilation errors out with `error[E0554]: `#![feature]` may not be used on the stable release channel`.
  # 'rust-nightly' # 2023-11-27: -nightly is needed because otherwise compilation errors out with `error[E0554]: `#![feature]` may not be used on the stable release channel`.
)
provides=("$_name")
conflicts=("$_name")
backup=("etc/$_name/config.toml")
source=(
  "$pkgname::git+$url"
  'config.toml'
)
sha256sums=(
  'SKIP'
  '708070794d89e86d307fd17009e0410adf49adc471cfcde0fdec1f217c85f0de'
)
validpgpkeys=()

# export RUSTUP_TOOLCHAIN=stable
export RUSTUP_TOOLCHAIN=nightly
export CARGO_TARGET_DIR=target

pkgver() {
  export CARGO_HOME="${srcdir}/.cargo"

  cd "${srcdir}/${pkgname}"

  _ver="$(git describe  --tags | sed 's|^[vV]||' | sed 's|-g[0-9a-fA-F]*$||' | tr '-' '+')"
  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_ver}" ]; then
    error "Version could not be determined."
    return 1
  else
    printf '%s' "${_ver}.r${_rev}.${_date}.${_hash}"
  fi
}

prepare() {
  export CARGO_HOME="${srcdir}/.cargo"
  rustup default nightly

  cd "${srcdir}/${pkgname}"

  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  export CARGO_HOME="${srcdir}/.cargo"

  cd "${srcdir}/${pkgname}"

  cargo build --release --frozen --all-features --target="$CARCH-unknown-linux-gnu"
}

check() {
  export CARGO_HOME="${srcdir}/.cargo"

  cd "${srcdir}/${pkgname}"

  cargo test --frozen --all-features --target="$CARCH-unknown-linux-gnu"
}

package() {
  export CARGO_HOME="${srcdir}/.cargo"

  cd "${srcdir}/${pkgname}"

  find "target/$CARCH-unknown-linux-gnu/release/" \
    -maxdepth 1 \
    -executable \
    -type f \
    -exec install -Dvm755 -t "$pkgdir/usr/bin/" '{}' \+
  find services \
    -maxdepth 1 \
    -name '*.service' \
    -type f \
    -exec install -Dvm644 -t "$pkgdir/usr/lib/systemd/system/" '{}' \+
  install -Dvm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE*
  install -Dvm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
  install -Dvm644 -t "$pkgdir/etc/$_name/" "$srcdir/config.toml"
}
