# Maintainer: Blake Morrison <blake@truealter.com>
# Contributor: ALTER Meridian Pty Ltd <hello@truealter.com>
#
# alter-runtime-git: ~Alter Identity Runtime (VCS package, tracks main)
#
# Builds the `alter-runtime` Python package directly from the public
# upstream at https://github.com/true-alter/alter-runtime, the standalone
# repository for the protocol runtime so it can be installed and audited
# independently.
#
# The non-git sibling (`alter-runtime`) tracks the PyPI release and is
# published once that release is available.
#
# Local test loop:
#   makepkg -si
#   makepkg --printsrcinfo > .SRCINFO

pkgname=alter-runtime-git
pkgver=0.1.0.r0.0000000
pkgrel=1
pkgdesc="~Alter Identity Runtime: L3 local sovereign daemon (git)"
arch=('any')
url="https://github.com/true-alter/alter-runtime"
license=('Apache-2.0')
depends=(
  'python'
  'python-httpx'
  'python-pydantic'
  'python-yaml'
  'python-watchdog'
)
optdepends=(
  'python-dbus-next: D-Bus session bus integration'
  'systemd: systemd user unit integration'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-wheel'
  'python-hatchling'
)
provides=('alter-runtime')
conflicts=('alter-runtime')
source=("$pkgname::git+https://github.com/true-alter/alter-runtime.git#branch=main")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  # Prefer the most recent tag if one exists; otherwise fall back to a
  # reproducible rN.SHA form derived from the main branch.
  ( git describe --long --tags --abbrev=7 2>/dev/null \
      | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ) \
    || printf '0.1.0.r%s.%s' \
         "$(git rev-list --count HEAD)" \
         "$(git rev-parse --short=7 HEAD)"
}

build() {
  # pyproject.toml and alter_runtime/ sit at the repo root, so the build
  # runs from $srcdir/$pkgname directly.
  cd "$srcdir/$pkgname"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkgname"

  # Install the wheel into $pkgdir.
  python -m installer --destdir="$pkgdir" "$srcdir/$pkgname/dist/"*.whl

  # Install the systemd user unit template, substituting the placeholders
  # the upstream renderer would otherwise apply at first-run. Using %h for
  # the home path lets systemd expand it per-user when the unit is enabled
  # via `systemctl --user`.
  install -d "$pkgdir/usr/lib/systemd/user"
  sed \
    -e 's|@ALTER_RUNTIME_BIN@|/usr/bin/alter-runtime|g' \
    -e 's|@ALTER_RUNTIME_HOME@|%h|g' \
    "$srcdir/$pkgname/alter_runtime/services/systemd/alter-runtime.service.in" \
    > "$pkgdir/usr/lib/systemd/user/alter-runtime.service"

  # LICENSE: Arch convention for non-common licenses.
  if [ -f "$srcdir/$pkgname/LICENSE" ]; then
    install -Dm644 "$srcdir/$pkgname/LICENSE" \
      "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  fi
}
