# Maintainer: Kevin Stewart <kgstew96@gmail.com>
# pkgver must match a release tag whose assets include the RelayPony-linux-*.tar.gz builds.
pkgname=relaypony-bin
pkgver=2.2.1
pkgrel=1
pkgdesc="Encrypted, direct device-to-device file transfer - desktop app (prebuilt)"
arch=('x86_64' 'aarch64')
url="https://relaypony.app"
license=('Apache-2.0')
# The launcher preloads the system libfreetype so the native GTK file chooser renders (the bundled
# runtime's older copy otherwise breaks it). freetype2 must therefore be present; fontconfig already
# pulls it in, but we depend on it directly since the launcher uses it.
depends=('fontconfig' 'freetype2')
provides=('relaypony')
conflicts=('relaypony')
options=(!strip)
source=(
  "relaypony.desktop::https://raw.githubusercontent.com/norsehorse-dev/RelayPonyDesktop/v$pkgver/packaging/aur/relaypony.desktop"
  "relaypony.png::https://raw.githubusercontent.com/norsehorse-dev/RelayPonyDesktop/v$pkgver/packaging/relaypony.png"
)
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::https://github.com/norsehorse-dev/RelayPonyDesktop/releases/download/v$pkgver/RelayPony-linux-x86_64.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::https://github.com/norsehorse-dev/RelayPonyDesktop/releases/download/v$pkgver/RelayPony-linux-aarch64.tar.gz")
sha256sums=('16787da2f5519724ec1a4852d4f0d097ddbeaeecd07d1c6ee1578f95b70b55b0'
            '2c8c079a0c414667c138c3d4b3af8568b24f54a03e26f2b61bb31fa2747a122f')
sha256sums_x86_64=('88ab16972ff6de8d525b2565ca7333579995828614b36f5e46a87be8c2299a72')
sha256sums_aarch64=('4d2826377b78dc593d7991a287e15eede96a6664719d27e4570babee239ea228')

package() {
  install -dm755 "$pkgdir/opt/relaypony"
  cp -a "$srcdir/RelayPony/." "$pkgdir/opt/relaypony/"

  # The prebuilt tarball's launcher does not set the libfreetype preload, so wrap it here. Without
  # this the native GTK file chooser fails to render ("error occurred in libfreetype"). Both the
  # terminal command and the desktop entry (Exec=relaypony) go through this wrapper.
  install -dm755 "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/relaypony" <<'EOF'
#!/bin/sh
export LD_PRELOAD="libfreetype.so.6${LD_PRELOAD:+:$LD_PRELOAD}"
exec /opt/relaypony/bin/RelayPony "$@"
EOF
  chmod 755 "$pkgdir/usr/bin/relaypony"

  install -Dm644 "$srcdir/relaypony.desktop" "$pkgdir/usr/share/applications/relaypony.desktop"
  install -Dm644 "$srcdir/relaypony.png" "$pkgdir/usr/share/pixmaps/relaypony.png"
}
