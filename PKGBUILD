# Maintainer: FranoGames

pkgname=euro-office-desktopeditors-git
pkgver=r320.16d1a01
pkgrel=1
pkgdesc="Fork of OnlyOffice"
arch=('x86_64')
url="https://github.com/Euro-Office/DesktopEditors"
license=('AGPL-3.0-only')
provides=('euro-office-desktopeditors')
depends=('libxrandr' 'libglvnd' 'expat' 'libxext' 'libxi' 'wayland' 'qt5-wayland' 'pango' 'libdrm' 'cairo' 'qt5-svg' 'bash' 'hunspell' 'gstreamer' 'libice' 'qt5-x11extras' 'glibc' 'libtiff5' 'libstdc++' 'gtk3' 'dbus' 'freetype2' 'libcups' 'qt5-base' 'mesa' 'gst-plugins-base-libs' 'libxkbcommon' 'libsm' 'glib2' 'hicolor-icon-theme' 'libxdamage' 'nss' 'libgcc' 'libxcomposite' 'libpulse' 'qt5-multimedia' 'libx11' 'fontconfig' 'at-spi2-core' 'libxkbcommon-x11' 'libnotify' 'qt5-declarative' 'alsa-lib' 'libxcb' 'harfbuzz' 'libxfixes' 'nspr')
makedepends=('docker' 'docker-buildx' 'git' 'libarchive')
source=("git+https://github.com/Euro-Office/DesktopEditors.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/DesktopEditors"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  if docker buildx inspect euro-office-desktopeditors-git &>/dev/null; then
    docker buildx rm --keep-state euro-office-desktopeditors-git
  fi
  docker buildx create --name euro-office-desktopeditors-git --driver docker-container
  cd "$srcdir/DesktopEditors"
  git submodule update --init --recursive
}

build() {
  cd "DesktopEditors/build/linux"
  BUILDX_BAKE_ENTITLEMENTS_FS=0 BUILDX_BUILDER=euro-office-desktopeditors-git ./build.sh
  rm -rf /tmp/euro-office
}

package() {
  cd "$srcdir/DesktopEditors/build/deploy/packages"
  bsdtar xvf $(ls | grep "x86_64.tar.xz")
  chmod +x "usr/bin/euro-office-desktopeditors"
  bsdtar xvf $(ls | grep "any.tar.xz")

  cp -r "$srcdir/DesktopEditors/build/deploy/packages/usr" "$pkgdir/"
  cp -r "$srcdir/DesktopEditors/build/deploy/packages/opt" "$pkgdir/"
}
