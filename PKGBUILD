# Maintainer: Tim Falken <tim@timfalken.com>
# CI (scripts/ci/publish-aur.sh) sets pkgver, _tag and sha256sums.
pkgname=paperdoll-renderer-bin
pkgver=0.1.6
pkgrel=1
_tag=v0.1.6
pkgdesc='Paperdoll Renderer: sprite/paperdoll renders from glTF/FBX bodies with a live preview (prebuilt binary)'
arch=('x86_64')
url='https://git.timfalken.com/golden-age/paperdoll-renderer'
license=('MIT' 'custom:Sketchfab-Standard')
depends=('gcc-libs' 'glibc' 'libxcb' 'libx11' 'libxkbcommon' 'libxkbcommon-x11' 'libglvnd'
         'shared-mime-info' 'desktop-file-utils' 'xdg-desktop-portal' 'zenity')
provides=('paperdoll-renderer')
conflicts=('paperdoll-renderer')
options=('!strip' '!debug')
source=("paperdoll-renderer-${_tag}-amd64.deb::${url}/-/releases/${_tag}/assets/paperdoll-renderer-${_tag}-amd64.deb")
sha256sums=('dc33eedb593c3e05d516e6276bbd5d48a037e1e672bdaaa0ed59ec83ebc70e9a')
noextract=("paperdoll-renderer-${_tag}-amd64.deb")

prepare() {
  mkdir -p "$srcdir/deb"
  cd "$srcdir/deb"
  bsdtar -xf "$srcdir/paperdoll-renderer-${_tag}-amd64.deb"
  mkdir -p root
  bsdtar -xf data.tar.* -C root
}

package() {
  local r="$srcdir/deb/root/usr"
  install -Dm755 "$r/bin/paperdoll-renderer" "$pkgdir/usr/bin/paperdoll-renderer"
  install -Dm644 "$r/share/applications/paperdoll-renderer.desktop" \
    "$pkgdir/usr/share/applications/paperdoll-renderer.desktop"
  install -Dm644 "$r/share/mime/packages/paperdoll-project.xml" \
    "$pkgdir/usr/share/mime/packages/paperdoll-project.xml"
  install -Dm644 "$r/share/metainfo/paperdoll-renderer.metainfo.xml" \
    "$pkgdir/usr/share/metainfo/paperdoll-renderer.metainfo.xml"
  local icon
  for icon in "$r"/share/icons/hicolor/*/apps/paperdoll-renderer.*; do
    install -Dm644 "$icon" "$pkgdir/usr/share/icons/hicolor/${icon#"$r/share/icons/hicolor/"}"
  done
  install -Dm644 "$r/share/licenses/paperdoll-renderer/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$r/share/licenses/paperdoll-renderer/THIRD_PARTY_NOTICES.md" \
    "$pkgdir/usr/share/licenses/$pkgname/THIRD_PARTY_NOTICES.md"
}
