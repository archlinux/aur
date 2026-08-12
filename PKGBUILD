# Maintainer: fortime <palfortime@gmail.com>

_pkgbase=fcitx5-osk
pkgbase=fcitx5-osk-git
pkgname=(
    fcitx5-osk-git
    fcitx5-osk-kwin-launcher-git
)
_pkgver=0.2.1
pkgver=0.2.1.r0.g76a33b6
pkgrel=1
pkgdesc='An on-screen keyboard designed to work with Fcitx5, especially on KDE Plasma Wayland'
url='https://github.com/fortime/fcitx5-osk'
source=("git+https://github.com/fortime/fcitx5-osk")
arch=('x86_64')
license=('MIT')
makedepends=('cargo' 'git' 'cmake')
# Disable lto in `makepkg`, otherwise, aws_lc can't be built
options=(!lto)
depends=('fcitx5' 'ttf-font-nerd')
optdepends=('kwin: needed by kwin launcher')
sha256sums=(SKIP)

pkgver() {
  cd "$srcdir/$_pkgbase"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgbase"
  # We use a patched iced_layershell, so we can't use --offline
  #cargo fetch --offline --target "$(rustc -vV | sed -n 's|host: ||p')"
  cargo fetch --target "$(rustc -vV | sed -n 's|host: ||p')"
}

build () {
  cmake \
      -D CMAKE_INSTALL_PREFIX=/usr \
      -D DBUS_CONFIG_PARENT_DIR=/usr/share \
      -B "${srcdir}/build-${_pkgver}" \
      -S "$srcdir/$_pkgbase"
  cmake --build "${srcdir}/build-${_pkgver}"
}

package_fcitx5-osk-git() {
  DESTDIR="$pkgdir" cmake --install "${srcdir}/build-${_pkgver}" --component Fcitx5Osk
}

package_fcitx5-osk-kwin-launcher-git() {
  DESTDIR="$pkgdir" cmake --install "${srcdir}/build-${_pkgver}" --component Fcitx5OskKwinLauncher
}
