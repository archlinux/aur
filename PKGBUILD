# Maintainer: Kisaragi Fuurin <NicoleSandwich@outlook.com>
# Template rendered by scripts/publish-aur.mjs, which downloads each release and
# fills in the real hashes. Do not hand-edit the generated PKGBUILD in the AUR
# repository: change this file and re-run the script.
#
# Upstream publishes a self-contained tarball (Tauri binary + bundled Node/Pi
# agent runtime), so this is a -bin package; there is no source build here.
pkgname=tomato-todo-bin
pkgver=0.9.5
pkgrel=1
pkgdesc='任务与番茄钟，一个安静的专注空间'
arch=('x86_64')
url='https://github.com/AntheaLaffy/tomato-todo'
license=('MIT')
depends=('gtk3' 'webkit2gtk-4.1' 'libayatana-appindicator' 'hicolor-icon-theme' 'libpulse' 'gst-plugins-bad')
provides=('tomato-todo')
conflicts=('tomato-todo')
options=('!strip' '!debug')
source=("https://github.com/AntheaLaffy/tomato-todo/releases/download/v$pkgver/tomato-todo-$pkgver-$CARCH-linux.tar.gz"
        'tomato-todo.desktop'
        'LICENSE')
sha256sums=('9d66328f1b9ffe30b623f4c16a3ff5003b85ab7e7ea716b186afad2360de8eac'
            '27016ccfec6a99754468979a18484c1d342dfb1d1727e118e2cf9037b0825ff5'
            '35ac48fb83d92346f4ea881dac8304e85111c7352aaf214b2fd9bb9169dcd001')

package() {
  install -Dm755 "$srcdir/tomato-todo" "$pkgdir/usr/bin/tomato-todo"

  # Tauri resolves bundled resources from /usr/lib/<product name>, and the
  # product name is "Tomato Todo" (a space, not the Cargo package name).
  install -d "$pkgdir/usr/lib/Tomato Todo"
  cp -a "$srcdir/agent" "$pkgdir/usr/lib/Tomato Todo/agent"
  cp -a "$srcdir/desktop-integrations" "$pkgdir/usr/lib/Tomato Todo/desktop-integrations"
  install -Dm644 "$srcdir/install-desktop-integration.py" "$pkgdir/usr/lib/Tomato Todo/install-desktop-integration.py"

  # Releases before the bundle stopped shipping npm's absolute .bin shims carry
  # dangling links to the CI runner; drop them if present. Harmless once the
  # bundle is built by scripts/build-agent.mjs, which removes the directory.
  rm -rf "$pkgdir/usr/lib/Tomato Todo/agent/node_modules/.bin"

  install -Dm644 "$srcdir/icons/32x32.png"       "$pkgdir/usr/share/icons/hicolor/32x32/apps/tomato-todo.png"
  install -Dm644 "$srcdir/icons/128x128.png"     "$pkgdir/usr/share/icons/hicolor/128x128/apps/tomato-todo.png"
  install -Dm644 "$srcdir/icons/128x128@2x.png"  "$pkgdir/usr/share/icons/hicolor/256x256/apps/tomato-todo.png"

  install -Dm644 "$srcdir/tomato-todo.desktop" "$pkgdir/usr/share/applications/tomato-todo.desktop"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
