# Maintainer: RiverOnVenus <aur@zhui.dev>

pkgname=claude-cage-bin
pkgver=0.1.7rc.1
_upver=0.1.7-rc.1
pkgrel=1
pkgdesc='Isolated Claude development workspace with a local virtual machine'
arch=('x86_64')
url='https://github.com/Lee-xeo/Claude-Cage'
license=('MIT' 'Apache-2.0' 'BSD-2-Clause' 'BSD-3-Clause' 'GPL-3.0-only' 'ISC' 'MPL-2.0')
depends=('ca-certificates' 'cairo' 'gdk-pixbuf2' 'glib2' 'gtk3' 'json-glib' 'pango' 'webkit2gtk-4.1')
optdepends=(
  'qemu-system-x86: local virtual machines'
  'qemu-img: create and inspect virtual disk images'
  'edk2-ovmf: UEFI firmware for local guests'
  'openssh: connect to remote Cage servers'
  'git: share host repositories with guests'
  'noto-fonts-cjk: CJK fonts in the workbench'
  'libnotify: desktop notifications'
  'zenity: file dialogs outside GTK desktops'
  'kdialog: file dialogs on KDE'
)
source=("Cage-${_upver}-linux-amd64.deb::${url}/releases/download/v${_upver}/Cage-${_upver}-linux-amd64.deb")
sha256sums=('eced2a3b448559c75a349b3d09792bcca955d0885f1a9aaed87f65fe451bbf96')

prepare() {
  bsdtar -xf "Cage-${_upver}-linux-amd64.deb" -C "$srcdir" 'data.tar.*'
  install -dm755 "$srcdir/payload"
  bsdtar -xf "$srcdir"/data.tar.* -C "$srcdir/payload"
}

check() {
  # Cage writes its profile under $HOME, so keep the smoke test self-contained.
  export HOME="$srcdir/home"
  install -dm755 "$HOME"

  "$srcdir/payload/usr/lib/claude-cage/cage" help >/dev/null
  "$srcdir/payload/usr/lib/claude-cage/cage-desktop" --self-test
}

package() {
  local _app="$srcdir/payload/usr/lib/claude-cage"

  install -dm755 "$pkgdir/usr/lib/claude-cage"
  install -m755 "$_app"/{cage,cage-desktop,mihomo} "$pkgdir/usr/lib/claude-cage/"
  install -m644 "$_app"/{VERSION,cloud-linux-amd64.tar,cloud-linux-amd64.tar.sha256} \
    "$pkgdir/usr/lib/claude-cage/"

  install -dm755 "$pkgdir/usr/bin"
  ln -s ../lib/claude-cage/cage "$pkgdir/usr/bin/claude-cage"
  ln -s ../lib/claude-cage/cage-desktop "$pkgdir/usr/bin/cage-desktop"

  install -Dm644 "$srcdir/payload/usr/share/applications/io.github.lee_xeo.Cage.desktop" \
    -t "$pkgdir/usr/share/applications"
  install -Dm644 "$srcdir/payload/usr/share/icons/hicolor/512x512/apps/io.github.lee_xeo.Cage.png" \
    -t "$pkgdir/usr/share/icons/hicolor/512x512/apps"
  install -Dm644 "$srcdir/payload/usr/share/doc/claude-cage/README.md" \
    "$pkgdir/usr/share/doc/claude-cage-bin/README.md"

  # The vendor ships the notices beside the payload; pacman tracks them as licenses.
  install -dm755 "$pkgdir/usr/share/licenses/claude-cage-bin"
  cp -a "$_app/licenses/." "$pkgdir/usr/share/licenses/claude-cage-bin/"
}
