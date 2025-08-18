# Maintainer: Johannes Simon Piermeier <pierm.jo+github-public@gmail.com>

pkgname=discord-hushd-git
pkgver=0.1.0.r3.g4b12c0f
pkgrel=1
pkgdesc='Systemd daemon and CLI to mute/deafen Discord via RPC (git version)'
arch=('any')
url='https://gitlab.com/johannes-piermeier/discord-hushd'
license=('MIT')
provides=('discord-hushd')
conflicts=('discord-hushd')
depends=(
  'python'
  'python-requests'
  'python-flask'
  'python-pypresence'
  'python-tomli-w'
)
makedepends=('git' 'python-build' 'python-installer' 'python-wheel')
source=("git+$url.git#branch=main")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/discord-hushd"
  # Prefer annotated tags like v0.1.0; fall back if none exist
  if git describe --long --tags --match 'v*' >/dev/null 2>&1; then
    git describe --long --tags --match 'v*' \
      | sed 's/^v//; s/-/.r/; s/-/./'
  else
    printf "0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  fi
}

build() {
  cd "$srcdir/discord-hushd"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/discord-hushd"
  python -m installer --destdir="$pkgdir" dist/*.whl

  # systemd user unit
  install -Dm644 "systemd/discord-hushd.service" \
    "$pkgdir/usr/lib/systemd/user/discord-hushd.service"

  # license
  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
