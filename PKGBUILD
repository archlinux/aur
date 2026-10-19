# Maintainer: Bingusfan360 <bingusfan360@proton.me>
#
# moss is free and open source. Development and hosting are funded
# entirely by donations — every contribution goes directly to keeping the
# project running.
# Donate (hosted, one-tap): https://www.buymeacoffee.com/bingusfan360
pkgname=moss
pkgver=0.7.2
pkgrel=2
pkgdesc="An agentic backend that *will* be the best. Free and open source, funded by donations: https://www.buymeacoffee.com/bingusfan360"
# The accelerator library (native/) contains x86-64 assembly, so the package is
# architecture-specific even though the Python payload is pure.
arch=('x86_64')
url="https://gitlab.com/Bingusfan360/MahoragaOS"
license=('AGPL-3.0-or-later')
depends=('python' 'hicolor-icon-theme' 'jq' 'sqlite')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel'
             'gcc' 'make')
optdepends=('moss-language: run .moss programs with `moss run`')
# AUR rename mahoragaos -> moss (Tier-3 gate, BIN-949/BIN-1711): the old
# package builds the same wheel, so it must be replaced, not co-installed.
# moss-os was the temporary fallback published while the moss name was held
# by the old orphan; it ships the same files, so replace it too.
replaces=('mahoragaos' 'moss-os')
conflicts=('mahoragaos' 'moss-os')
source=("$url/-/archive/v0.7.2/MahoragaOS-v0.7.2.tar.gz"
        "moss.svg"
        "moss.fish")
sha256sums=('2f54b2399d41857a566aa1f785a121a8a12c8624b3f5ff64112a19cc66a75a5c'
            'SKIP'
            'SKIP')

build() {
  cd MahoragaOS-v0.7.2
  /usr/bin/python -m build --wheel
  # Native metrics/framing accelerator (BIN-1954). The loader looks for the
  # package-local libmoss_native.so before falling back to pure Python.
  # makepkg exports CFLAGS, which overrides the Makefile's `?=` default and
  # would drop -Iinclude/-fPIC; pass them explicitly for the tagged source.
  make -C native CFLAGS="${CFLAGS:-} -fPIC -Iinclude"
}

package() {
  cd MahoragaOS-v0.7.2
  /usr/bin/python -m installer --destdir="$pkgdir" dist/*.whl

  # Bash CLI port (BIN-1954). The Python bridge finds it via
  # _find_shell_cli(): dist-packages for Debian-style layouts, plus the
  # /usr/lib/cli-shell symlink for Arch's site-packages walk-up.
  install -d "$pkgdir/usr/lib/python3/dist-packages"
  cp -a cli-shell "$pkgdir/usr/lib/python3/dist-packages/cli-shell"
  find "$pkgdir/usr/lib/python3/dist-packages/cli-shell" \
    -type d -name __pycache__ -prune -exec rm -rf {} +
  find "$pkgdir/usr/lib/python3/dist-packages/cli-shell" \
    \( -name '*.pyc' -o -name '*.pyo' \) -delete
  ln -s python3/dist-packages/cli-shell "$pkgdir/usr/lib/cli-shell"

  # The v0.7.2 port only knows the source-tree version file and falls back to
  # 0.7.0 when installed. Pin the packaged version explicitly.
  local cli_shell="$pkgdir/usr/lib/python3/dist-packages/cli-shell/moss"
  sed -i "s|^VERSION=\"\${VERSION:-0.7.0}\"$|VERSION=\"\${VERSION:-${pkgver}}\"|" \
    "$cli_shell"
  grep -Fq "VERSION=\"\${VERSION:-${pkgver}}\"" "$cli_shell"

  # Native library into the loader's package-local candidate.
  local pyver
  pyver="$(/usr/bin/python -c 'import sys; print(f"{sys.version_info.major}.{sys.version_info.minor}")')"
  install -Dm755 native/build/libmoss_native.so \
    "$pkgdir/usr/lib/python${pyver}/site-packages/moss/native/libmoss_native.so"

  # Install icon
  install -Dm644 "$srcdir/moss.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/moss.svg"

  # Install license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Install man pages (from source tarball)
  install -Dm644 "docs/man/moss.1" "$pkgdir/usr/share/man/man1/moss.1"

  # Install fish completion (from source repo)
  install -Dm644 "$srcdir/moss.fish" "$pkgdir/usr/share/fish/completions/moss.fish"
}
