# Maintainer: HorneroOS contributors <https://github.com/HorneroOS/greeter>
pkgname=hornero-greeter
pkgver=1.0.0
pkgrel=1
pkgdesc='HorneroOS SDDM greeter theme (Argentina footage, offline)'
arch=('any')
url='https://github.com/HorneroOS/greeter'
license=('GPL-3.0-only')
depends=('sddm' 'qt5-multimedia' 'gst-plugins-good')
optdepends=('hornero-greeter-media-base: Argentina video pack')
# Named "$pkgname" so the checkout lands at "${srcdir}/$pkgname";
# package() below only ever reads from there, so AUR chroot builds
# behave exactly like local packaging/ builds.
source=("$pkgname::git+https://github.com/HorneroOS/greeter.git")
sha256sums=('SKIP')

package() {
  local src="$srcdir/$pkgname" dest="$pkgdir/usr/share/sddm/themes/hornero/"
  install -d "$dest"
  # Theme payload: QML, configs, static fallback (all required).
  install -Dm644 "$src/Main.qml" "${dest}Main.qml"
  for f in theme.conf theme.conf.user metadata.desktop background.jpg; do
    install -Dm644 "$src/$f" "${dest}$f"
  done
  cp -a "$src/components" "$dest"
  # Runtime video catalog (generated from media/catalog.json, committed):
  # entries resolve clips under media/base/ relative to the theme root.
  install -Dm644 "$src/media/catalog.js" "${dest}media/catalog.js"
  # Bridge to the optional hornero-greeter-media-base pack. The link dangles
  # when the pack is absent; the deck then skips the missing files and holds
  # the static fallback, so the theme works with or without the pack.
  ln -sfn /usr/share/hornero/greeter/media/base "${dest}media/base"
  # Layered SDDM snippet: selects this theme WITHOUT rewriting /etc/sddm.conf.
  install -Dm644 "$src/packaging/arch/hornero-greeter/hornero.conf" \
    "$pkgdir/etc/sddm.conf.d/10-hornero.conf"
  # sddm-readable permissions throughout.
  find "$pkgdir" -type d -exec chmod 0755 {} +
  find "$pkgdir" -type f -exec chmod 0644 {} +
}
