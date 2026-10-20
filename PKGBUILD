# Maintainer: AuthenticSm1les <khidarlaminehamdi@gmail.com>
pkgname=cosmic-tasks
_pkgname=tasks
_app_id=dev.edfloreshz.Tasks
pkgver=0.3.1
pkgrel=1
pkgdesc="A simple task management application for the COSMIC desktop"
arch=('x86_64' 'aarch64')
url="https://github.com/cosmic-utils/tasks"
license=('GPL-3.0')
depends=(
  'alsa-lib'
  'at-spi2-core'
  'cairo'
  'dbus'
  'expat'
  'hicolor-icon-theme'
  'libcups'
  'libx11'
  'libxcb'
  'libxcomposite'
  'libxdamage'
  'libxext'
  'libxfixes'
  'libxkbcommon'
  'libxrandr'
  'libcosmic-git'
  'mesa'
  'vulkan-icd-loader'
  'nspr'
  'nss'
  'pango'
  'systemd-libs'
)
makedepends=(
  'cargo'
  'git'
)
checkdepends=(
  'appstream'
  'desktop-file-utils'
)
source=("git+https://github.com/cosmic-utils/tasks.git#tag=$pkgver")
sha256sums=('SKIP')

prepare() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$(rustc --print host-tuple)"
}

build() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo build --release
}

check() {
  cd "$_pkgname"
  appstreamcli validate --no-net "res/${_app_id}.metainfo.xml"
  desktop-file-validate "res/${_app_id}.desktop"
}

package() {
  cd "$_pkgname"
  install -Dm0755 "target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm0644 "res/${_app_id}.desktop" "$pkgdir/usr/share/applications/${_app_id}.desktop"
  install -Dm0644 "res/${_app_id}.metainfo.xml" "$pkgdir/usr/share/metainfo/${_app_id}.metainfo.xml"
  install -Dm0644 "res/icons/hicolor/scalable/apps/${_app_id}.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/${_app_id}.svg"
}
