# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=enroll
_app_id=org.cosmic_utils.enroll
pkgver=1.0.9
pkgrel=1
pkgdesc="GUI application for fingerprint management designed for COSMIC DE."
arch=('x86_64' 'aarch64')
url="https://cosmic-utils.org/enroll"
license=('MPL-2.0')
depends=(
  'fprintd'
  'hicolor-icon-theme'
  'libxkbcommon'
  'polkit'
)
makedepends=(
  'cargo'
  'git'
  'just'
)
checkdepends=(
  'appstream'
  'desktop-file-utils'
)
source=("git+https://github.com/cosmic-utils/enroll.git#tag=$pkgver")
sha256sums=('410daf5d839d1b37158dbfc0baf123816611e2f74ac410b832bd6b5ce5cca4da')

prepare() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target host-tuple

  # Correct appid
  sed -i "s/org.cosmic_utils.Enroll/${_app_id}/g" justfile

  # Use metainfo instead of deprecated appdata
  sed -i 's/appdata/metainfo/g' justfile
}

build() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  just build-release --frozen
}

check() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen

  appstreamcli validate --no-net "resources/${_app_id}.metainfo.xml"
  desktop-file-validate "resources/${_app_id}.desktop"
}

package() {
  cd "$pkgname"
  just rootdir="$pkgdir" install

  ln -s "/usr/bin/cosmic-utils-$pkgname" "$pkgdir/usr/bin/$pkgname"
}
