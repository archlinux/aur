# Maintainer: Robert Dannenbring <robert.dannenbring@gmail.com>

pkgname=hyprwrc-git
_pkgname=hyprwrc
pkgver=0.1.0.r0.g0000000
pkgrel=1
pkgdesc="Build Hyprland window rules by clicking the window"
arch=('any')
url="https://github.com/rdannenbring/HyprWindowRuleCreator"
license=('MIT')

# gtk4/libadwaita come in through python-gobject's own deps, but naming them
# is honest: this app will not start without either.
depends=(
  'python'
  'python-gobject'
  'gtk4'
  'libadwaita'
  'hyprland'
  'slurp'
)
optdepends=(
  'gtksourceview5: syntax highlighting in the generated-rule pane'
)
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  # No tags yet; fall back to 0.1.0 plus commit count so upgrades still order
  # correctly. Once a tag exists the first branch takes over.
  #
  # The describe is tested on its own rather than piped into sed with a `||`
  # fallback: a pipeline reports the *last* command's status, and sed happily
  # succeeds on empty input, so the fallback would never run and pkgver would
  # come out empty.
  local described
  if described=$(git describe --long --tags 2>/dev/null) && [[ -n $described ]]; then
    printf '%s' "$described" | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
  else
    printf '0.1.0.r%s.g%s' \
      "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  fi
}

build() {
  cd "$srcdir/$_pkgname"
  python -m build --wheel --no-isolation
}

check() {
  cd "$srcdir/$_pkgname"
  # Only the tests that need no compositor. The rest talk to a running
  # Hyprland over its socket, which a build chroot does not have.
  local failed=0
  for t in tests/test_emit.py tests/test_picker.py tests/test_scan.py \
           tests/test_settings.py tests/test_templates.py tests/test_branding.py; do
    PYTHONPATH="$PWD" python "$t" || failed=1
  done
  return $failed
}

package() {
  cd "$srcdir/$_pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 packaging/hyprwrc.desktop \
    "$pkgdir/usr/share/applications/$_pkgname.desktop"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
