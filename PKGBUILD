# Maintainer: asafelobotomy <213836723+asafelobotomy@users.noreply.github.com>
#
# GutCheck from a tagged release's AppImage, unpacked into /opt/gutcheck. The
# launcher runs the app; `gutcheck --cli <command>` and `gutcheck --mcp` run it
# headless. Unlike the AppImage's own desktop entry this keeps Chromium's sandbox
# on. After editing, regenerate .SRCINFO: makepkg --printsrcinfo > .SRCINFO

pkgname=gutcheck-bin
_appname=GutCheck
pkgver=0.29.0
pkgrel=1
pkgdesc='Check the health of every git repo in a folder: CI, PRs, branches, uncommitted work and more'
arch=('x86_64')
url='https://github.com/asafelobotomy/gutcheck'
license=('MIT')
depends=('alsa-lib' 'gtk3' 'nss' 'git' 'github-cli' 'hicolor-icon-theme')
optdepends=('libnotify: notifications when a scheduled scan finds something new')
provides=('gutcheck')
conflicts=('gutcheck')
options=('!strip' '!debug')
source=("$_appname-$pkgver-x86_64.AppImage::$url/releases/download/v$pkgver/$_appname-$pkgver-x86_64.AppImage"
        "LICENSE-$pkgver::https://raw.githubusercontent.com/asafelobotomy/gutcheck/v$pkgver/LICENSE")
noextract=("$_appname-$pkgver-x86_64.AppImage")
sha256sums=('862447e9133175ce19a81213acbd283194a39f103d5e357ac2fc1d974bc11dd2'
            'b96b5a0ecb11e311dab94d71fe36add411fd2110b624d336a6e54cc74aba3e4b')

prepare() {
  chmod +x "$_appname-$pkgver-x86_64.AppImage"
  rm -rf squashfs-root
  "./$_appname-$pkgver-x86_64.AppImage" --appimage-extract >/dev/null
  # The AppImage's entry turns the sandbox off and starts AppRun; run the app itself, sandboxed.
  sed -i -e 's|^Exec=.*|Exec=gutcheck %U|' -e '/^X-AppImage-/d' squashfs-root/gutcheck.desktop
}

package() {
  install -d "$pkgdir/opt/gutcheck"
  cp -a squashfs-root/. "$pkgdir/opt/gutcheck/"
  rm -rf "$pkgdir/opt/gutcheck/"{AppRun,.DirIcon,gutcheck.desktop,gutcheck.png,usr}
  find "$pkgdir/opt/gutcheck" -type d -exec chmod 755 {} +
  # Chromium's setuid sandbox helper, for kernels without unprivileged user namespaces.
  chmod 4755 "$pkgdir/opt/gutcheck/chrome-sandbox"

  install -d "$pkgdir/usr/bin"
  ln -s /opt/gutcheck/gutcheck "$pkgdir/usr/bin/gutcheck"
  install -Dm644 squashfs-root/gutcheck.desktop "$pkgdir/usr/share/applications/gutcheck.desktop"
  install -Dm644 squashfs-root/usr/share/icons/hicolor/512x512/apps/gutcheck.png \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/gutcheck.png"
  install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
