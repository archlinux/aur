# Maintainer: Kisaragi Fuurin <NicoleSandwich@outlook.com>
# Upstream publishes a self-contained tarball (Tauri binary + bundled Node/Pi
# agent runtime), so this is a -bin package; there is no source build here.
pkgname=tomato-todo-bin
pkgver=0.8.2
pkgrel=1
pkgdesc='任务与番茄钟，一个安静的专注空间'
arch=('x86_64')
url='https://github.com/AntheaLaffy/tomato-todo'
license=('MIT')
depends=('gtk3' 'webkit2gtk-4.1' 'libayatana-appindicator' 'hicolor-icon-theme')
provides=('tomato-todo')
conflicts=('tomato-todo')
options=('!strip' '!debug')
source=("https://github.com/AntheaLaffy/tomato-todo/releases/download/v$pkgver/tomato-todo-$pkgver-$CARCH-linux.tar.gz"
        'tomato-todo.desktop'
        'LICENSE')
sha256sums=('b0f0d071f3063db78852ee059795caca8017cc9e247e8af52595b7146e7106ea'
            '27016ccfec6a99754468979a18484c1d342dfb1d1727e118e2cf9037b0825ff5'
            '35ac48fb83d92346f4ea881dac8304e85111c7352aaf214b2fd9bb9169dcd001')

package() {
  install -Dm755 "$srcdir/tomato-todo" "$pkgdir/usr/bin/tomato-todo"

  # Tauri resolves bundled resources from /usr/lib/<product name>, and the
  # product name is "Tomato Todo" (a space, not the Cargo package name).
  install -d "$pkgdir/usr/lib/Tomato Todo"
  cp -a "$srcdir/agent" "$pkgdir/usr/lib/Tomato Todo/agent"

  # The tarball keeps npm's absolute .bin symlinks from the CI runner
  # (/home/runner/...), which dangle on every other machine. The runtime
  # spawns node with explicit paths and the sandbox PATH never includes .bin,
  # so drop the shim directory instead of shipping broken links.
  rm -rf "$pkgdir/usr/lib/Tomato Todo/agent/node_modules/.bin"

  install -Dm644 "$srcdir/icons/32x32.png"       "$pkgdir/usr/share/icons/hicolor/32x32/apps/tomato-todo.png"
  install -Dm644 "$srcdir/icons/128x128.png"     "$pkgdir/usr/share/icons/hicolor/128x128/apps/tomato-todo.png"
  install -Dm644 "$srcdir/icons/128x128@2x.png"  "$pkgdir/usr/share/icons/hicolor/256x256/apps/tomato-todo.png"

  install -Dm644 "$srcdir/tomato-todo.desktop" "$pkgdir/usr/share/applications/tomato-todo.desktop"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
