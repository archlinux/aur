# Maintainer: MeoArch <https://github.com/QwQdoge>
pkgname=omnistore-bin
pkgver=0.1.5beta1
pkgrel=1
pkgdesc="OmniStore software manager for MeoArch"
arch=('x86_64')
url='https://github.com/QwQdoge/OmniStore'
license=('GPL-3.0-only')
depends=('qt6-base' 'qt6-declarative' 'meoui-qml>=1.0.4beta2-4'
         'meo-kde-runtime>=0.4.0beta3' 'ksshaskpass' 'libsecret'
         'pacman-contrib' 'python' 'pyalpm')
makedepends=('patchelf')
optdepends=('meo-release: shared MeoArch application catalog and channel integration'
            'meo-account>=0.1.0-8: system AI connections and remembered catalog consent'
            'flatpak: install applications from Flatpak remotes')
provides=('omnistore')
conflicts=('omnistore' 'omnistore-git')
source=('omnistore-linux-x64.tar.gz::https://github.com/QwQdoge/OmniStore/releases/download/v0.1.5-beta.1/omnistore-linux-x64.tar.gz'
        'org.meo.OmniStore.json'
        'omnistore.desktop'
        'verify_release_exporter_contract.py::https://raw.githubusercontent.com/QwQdoge/OmniStore/615186e57b0abeec98fa04c183a36f0499d8e21f/verify_release_exporter_contract.py')
sha256sums=('3b14e8d06e29db8a6262c288ba064e8c6311dfc4e140471d0c5c7ae1391eb274'
            'bb9f5e8267d2106ffed2927047df4dc0a2037a65c5b50002b51a2cf213484e1d'
            '50279aede8e00311980b46812ef4eaaf2ca33b8100d9bbb5850c9017a3df1904'
            'd4b7694e512898a32907be3a4fdf76ffba994b001ae2c957c0533b31b59c0773')
noextract=('omnistore-linux-x64.tar.gz')

prepare() {
  mkdir -p "$srcdir/release_bundle"
  bsdtar -xf "$srcdir/omnistore-linux-x64.tar.gz" -C "$srcdir/release_bundle"
  test -x "$srcdir/release_bundle/backends/python_server"
  test -x "$srcdir/release_bundle/omnistore-native"
  test -f "$srcdir/release_bundle/data/systemd/user/omnistore-task.service"
  test ! -e "$srcdir/release_bundle/frontend" || {
    error "Native MeoArch release bundle must not contain the retired Flutter frontend"
    return 1
  }
  python "$srcdir/verify_release_exporter_contract.py" --backend "$srcdir/release_bundle/backends/python_server"
}

package() {
  install -d "$pkgdir/usr/lib/omnistore"
  cp -a "$srcdir/release_bundle/." "$pkgdir/usr/lib/omnistore/"
  # The upstream SDK build embeds its runner's Qt path and an empty entry.
  # Apply this in package(): release CI stages sources with --noextract,
  # which skips prepare(). Arch uses system Qt and a package-owned origin.
  patchelf --set-rpath '$ORIGIN' "$pkgdir/usr/lib/omnistore/omnistore-native"

  test -x "$pkgdir/usr/lib/omnistore/backends/meo_stable_rollback.py" || {
    error "Release bundle lacks the required Stable rollback root helper"
    return 1
  }
  install -Dm755 "$pkgdir/usr/lib/omnistore/backends/meo_stable_rollback.py" \
    "$pkgdir/usr/lib/omnistore/meo-stable-rollback.py"
  test -x "$pkgdir/usr/lib/omnistore/backends/meo_repository_helper.py" || {
    error "Release bundle lacks the Pacman repository helper"
    return 1
  }
  install -Dm755 "$pkgdir/usr/lib/omnistore/backends/meo_repository_helper.py" \
    "$pkgdir/usr/lib/omnistore/meo-repository-helper.py"

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/omnistore" <<'EOF'
#!/bin/sh
set -eu
cd /usr/lib/omnistore
exec /usr/lib/omnistore/omnistore-native "$@"
EOF

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/omnistore-daemon" <<'EOF'
#!/bin/sh
set -eu
cd /usr/lib/omnistore
exec /usr/lib/omnistore/backends/python_server "$@"
EOF

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/omnistore-apps-export" <<'EOF'
#!/bin/sh
set -eu
[ "$#" -eq 0 ] || exit 64
exec /usr/lib/omnistore/backends/python_server --export-installed-usage --json
EOF

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/omnistore-apps" <<'EOF'
#!/bin/sh
set -eu
command="${1:-}"
[ "$#" -ge 1 ] && shift || true
case "$command" in
  export)
    [ "$#" -eq 0 ] || { echo "omnistore-apps export takes no arguments" >&2; exit 64; }
    exec /usr/lib/omnistore/backends/python_server --export-app-management --json
    ;;
  clear-cache|reset-settings|clear-data|uninstall)
    [ "$#" -eq 2 ] || { echo "omnistore-apps $command requires APP_ID SOURCE" >&2; exit 64; }
    exec /usr/lib/omnistore/backends/python_server --app-action "$command" --app-id "$1" --source "$2" --json
    ;;
  *)
    echo "usage: omnistore-apps export | {clear-cache|reset-settings|clear-data|uninstall} APP_ID SOURCE" >&2
    exit 64
    ;;
