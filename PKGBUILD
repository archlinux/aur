# Maintainer: Vadym Dziuba <dziuba.vadym@gmail.com>
#
# Packaging strategy
#   Every Python dependency is (or can be) a system package, so this is a plain
#   arch=any Python package built with python-build/python-installer. No venv,
#   no pip, no network access in build() or package().
#     python-sherpa-onnx   AUR, split package "sherpa-onnx" (built from source
#                          against extra/onnxruntime-cpu and the system Python)
#     python-ten-vad       AUR, provided by python-ten-vad-bin (source in
#                          packaging/deps/ of the upstream repository)
#     python-sounddevice   AUR
#     everything else      official repositories
#
# After installing: see the post-install message (parakeet-dictation.install):
# download a model with `parakeet-dictation-models desktop`, enable the ydotool
# service, join the uinput group, approve the one-time portal prompt.
# Shortcuts: Insert (hold to talk) and Meta+Insert (start/stop), registered
# with kglobalaccel at startup; no pynput dependency.
# Autostart: "Start at login" in Settings > General, or
#   cp /usr/share/applications/parakeet-dictation.desktop ~/.config/autostart/

pkgname=parakeet-dictation-git
_pkgname=parakeet-dictation
pkgver=2.0.0.r131.g794c717
pkgrel=1
pkgdesc="On-device push-to-talk voice dictation for KDE Plasma Wayland (Parakeet TDT via sherpa-onnx, TEN VAD)"
arch=('any')
url="https://github.com/dz-vadim/parakeet-dictation"
license=('MIT')
depends=(
  'python'
  'python-gobject'
  'python-cairo'
  'python-numpy'
  'python-sounddevice'
  'python-sherpa-onnx'
  'python-ten-vad'
  'python-requests'
  'python-tqdm'
  'gtk3'
  'libayatana-appindicator'
  'gtk-layer-shell'
  'wl-clipboard'
  'ydotool'
  'xdg-desktop-portal-kde'
)
optdepends=(
  'kglobalacceld: the two global shortcuts (hold and start/stop)'
  'kwin: focused-window class detection for the paste chord (KWin script)'
  'xdotool: last-resort chord transport, reaches XWayland windows only'
  'wtype: "wtype" typer on compositors with the virtual-keyboard protocol (GNOME, Sway)'
)
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools')
provides=("$_pkgname")
conflicts=("$_pkgname")
install="$_pkgname.install"
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  # The version from the package, then commit count and hash.  Not
  # `git describe`: this fork carries upstream's v1.x tags, which would put
  # the AUR version below the 2.0.0 the code calls itself.
  printf '%s.r%s.g%s' \
    "$(sed -n 's/^__version__ = "\(.*\)"$/\1/p' parakeet_dictation/__init__.py)" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$_pkgname"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm755 packaging/parakeet-dictation-models -t "$pkgdir/usr/bin"
  install -Dm644 packaging/parakeet-dictation.desktop -t "$pkgdir/usr/share/applications"
  install -Dm644 parakeet_dictation/data/icons/parakeet-mic-idle.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/$_pkgname.svg"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$_pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
