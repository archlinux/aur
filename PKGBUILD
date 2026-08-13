# Maintainer: knightinfected <hmzmahmood5@gmail.com>

# Renamed from `pipewire-controller` (2026-08-10). An unrelated PyQt6 tray
# applet holds that name on PyPI and installs the same /usr/bin binary and the
# same .desktop filename, so the two could not coexist. The application itself
# is still called PipeWire Controller — only the package, the command and the
# desktop entry changed. `pipewire-controller` remains on the AUR as a
# transitional package depending on this one, so existing users migrate on an
# ordinary -Syu. Push THIS package first; the transitional stub is unbuildable
# until it exists.

# v0.5.0 is the first release carrying the rename (v0.4.0 still ships the old
# filenames, so this package cannot be built against it).
pkgname=pipewire-control-center
pkgver=0.5.0
pkgrel=2
# NB the AUR rejects a pkgdesc over 255 characters ("pkgdesc field too long",
# hook declined) — the first push of this package hit exactly that at 275. Keep
# this line short; it is currently 241.
pkgdesc="GTK4/libadwaita control center for PipeWire — signal paths routing apps through effect chains to any output, parametric equalizer, live meters, mic cleanup, patchbay, monitoring, virtual devices, filter chains, HRIR surround, drop-in configs"
arch=('any')
url="https://github.com/knightinfected/PipeWireController"
license=('GPL-3.0-or-later')
# python-cairo is REQUIRED, not optional: pwctl/ui/paths_page.py imports cairo
# at module scope and app.py imports that page at startup, so without it the
# application does not launch at all (ModuleNotFoundError: No module named
# 'cairo'). It is only an *optdepend* of python-gobject, so it is absent on a
# clean system — and present on most development machines, which is why this
# was missed until a user reported it. Every Gtk.DrawingArea in the app needs
# pycairo's foreign-struct converter regardless of the explicit import.
depends=('pipewire' 'wireplumber' 'pipewire-pulse' 'gtk4' 'libadwaita'
         'python' 'python-gobject' 'python-cairo' 'python-numpy'
         'python-soundfile')
optdepends=('noise-suppression-for-voice: RNNoise noise-cancelling mic template'
            'lsp-plugins-ladspa: extra LADSPA plugins for chains and effect racks'
            'lsp-plugins-lv2: extra LV2 plugins for effect racks'
            'carla: bridge VST3/CLAP plugins into the graph via the patchbay')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f63481fddf99a501cb9e24d36cccf46f3e869f88c001d8235a38960281263b12')

package() {
  cd "PipeWireController-$pkgver"

  install -d "$pkgdir/usr/share/$pkgname"
  cp -r pwctl "$pkgdir/usr/share/$pkgname/"
  install -Dm755 pipewire-control-center "$pkgdir/usr/share/$pkgname/pipewire-control-center"

  install -d "$pkgdir/usr/bin"
  ln -s "/usr/share/$pkgname/pipewire-control-center" "$pkgdir/usr/bin/pipewire-control-center"
  # Short alias. Deliberately not `pwctl`: one transposition from `wpctl`,
  # WirePlumber's real CLI, and `pw-*` is PipeWire's own tool prefix.
  ln -s "/usr/share/$pkgname/pipewire-control-center" "$pkgdir/usr/bin/pwcc"

  install -Dm644 io.github.knightinfected.PipeWireControlCenter.desktop \
    "$pkgdir/usr/share/applications/io.github.knightinfected.PipeWireControlCenter.desktop"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
