# Maintainer: Julien Turbide <moi at jturbide dot com>
# SPDX-License-Identifier: 0BSD

pkgname=niri-fx-git
pkgver=0.22.0.r80.g1e715c7
provides=("niri-fx=${pkgver%%.r*}")
conflicts=('niri-fx')
_niri_revision=8ed0da44d974c32c6877d2f4630c314da0717ecb
pkgrel=1
pkgdesc='Complete NiriFX compositor, presets, CLI and visual Studio for Niri'
arch=('x86_64')
url='https://github.com/jturbide/niri-fx'
license=('MIT AND GPL-3.0-or-later AND 0BSD')
depends=(
  'niri' 'python' 'hicolor-icon-theme' 'bash' 'systemd' 'dbus'
  'cairo' 'glib2' 'glibc' 'libdisplay-info' 'libgcc' 'libinput'
  'libpipewire' 'libxkbcommon' 'mesa' 'pango' 'pixman' 'seatd'
  'systemd-libs' 'wayland' 'libglvnd'
)
makedepends=(
  'rust' 'clang' 'git' 'python-build' 'python-installer'
  'python-setuptools>=77' 'python-wheel'
)
checkdepends=('desktop-file-utils' 'python-pillow')
optdepends=(
  'chromium: open Studio in an app window'
  'quickshell: optional QML preset picker'
  'gjs: optional GTK preset picker'
  'gtk4: optional GTK preset picker'
  'libadwaita: optional GTK preset picker'
  'xdg-desktop-portal-gnome: screen-sharing portal for the Niri session'
  'xdg-desktop-portal-gtk: fallback desktop portal'
  'org.freedesktop.secrets: secret portal provider'
  'xwayland-satellite: run X11 applications'
)
# The producer strips its executable before recording the final SHA-256.
# makepkg must not rewrite that executable or create a separate debug package.
# GCC LTO objects from libspa's C helpers cannot be linked by Rust's LLVM linker;
# disabling makepkg LTO preserves Rust's own release-profile thin LTO.
options=('!strip' '!debug' '!lto')
source=(
  'niri-fx::git+https://github.com/jturbide/niri-fx.git#branch=main'
  "niri::git+https://github.com/niri-wm/niri.git#commit=${_niri_revision}"
  'niri-fx-studio.desktop'
  'niri-fx-packaged.desktop'
  'README.Arch'
  'LICENSE'
)
sha256sums=(
  'SKIP'
  'SKIP'
  '7a3f838400c76a9b4e50749c77b8e8b285d34a19c8f716a5f916af04a12ebb34'
  '4f5b3d3b995d406866385c9b892557e4b3521645a59f4526ca999e93cabfb977'
  '4ee5a8a05ae700d40b85e97482d41b75cce5d2ae5b9317e4a59f89304f107fa5'
  '336feffd8a99323d56058efe2b2deb3480dcf935dbb6813324c95a7e61bbbca3'
)

pkgver() {
  cd niri-fx || return
  local _version
  _version=$(python -c 'import tomllib; print(tomllib.load(open("pyproject.toml", "rb"))["project"]["version"])')
  printf '%s.r%s.g%s' "${_version}" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  # makepkg owns this source checkout. Remove earlier wheel/build leftovers so
  # a repeated build cannot package stale Python modules or multiple wheels.
  git -C "${srcdir}/niri-fx" clean -dfx
  # One NiriFX checkout supplies the wheel, patches and native producer. Keep
  # Cargo state outside the audited upstream Niri tree.
  python - "${srcdir}/niri-fx" "${srcdir}/niri" "${_niri_revision}" <<'PYTHON'
import runpy
import sys
import tomllib
from pathlib import Path

repository, source = map(Path, sys.argv[1:3])
sys.path[:0] = [str(repository / "scripts"), str(repository)]
from niri_fx import __version__
from niri_fx.native_build import REVISION, STACKS

version = tomllib.loads((repository / "pyproject.toml").read_text())["project"]["version"]
if version != __version__:
    raise SystemExit("NiriFX source version metadata disagrees")
if len(sys.argv) == 5 and version != sys.argv[4]:
    raise SystemExit("Release tag metadata differs from the recipe version")
if REVISION != sys.argv[3]:
    raise SystemExit("Recipe upstream revision differs from the canonical NiriFX pin")
builder = runpy.run_path(str(repository / "scripts/build-niri-movement.py"))
patches = [repository / "experimental" / name for name in STACKS["fragment"]]
if len(patches) != 4:
    raise SystemExit("Review the recipe for a changed full-session patch stack")
builder["apply_patches"](source, REVISION, patches)
builder["apply_patches"](source, REVISION, patches, verify_only=True)
PYTHON
  CARGO_HOME="${srcdir}/cargo" RUSTUP_AUTO_INSTALL=0 \
    cargo fetch --locked --manifest-path "${srcdir}/niri/Cargo.toml"
}

