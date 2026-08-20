# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=enroll
_app_id="org.cosmic_utils.$pkgname"
pkgver=1.2.4
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
sha256sums=('fef406540047c29bc0ee978de979bcdd8ff49c2abb28d9843ffa48310fdabee3')

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
  export GETTEXT_SYSTEM=true
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
