# Maintainer: Ryan Fantus <ryanfantus@gmail.com>
# Contributor: BlueFerry contributors
pkgbase=blueferry
pkgname=(
  blueferry-backend
  blueferry-gtk
  blueferry-qt
  blueferry-quickshell
)
pkgver=0.9.1
pkgrel=1
pkgdesc='BlueFerry Bluetooth bridge from iPhone to Linux'
arch=('any')
url='https://github.com/erikwb/blueferry'
license=('GPL-2.0-or-later')
makedepends=(
  'dbus'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'appstream'
  'bandit'
  'desktop-file-utils'
  'gtk4'
  'libadwaita'
  'kirigami'
  'libsecret'
  'mypy'
  'python-cryptography'
  'python-coverage'
  'python-dbus'
  'python-gobject'
  'python-hypothesis'
  'python-phonenumbers'
  'python-regex>=2022.10.31'
  'python-pytest'
  'python-textual>=8.0'
  'python-typer>=0.12'
  'pyside6'
  'qt6-declarative'
  'quickshell'
  'ruff'
)
source=("$pkgbase-$pkgver.tar.gz::https://github.com/erikwb/blueferry/archive/refs/tags/v${pkgver}.tar.gz")
# build.sh writes the digest beside this file after creating its deterministic
# working-tree snapshot. The digest file is ignored and excluded from source.
sha256sums=('7f6266b6b48086773b17c0c3f934b529c644c4f731f40e6198fd50908c871c73')

# Build, test, and install with the system interpreter. python-build,
# python-installer, and the checkdepends are Arch packages for /usr/bin/python
# only, and _site below must name the interpreter that will import the
# installed package. This is a no-op in a clean chroot; it matters when makepkg
# runs from a shell where mise, pyenv, conda, or an activated virtualenv puts a
# different python first.
PATH="/usr/bin:$PATH"

_get_site() {
  /usr/bin/python -c 'import sysconfig; print(sysconfig.get_path("purelib").lstrip("/"))'
}
_stage='package-stage'

prepare() {
  rm -rf -- "$srcdir/$_stage"

  cd "$srcdir/$pkgbase-$pkgver"
  printf '%s\n' "$_commit" > .blueferry-build-sha
}