build() {
  cd niri-fx || return
  python -m build --wheel --no-isolation
  # Only replace the generated export; retain native attempts and Cargo cache.
  rm -rf -- "${srcdir}/session-candidate"
  # Compilation and all native regressions run offline in a fresh attempt.
  python scripts/build-nirifx-session.py \
    --prepared-source "${srcdir}/niri" \
    --build-root "${srcdir}/attempts" \
    --cargo-home "${srcdir}/cargo" \
    --output "${srcdir}/session-candidate" \
    --strip-program /usr/bin/strip
}

check() {
  cd niri-fx || return
  env -u NIRI_SOCKET -u WAYLAND_DISPLAY -u DISPLAY -u DBUS_SESSION_BUS_ADDRESS \
    -u PYTHONPATH -u PYTHONHOME PYTHONNOUSERSITE=1 \
    python -m unittest discover -s tests
  desktop-file-validate "${srcdir}/niri-fx-studio.desktop"
  # DesktopNames is a login-session key rejected by the application validator.
  PYTHONPATH="${srcdir}/niri-fx" python - "${srcdir}/niri-fx-packaged.desktop" <<'PYTHON'
import sys
from pathlib import Path
from niri_fx.package_session import DESKTOP_ENTRY

if Path(sys.argv[1]).read_bytes() != DESKTOP_ENTRY:
    raise SystemExit("Packaged chooser entry differs from the runtime contract")
PYTHON
  test -f "${srcdir}/session-candidate/manifest.json"
  test -x "${srcdir}/session-candidate/bin/niri"
}

package() {
  cd niri-fx || return
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 "${srcdir}/niri-fx-studio.desktop" \
    "${pkgdir}/usr/share/applications/niri-fx-studio.desktop"
  install -Dm644 niri_fx/assets/niri-fx.svg \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/niri-fx.svg"

  local _candidate="${pkgdir}/usr/lib/niri-fx/session-candidate"
  # Build attempts are private; installed candidates must be system-readable.
  install -d "${_candidate}/bin" "${_candidate}/source" "${_candidate}/patches"
  install -m755 "${srcdir}/session-candidate/bin/niri" "${_candidate}/bin/niri"
  install -m644 "${srcdir}/session-candidate/manifest.json" "${_candidate}/manifest.json"
  install -m644 "${srcdir}/session-candidate/source/"{Cargo.lock,LICENSE,README.md} \
    -t "${_candidate}/source"
  install -m644 "${srcdir}/session-candidate/patches/"*.patch -t "${_candidate}/patches"
  install -Dm755 niri_fx/package_session.py "${pkgdir}/usr/bin/niri-fx-session"
  install -Dm644 "${srcdir}/niri-fx-packaged.desktop" \
    "${pkgdir}/usr/share/wayland-sessions/niri-fx-packaged.desktop"

  install -Dm644 LICENSE THIRD_PARTY.md experimental/COPYING-NIRI \
    -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "${srcdir}/niri/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.niri"
  install -Dm644 "${srcdir}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.packaging"
  install -Dm644 "${srcdir}/README.Arch" \
    "${pkgdir}/usr/share/doc/niri-fx/README.Arch"
  install -Dm644 examples/profiles/*.json \
    -t "${pkgdir}/usr/share/doc/niri-fx/examples"
}