esac
EOF

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/omnistore-cli" <<'EOF'
#!/bin/sh
set -eu
cd /usr/lib/omnistore
exec /usr/lib/omnistore/backends/python_server "$@"
EOF

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/meo-update" <<'EOF'
#!/bin/sh
set -eu
backend=/usr/lib/omnistore/backends/python_server
command="${1:-help}"
[ "$#" -eq 0 ] || shift
case "$command" in
  check) exec "$backend" --check-updates --json "$@" ;;
  status) exec "$backend" --update-status --json "$@" ;;
  plan) exec "$backend" --update-plan --json "$@" ;;
  background) exec "$backend" --background-update-check --json "$@" ;;
  apply) exec "$backend" --update all --source all --json "$@" ;;
  repositories) exec "$backend" --list-custom-repos --json "$@" ;;
  help|-h|--help) echo 'Usage: meo-update {check|status|plan|background|apply|repositories}' ;;
  *) echo "Unknown meo-update command: $command" >&2; exit 64 ;;
esac
EOF

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/omnistore-cleanup-systemd" <<'EOF'
#!/bin/sh
set -eu
systemctl --user disable --now omnistore-update.timer >/dev/null 2>&1 || true
systemctl --user stop omnistore-update.service >/dev/null 2>&1 || true
systemctl --user stop omnistore-task.service >/dev/null 2>&1 || true
rm -f "$HOME/.config/systemd/user/omnistore-update.timer"
rm -f "$HOME/.config/systemd/user/omnistore-update.service"
rm -f "$HOME/.config/systemd/user/omnistore-update.timer.d/interval.conf"
rmdir "$HOME/.config/systemd/user/omnistore-update.timer.d" >/dev/null 2>&1 || true
systemctl --user daemon-reload >/dev/null 2>&1 || true
echo "OmniStore user systemd overrides removed and services stopped."
EOF

  install -Dm644 "$srcdir/release_bundle/data/systemd/user/omnistore-task.service" \
    "$pkgdir/usr/lib/systemd/user/omnistore-task.service"
  install -Dm644 "$srcdir/release_bundle/data/systemd/user/omnistore-update.service" \
    "$pkgdir/usr/lib/systemd/user/omnistore-update.service"
  install -Dm644 "$srcdir/release_bundle/data/systemd/user/omnistore-update.timer" \
    "$pkgdir/usr/lib/systemd/user/omnistore-update.timer"

  for doc in UNIFIED_UPDATES.md NATIVE_MEOUI_FRONTEND.md TRANSACTION_RELEASE_CONTRACT.md; do
    if [ -f "$srcdir/release_bundle/data/docs/$doc" ]; then
      install -Dm644 "$srcdir/release_bundle/data/docs/$doc" \
        "$pkgdir/usr/share/doc/omnistore/$doc"
    fi
  done

  install -Dm644 "$srcdir/release_bundle/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/org.meo.OmniStore.json" \
    "$pkgdir/usr/share/meo-account/clients/org.meo.OmniStore.json"

  install -Dm644 "$srcdir/release_bundle/omnistore.svg" \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/org.meo.OmniStore.svg"
  install -Dm644 "$srcdir/release_bundle/omnistore.svg" \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/omnistore.svg"

  install -Dm644 "$srcdir/omnistore.desktop" \
    "$pkgdir/usr/share/applications/org.meo.OmniStore.desktop"
}