build() {
  cd "$pkgbase-$pkgver"
  rm -rf -- build dist
  python -m build --wheel --no-isolation
  python -m installer --destdir="$srcdir/$_stage" dist/*.whl
}

check() {
  cd "$pkgbase-$pkgver"
  ruff check .
  bandit -r src/blueferry -q
  mypy src/blueferry
  BLUEFERRY_TEST_ROOT="$PWD" dbus-run-session \
    --config-file="$PWD/tests/dbus-test.conf" -- sh -ec '
    cd "$BLUEFERRY_TEST_ROOT"
    export DBUS_SYSTEM_BUS_ADDRESS="$DBUS_SESSION_BUS_ADDRESS"
    export BLUEFERRY_TEST_DBUS_ADDRESS="$DBUS_SESSION_BUS_ADDRESS"
    export PYTHONPATH="$BLUEFERRY_TEST_ROOT/src"
    # GTK and Qt cannot safely initialize their GUI stacks in the same Python
    # process: Qt can deadlock while creating the second QML component after
    # the GTK conversation tests have run. Keep the QML checks isolated.
    python -m coverage run -m pytest -q --ignore=tests/test_qml_presenters.py
    python -m pytest -q tests/test_qml_presenters.py
    python -m coverage report
  '
  desktop-file-validate data/io.weirdware.BlueFerry.Gtk.desktop
  desktop-file-validate data/io.weirdware.BlueFerry.Qt.desktop
  desktop-file-validate data/io.weirdware.BlueFerry.Tray.desktop
  desktop-file-validate data/io.weirdware.BlueFerry.Quickshell.desktop
  appstreamcli validate --no-net data/io.weirdware.BlueFerry.Gtk.metainfo.xml
  appstreamcli validate --no-net data/io.weirdware.BlueFerry.Qt.metainfo.xml
  appstreamcli validate --no-net data/io.weirdware.BlueFerry.Quickshell.metainfo.xml
  PYTHONPATH="$PWD/src" python -c 'from blueferry.qt.app import main'
  /usr/lib/qt6/bin/qmllint src/blueferry/qt/qml/*.qml
  /usr/lib/qt6/bin/qmllint data/quickshell/*.qml
}

package_blueferry-backend() {
  local _site="$(_get_site)"
  pkgdesc='iPhone Bluetooth bridge backend, daemon, CLI, and terminal client'
  install=blueferry-backend.install
  conflicts=('blueferry-tui')
  provides=('blueferry-tui')
  depends=(
    'bluez>=5.86'
    'bluez-obex'
    'bluez-utils'
    'git'
    'libsecret'
    'org.freedesktop.secrets'
    'polkit'
    'python'
    'python-cryptography>=42'
    'python-dbus'
    'python-gobject'
    'python-phonenumbers'
    'python-regex>=2022.10.31'
    'python-textual>=8.0'
    'python-typer>=0.12'
    'systemd'
  )
  optdepends=(
    'ofono: experimental phone calls (off by default)'
    'wl-clipboard: copy one-time codes on Wayland (BLUEFERRY_OTP_AUTOCOPY)'
    'xclip: copy one-time codes on X11 (BLUEFERRY_OTP_AUTOCOPY)'
    'xsel: copy one-time codes on X11 (BLUEFERRY_OTP_AUTOCOPY)'
  )
  cd "$pkgbase-$pkgver"
  install -d "$pkgdir/$_site"
  cp -a "$srcdir/$_stage/$_site/blueferry" "$pkgdir/$_site/"
  rm -rf -- "$pkgdir/$_site/blueferry/ui" "$pkgdir/$_site/blueferry/qt"
  cp -a "$srcdir/$_stage/$_site/blueferry-$pkgver.dist-info" "$pkgdir/$_site/"
  install -Dm755 "$srcdir/$_stage/usr/bin/blueferry" "$pkgdir/usr/bin/blueferry"
  install -Dm755 "$srcdir/$_stage/usr/bin/blueferry-tui" \
    "$pkgdir/usr/bin/blueferry-tui"
  install -Dm755 "$srcdir/$_stage/usr/bin/blueferry-quickshell-bridge" \
    "$pkgdir/usr/bin/blueferry-quickshell-bridge"

  install -Dm644 systemd/blueferry.service \
    "$pkgdir/usr/lib/systemd/user/blueferry.service"
  install -Dm644 systemd/blueferry-btmgmt-set-class@.service \
    "$pkgdir/usr/lib/systemd/system/blueferry-btmgmt-set-class@.service"
  install -Dm755 systemd/blueferry-set-cod \
    "$pkgdir/usr/lib/blueferry/blueferry-set-cod"
  install -Dm644 systemd/49-blueferry-cod.rules \
    "$pkgdir/usr/share/polkit-1/rules.d/49-blueferry-cod.rules"
  install -d "$pkgdir/usr/lib/systemd/user/default.target.wants"
  ln -s ../blueferry.service \
    "$pkgdir/usr/lib/systemd/user/default.target.wants/blueferry.service"
  install -Dm644 packaging/arch/io.weirdware.BlueFerry.service \
    "$pkgdir/usr/share/dbus-1/services/io.weirdware.BlueFerry.service"
  install -Dm644 data/io.weirdware.BlueFerry.xml \
    "$pkgdir/usr/share/dbus-1/interfaces/io.weirdware.BlueFerry.xml"
  install -Dm644 data/icons/io.weirdware.BlueFerry.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/io.weirdware.BlueFerry.svg"
  install -d "$pkgdir/usr/share/blueferry"
  printf '%s\n' "$pkgver-$pkgrel" \
    > "$pkgdir/usr/share/blueferry/package-release"
  install -Dm644 .blueferry-build-sha \
    "$pkgdir/usr/share/blueferry/build-sha"
  install -Dm644 packaging/arch/blueferry-bluetooth.conf \
    "$pkgdir/usr/lib/systemd/system/bluetooth.service.d/blueferry.conf"
  install -Dm644 packaging/arch/70-blueferry-restart-bluetooth.hook \
    "$pkgdir/usr/share/libalpm/hooks/70-blueferry-restart-bluetooth.hook"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 ARCHITECTURE.md \
    "$pkgdir/usr/share/doc/$pkgname/ARCHITECTURE.md"
  install -Dm644 PROTOCOL.md \
    "$pkgdir/usr/share/doc/$pkgname/PROTOCOL.md"
  install -Dm644 CHANGELOG.md \
    "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_blueferry-gtk() {
  local _site="$(_get_site)"
  pkgdesc='GTK4/libadwaita client for BlueFerry'
  depends=(
    "blueferry-backend=$pkgver-$pkgrel"
    'gtk4'
    'libadwaita>=1.5'
    'python-gobject'
  )

  cd "$pkgbase-$pkgver"
  install -d "$pkgdir/$_site/blueferry"
  cp -a "$srcdir/$_stage/$_site/blueferry/ui" "$pkgdir/$_site/blueferry/"
  install -Dm755 "$srcdir/$_stage/usr/bin/blueferry-gtk" "$pkgdir/usr/bin/blueferry-gtk"
  install -Dm644 data/io.weirdware.BlueFerry.Gtk.desktop \
    "$pkgdir/usr/share/applications/io.weirdware.BlueFerry.Gtk.desktop"
  install -Dm644 data/io.weirdware.BlueFerry.Gtk.metainfo.xml \
    "$pkgdir/usr/share/metainfo/io.weirdware.BlueFerry.Gtk.metainfo.xml"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_blueferry-qt() {
  local _site="$(_get_site)"
  pkgdesc='Qt/KDE client for BlueFerry'
  depends=(
    "blueferry-backend=$pkgver-$pkgrel"
    'kirigami'
    'pyside6'
    'qqc2-desktop-style'
  )

  cd "$pkgbase-$pkgver"
  install -d "$pkgdir/$_site/blueferry"
  cp -a "$srcdir/$_stage/$_site/blueferry/qt" "$pkgdir/$_site/blueferry/"
  install -Dm755 "$srcdir/$_stage/usr/bin/blueferry-qt" "$pkgdir/usr/bin/blueferry-qt"
  install -Dm755 "$srcdir/$_stage/usr/bin/blueferry-tray" "$pkgdir/usr/bin/blueferry-tray"
  install -Dm644 data/io.weirdware.BlueFerry.Qt.desktop \
    "$pkgdir/usr/share/applications/io.weirdware.BlueFerry.Qt.desktop"
  install -Dm644 data/io.weirdware.BlueFerry.Tray.desktop \
    "$pkgdir/usr/share/applications/io.weirdware.BlueFerry.Tray.desktop"
  install -Dm644 data/io.weirdware.BlueFerry.Qt.metainfo.xml \
    "$pkgdir/usr/share/metainfo/io.weirdware.BlueFerry.Qt.metainfo.xml"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_blueferry-quickshell() {
  pkgdesc='Quickshell client for BlueFerry'
  depends=("blueferry-backend=$pkgver-$pkgrel" 'quickshell')

  cd "$pkgbase-$pkgver"
  install -Dm755 data/blueferry-quickshell \
    "$pkgdir/usr/bin/blueferry-quickshell"
  install -Dm644 data/quickshell/*.qml \
    -t "$pkgdir/usr/share/blueferry/quickshell"
  install -Dm644 src/blueferry/qt/qml/ConversationLogic.qml \
    "$pkgdir/usr/share/blueferry/quickshell/ConversationLogic.qml"
  install -Dm644 data/io.weirdware.BlueFerry.Quickshell.desktop \
    "$pkgdir/usr/share/applications/io.weirdware.BlueFerry.Quickshell.desktop"
  install -Dm644 data/io.weirdware.BlueFerry.Quickshell.metainfo.xml \
    "$pkgdir/usr/share/metainfo/io.weirdware.BlueFerry.Quickshell.metainfo.xml"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
