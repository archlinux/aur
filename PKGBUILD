# Maintainer: sfs sfslinux@gmail.com

pkgname=wl-kbd-config-git
_upstream_name=wl-kbd-config
pkgver=0.2.0.r2.gd106eb2
pkgrel=1
pkgdesc='Keyboard layout configuration GUI for Wayland WMs'
arch=('x86_64')
url='https://github.com/sfs-pra/wl-kbd-config'
license=('MIT')
depends=('gtk3' 'libxkbcommon' 'wl-kbd-assets')
makedepends=('git' 'gettext' 'meson' 'ninja' 'pkgconf' 'vala' 'dbus')
optdepends=('librsvg: SVG flag icons in settings UI')
provides=('wl-kbd-config')
conflicts=('wl-kbd-config')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${_upstream_name}"

  local ver rev hash
  ver=$(sed -nE "s/^[[:space:]]*version:[[:space:]]*'([^']+)'.*/\1/p" meson.build | head -n1)
  #'
  rev=$(git rev-list --count HEAD)
  hash=$(git rev-parse --short HEAD)

  printf '%s.r%s.g%s' "${ver:-0.0.0}" "$rev" "$hash"
}

build() {
  cd "$srcdir/${_upstream_name}"
  cp src/settings_state_snapshot.vala tests/
  cp src/wm_config_modifier.vala tests/
  cp src/wm_config_backup.vala tests/
  cp src/wm_detector.vala tests/
  cp src/flag_utils.vala tests/
  cat > tests/meson.build << 'MESONEOF'
test_deps = [
  dependency('glib-2.0'),
  dependency('gio-2.0'),
]

test_exe = executable('test_config_modifier',
  'test_config_modifier.vala',
  'wm_config_modifier.vala',
  'wm_config_backup.vala',
  'wm_detector.vala',
  'flag_utils.vala',
  dependencies: test_deps,
  vala_args: ['--define=UNIT_TEST'],
  c_args: ['-DGETTEXT_PACKAGE="wl-kbd-config"']
)

test('config-modifier', test_exe,
  workdir: meson.current_source_dir()
)

snapshot_test = executable('test_settings_snapshot',
  'test_settings_snapshot.vala',
  'settings_state_snapshot.vala',
  dependencies: test_deps,
  vala_args: ['--define=UNIT_TEST'],
  c_args: ['-DGETTEXT_PACKAGE="wl-kbd-config"']
)

test('settings-snapshot', snapshot_test,
  workdir: meson.current_source_dir()
)
MESONEOF
  meson setup build --prefix=/usr --buildtype=release --wrap-mode=nodownload -Dtests=true
  meson compile -C build
}

check() {
  cd "$srcdir/${_upstream_name}"
  meson test -C build --print-errorlogs
}

package() {
  cd "$srcdir/${_upstream_name}"
  DESTDIR="$pkgdir" meson install -C build
}
