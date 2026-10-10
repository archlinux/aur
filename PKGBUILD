# Maintainer: Anatoly Rugalev <anatoly.rugalev@gmail.com>
#
# Rendered by hottyterm's packaging/aur/publish.sh from packaging/aur/PKGBUILD
# in github.com/neuroplastio/hottyterm; change it there.
#
# The Linux build of a hottyterm release, as it is, in /usr/lib/hottyterm: it
# finds its library and its resources (share/ghostty) beside its binary. What
# the desktop looks for by hottyterm's application id goes where it looks: the
# command, the desktop entry, the D-Bus and systemd services, the icons and
# the metainfo. What still names Ghostty (completions, man pages, terminfo)
# stays in /usr/lib/hottyterm, so an installed Ghostty keeps its own.
#
# pkgver is the release's day, then its commit as r<count>.<short>, so two
# releases of one day sort in the order they were made.
pkgname=hottyterm-bin
_pkgname=hottyterm
pkgver=26.10.10.r73.4ba1666
pkgrel=1
_release=26.10.10-dev.4ba1666
pkgdesc="A fork of Ghostty with native HOTTY (HTML over the TTY)"
arch=('x86_64')
url="https://github.com/neuroplastio/hottyterm"
license=('MIT')
depends=('fontconfig' 'glib2' 'glibc' 'gtk4' 'gtk4-layer-shell' 'hicolor-icon-theme'
         'libadwaita' 'libgcc' 'libglvnd' 'libx11' 'wayland')
provides=("$_pkgname")
conflicts=("$_pkgname")
# Built and stripped by hottyterm's CI: nothing for makepkg to strip, and no
# debug package.
options=('!strip' '!debug')
source_x86_64=("hottyterm-${_release}-linux-${CARCH}.tar.gz::https://github.com/neuroplastio/hottyterm/releases/download/${_release}/hottyterm-${_release}-linux-${CARCH}.tar.gz")
sha256sums_x86_64=('309354a31fe0935a84264680c40615dd4d324efa2cf2a0b59fa2145b4969e639')

package() {
  local id=io.github.neuroplastio.hottyterm f
  local home="$pkgdir/usr/lib/$_pkgname"

  install -d "$pkgdir/usr/lib"
  cp -a "$_pkgname" "$home"
  # Ghostty's VT library and its headers, which hottyterm does not use, and
  # its Nautilus extension, which Nautilus would never find here.
  rm -rf "$home/include" "$home/lib/libghostty-vt."* "$home/share/pkgconfig" \
    "$home/share/nautilus-python"

  install -d "$pkgdir/usr/bin"
  ln -s "/usr/lib/$_pkgname/bin/$_pkgname" "$pkgdir/usr/bin/$_pkgname"

  # The build wrote the path it was built at into these; installed, the
  # command is /usr/bin/hottyterm.
  for f in "applications/$id.desktop" "dbus-1/services/$id.service" "kio/servicemenus/$id.desktop"; do
    install -d "$pkgdir/usr/share/${f%/*}"
    sed -E "s#/[^ =]*/bin/$_pkgname#/usr/bin/$_pkgname#g" "$_pkgname/share/$f" > "$pkgdir/usr/share/$f"
  done
  install -d "$pkgdir/usr/lib/systemd/user"
  sed -E "s#/[^ =]*/bin/$_pkgname#/usr/bin/$_pkgname#g" "$_pkgname/share/systemd/user/app-$id.service" \
    > "$pkgdir/usr/lib/systemd/user/app-$id.service"
  install -Dm644 "$_pkgname/share/metainfo/$id.metainfo.xml" "$pkgdir/usr/share/metainfo/$id.metainfo.xml"
  cp -a "$_pkgname/share/icons" "$pkgdir/usr/share/icons"

  install -Dm644 "$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$_pkgname/THIRD-PARTY-NOTICES.txt" "$pkgdir/usr/share/licenses/$pkgname/THIRD-PARTY-NOTICES.txt"
}
