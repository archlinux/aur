pkgname=jsrf-launcher-bin
pkgver=3k
pkgrel=1
pkgdesc='Launcher for native recompilation of Jet Set Radio Future (Xbox)'
arch=('x86_64')
url='https://github.com/Miggas/JSRF-Recomp'
license=('MIT')
depends=('bash' 'coreutils' 'curl' 'glibc' 'gzip' 'sdl2-compat' 'tar' 'unzip' 'util-linux')
options=('!strip')
_tag="launcher-v${pkgver}"
source=(
  "${pkgname}-${pkgver}.tar.gz::${url}/releases/download/${_tag}/jsrf_launcher-linux.tar.gz"
  "${pkgname}-${pkgver}-source.tar.gz::https://codeload.github.com/Miggas/JSRF-Recomp/tar.gz/refs/tags/${_tag}"
)
sha256sums=(
  '7330235aed066af831528ab94aceacfeab483063db149a44c82349884670564b'
  'c49318548ee095ec674e85f9ed2e743670f0535580e9b3e30d28fb8a8e62d08e'
)

package() {
  local libdir="$pkgdir/usr/lib/jsrf-launcher"
  local upstream="$srcdir/JSRF-Recomp-${_tag}"

  install -Dm755 "$srcdir/jsrf_launcher" "$libdir/jsrf_launcher"
  install -Dm644 "$upstream/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  printf '%s-%s\n' "$pkgver" "$pkgrel" > "$libdir/package-version"

  install -d "$pkgdir/usr/bin" "$pkgdir/usr/share/applications"
  cat > "$pkgdir/usr/bin/jsrf-launcher" <<'WRAPPER'
#!/bin/bash
set -e

libdir=/usr/lib/jsrf-launcher
data_dir="${XDG_DATA_HOME:-"$HOME/.local/share"}/jsrf-launcher"
launcher="$data_dir/jsrf_launcher"
version_file="$data_dir/.package-version"

# SDL resolves the executable's real directory. Keep a writable copy there.
mkdir -p -- "$data_dir"
(
  flock -x 9
  packaged_version=$(<"$libdir/package-version")
  installed_version=
  if [[ -f "$version_file" ]]; then
    installed_version=$(<"$version_file")
  fi

  # Preserve upstream self-updates until the installed package version changes.
  if [[ ! -x "$launcher" || "$installed_version" != "$packaged_version" ]]; then
    staging=$(mktemp -d -- "$data_dir/.install.XXXXXXXX")
    trap 'rm -rf -- "$staging"' EXIT
    install -m755 -- "$libdir/jsrf_launcher" "$staging/jsrf_launcher"
    printf '%s\n' "$packaged_version" > "$staging/package-version"
    mv -fT -- "$staging/jsrf_launcher" "$launcher"
    mv -fT -- "$staging/package-version" "$version_file"
  fi
) 9>"$data_dir/.package-lock"

exec "$launcher" "$@"
WRAPPER
  chmod 755 "$pkgdir/usr/bin/jsrf-launcher"

  cat > "$pkgdir/usr/share/applications/jsrf-launcher.desktop" <<'DESKTOP'
[Desktop Entry]
Type=Application
Name=JSRF Launcher
Comment=Build and launch Jet Set Radio Future Recomp
Exec=jsrf-launcher
Icon=applications-games
Terminal=false
Categories=Game;
DESKTOP
}
