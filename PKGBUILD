# Maintainer: adogecheems <adogecheems@outlook.com>
#
# AUR source-build package. Read MAINTENANCE.md at the
# repository root before submitting. The default source follows the version tag;
# published rebuild recipes pin the exact build commit instead.
# The package is published on AUR as panasonic-posture-manager.

pkgname=panasonic-posture-manager
pkgver=3.1.1
pkgrel=1
pkgdesc='Posture management and screen orientation for convertible Linux 2-in-1 laptops'
arch=('x86_64')
url='https://github.com/adogecheems/panasonic-posture-manager'
license=('AGPL-3.0-or-later')
# Python package (wheel) + Python/GTK UI + desktop session integration.
depends=(
  'python-cairo'
  'gtk4>=4.12'
  'libadwaita>=1.4'
  'python>=3.11'
  'python-gobject'
  'systemd'
  'polkit'
  'dbus'
  'iio-sensor-proxy'
)
# Display and lock integration lives in optional desktop packages.  The
# privileged daemon and relay are desktop-neutral, so keep all backends
# optional and let users install the set for their session.
optdepends=(
  'gnome-shell: GNOME session notification server and desktop integration'
  'mutter: display rotation and orientation lock on GNOME Wayland'
  'gnome-settings-daemon: touchscreen orientation-lock GSettings schema on GNOME'
  'kscreen: display rotation and auto-rotate policy on Plasma 6.8+ (kscreenctl)'
  'libkscreen: display rotation and auto-rotate policy on Plasma 6.0-6.7 (kscreen-doctor)'
)
# Build tooling: Git source, C relay, gettext catalog and the PEP 517 wheel.
makedepends=('git' 'gcc' 'gettext' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
install="${pkgname}.install"

# This is a VCS source, so SKIP is the correct checksum entry. The version tag
# pins normal builds; release exports substitute the verified build commit.
source=("${pkgname}::git+https://github.com/adogecheems/${pkgname}.git#commit=a15b7202038dace731418feb202eddb97025959c")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/${pkgname}"

  # Never ship prebuilt artifacts: rebuild the C relay and the gettext catalog
  # from source, then build the Python wheel with the distribution toolchain.
  rm -f backend/linux/relay backend/linux/*.gch
  rm -f locale/zh_CN/LC_MESSAGES/panasonic-posture-manager.mo
  rm -rf dist build src/*.egg-info
  make
  python3 -m build --wheel --no-isolation
}

check() {
  cd "${srcdir}/${pkgname}"
  # compileall + unittest + session-bus D-Bus integration + i18n coverage.
  # The runtime dependencies of make check (PyGObject, dbus-run-session) are
  # already part of depends.
  make check
}

package() {
  cd "${srcdir}/${pkgname}"

  local libdir="${pkgdir}/usr/lib/panasonic-posture-manager"
  local datadir="${pkgdir}/usr/share/panasonic-posture-manager"
  local file wheel

  # Python package, console scripts and metadata come from the wheel; the
  # installed file list is decided by python-installer (do not hard-code the
  # site-packages path or the Python version).
  for wheel in dist/*.whl; do
    python3 -m installer --destdir="${pkgdir}" "${wheel}"
  done

  # Posture illustrations and model profiles: data-only files
  # that intentionally live outside the Python package.
  while IFS= read -r -d '' file; do
    install -Dm644 "${file}" "${datadir}/profiles/${file#data/profiles/}"
  done < <(find data/profiles -type f -print0)
  while IFS= read -r -d '' file; do
    install -Dm644 "${file}" "${datadir}/assets/${file#data/assets/common/}"
  done < <(find data/assets/common -type f -print0)

  # The desktop entry and notifications resolve the application icon by ID
  # from the standard hicolor theme, separately from the data-directory copy
  # used by the Python window when running from a source checkout.
  install -Dm644 data/assets/common/icons/work.mmoe.panasonic.PostureManager.png \
    "${pkgdir}/usr/share/icons/hicolor/512x512/apps/work.mmoe.panasonic.PostureManager.png"

  # Privileged actuator built from backend/linux/*.c by make.
  if [[ ! -x backend/linux/relay ]]; then
    echo "error: backend/linux/relay was not built by make" >&2
    return 1
  fi
  install -Dm755 backend/linux/relay "${libdir}/relay"

  # gettext catalogs follow the system locale layout.
  while IFS= read -r -d '' file; do
    install -Dm644 "${file}" "${pkgdir}/usr/share/locale/${file#locale/}"
  done < <(find locale -type f -name '*.mo' -print0)

  # systemd units (system + user), D-Bus policy/activation, polkit action,
  # desktop entry and the uinput module requested at boot.
  install -Dm644 packaging/linux/systemd/panasonic-posture-manager.service \
    "${pkgdir}/usr/lib/systemd/system/panasonic-posture-manager.service"
  install -Dm644 packaging/linux/systemd/user/panasonic-posture-manager-session.service \
    "${pkgdir}/usr/lib/systemd/user/panasonic-posture-manager-session.service"
  install -Dm644 packaging/linux/modules-load.d/uinput.conf \
    "${pkgdir}/usr/lib/modules-load.d/panasonic-posture-manager.conf"
  install -Dm644 packaging/linux/dbus/work.mmoe.panasonic.Posture.conf \
    "${pkgdir}/usr/share/dbus-1/system.d/work.mmoe.panasonic.Posture.conf"
  install -Dm644 packaging/linux/dbus/work.mmoe.panasonic.Posture.service \
    "${pkgdir}/usr/share/dbus-1/system-services/work.mmoe.panasonic.Posture.service"
  install -Dm644 packaging/linux/polkit/work.mmoe.panasonic.Posture.policy \
    "${pkgdir}/usr/share/polkit-1/actions/work.mmoe.panasonic.Posture.policy"
  install -Dm644 packaging/linux/desktop/work.mmoe.panasonic.PostureManager.desktop \
    "${pkgdir}/usr/share/applications/work.mmoe.panasonic.PostureManager.desktop"

  # Only install a license file if upstream ships one. Do not fabricate a
  # license file in this package.
  if [[ -f LICENSE ]]; then
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  fi

  # Catch accidental /usr/local paths in installed text files. The relay is an
  # ELF binary; grep -I skips it.
  if grep -rIq '/usr/local' "${pkgdir}"; then
    echo "error: /usr/local reference found in the package tree" >&2
    return 1
  fi
}
