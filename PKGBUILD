# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=enroll
_app_id="org.cosmic_utils.$pkgname"
pkgver=1.2.12
pkgrel=1
pkgdesc="GUI application for fingerprint management designed for COSMIC DE."
arch=('x86_64' 'aarch64')
url="https://cosmic-utils.org/enroll"
license=('MPL-2.0')
depends=(
  'fprintd'
  'glibc'
  'hicolor-icon-theme'
  'libgcc'
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
source=("git+https://github.com/cosmic-utils/enroll.git#tag=v$pkgver")
sha256sums=('97e69255974953786529e35031cc294bb18356f9d957c80bd7bdc5c94675358a')

prepare() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target host-tuple

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
  appstreamcli validate --no-net "resources/${_app_id}.metainfo.xml"
  desktop-file-validate "resources/${_app_id}.desktop"
}

package() {
  cd "$pkgname"
  just rootdir="$pkgdir" install

  ln -s "/usr/bin/cosmic-utils-$pkgname" "$pkgdir/usr/bin/$pkgname"
}
