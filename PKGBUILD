# Maintainer: Aleksey Smirnov <debugger94 at gmail dot com>

_pkgname=amneziavpn
pkgname=$_pkgname-bin
pkgver=5.0.3.0
pkgrel=2
pkgdesc="Amnezia VPN Client"
arch=('x86_64')
url="https://github.com/amnezia-vpn/amnezia-client"
license=('GPL-3.0-only')
optdepends=(
  'xcb-util-cursor: X11 cursor support'
  'xcb-util-wm: X11 window manager interaction support'
)
makedepends=('binwalk' 'p7zip')
provides=($_pkgname)
conflicts=($_pkgname{,-git})
options=(!debug)
install=$_pkgname.install
source=($_pkgname-$pkgver.run::$url/releases/download/$pkgver/AmneziaVPN_${pkgver}_linux_x64.run)
sha256sums=('0335f2643f58c4d7494be4c6d47582574fa7e5a463450e9a47b0c5c2eda797c2')

# TODO: Remove this when dev merges [fix: bundle qtwayland in linux builds](https://github.com/amnezia-vpn/amnezia-client/pull/3139)
if [[ ${AMNEZIAVPN_BUNDLE_WAYLAND_PLUGIN-true} == true ]]; then
  _bndlqtver=6.10.1-1

  makedepends+=('patchelf')
  source+=(
    qt6-base-$_bndlqtver.tar.zst::https://archive.archlinux.org/packages/q/qt6-base/qt6-base-$_bndlqtver-x86_64.pkg.tar.zst
    qt6-wayland-$_bndlqtver.tar.zst::https://archive.archlinux.org/packages/q/qt6-wayland/qt6-wayland-$_bndlqtver-x86_64.pkg.tar.zst
  )
  sha256sums+=(
    'd29607b32affcb7fb523cf2d39960e43cc07859f3262b83500532f495175e6de'
    '1f72bc0986e737f61cf5d4bdf2381ea835f348642063edd2591b136ba8f5118c'
  )
  noextract=(qt6-{base,wayland}-$_bndlqtver.tar.zst)
fi

prepare() {
  # Rip archives from the installer and extract them
  binwalk -qe -y=7zip $_pkgname-$pkgver.run

  # Flatten the file tree
  rm -rf AmneziaVPN && mkdir AmneziaVPN
  for item in extractions/$_pkgname-$pkgver.run.extracted/*/*; do
    [ -e "$item" ] || continue
    mv "$item" AmneziaVPN
  done

  # Cleanup
  rm -rf extractions

  # Fix the desktop file
  sed -i 's#/usr/share/pixmaps/AmneziaVPN.png#AmneziaVPN#g' "$srcdir"/AmneziaVPN/AmneziaVPN.desktop

  # TODO: Remove this when dev merges [fix: bundle qtwayland in linux builds](https://github.com/amnezia-vpn/amnezia-client/pull/3139)
  if [[ ${AMNEZIAVPN_BUNDLE_WAYLAND_PLUGIN-true} == true ]]; then
    bsdtar -xf qt6-base-$_bndlqtver.tar.zst -C AmneziaVPN --strip-components=1 \
           usr/lib/libQt6WaylandClient.so.6{,.10.1}

    bsdtar -xf qt6-base-$_bndlqtver.tar.zst -C AmneziaVPN --strip-components=3 \
           usr/lib/qt6/plugins/platforms/libqwayland.so \
           usr/lib/qt6/plugins/wayland-{decoration-client/libbradient,graphics-integration-client/libqt-plugin-wayland-egl,shell-integration/libxdg-shell}.so

    bsdtar -xf qt6-wayland-$_bndlqtver.tar.zst -C AmneziaVPN --strip-components 3 \
           usr/lib/qt6/plugins/wayland-decoration-client/libadwaita.so

    patchelf --set-rpath '$ORIGIN/../../lib' AmneziaVPN/plugins/platforms/libqwayland.so
  fi
}

package() {
  mkdir -p "$pkgdir"/{opt/AmneziaVPN,usr/bin}/
  cp -a "$srcdir"/AmneziaVPN/{bin,lib,plugins,qml,translations}/ "$pkgdir"/opt/AmneziaVPN/
  ln -rs "$pkgdir"/opt/AmneziaVPN/bin/AmneziaVPN "$pkgdir"/usr/bin/AmneziaVPN

  install -Dm644 "$srcdir"/AmneziaVPN/AmneziaVPN.service -t "$pkgdir"/usr/lib/systemd/system/
  install -Dm644 "$srcdir"/AmneziaVPN/AmneziaVPN.desktop -t "$pkgdir"/usr/share/applications/
  install -Dm644 "$srcdir"/AmneziaVPN/AmneziaVPN.png     -t "$pkgdir"/usr/share/icons/hicolor/512x512/apps/
}
