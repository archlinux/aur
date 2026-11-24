# Maintainer: MikolajQ

pkgname=homemesh-git
_name=homemesh
pkgver=0.4.0.r11.g3fc22a8
pkgrel=1
pkgdesc='Open the home folders of your other computers in any file manager; pair them with a code (development version)'
arch=('any')
url='https://github.com/MikolajQ/homemesh'
license=('MIT')
depends=('gtk4' 'openssh' 'polkit' 'python' 'python-gobject')
# fakeroot and make are part of base-devel, which AUR packages usually take
# for granted; listed so that an AUR helper installs them where it is missing.
makedepends=('git' 'fakeroot' 'gettext' 'make')
optdepends=('gvfs: open the computers in Nautilus, Nemo, Thunar and Caja'
            'kio-extras: open the computers in Dolphin'
            'bubblewrap: share only chosen folders'
            'avahi: name.local addresses on systems without systemd-resolved'
            'nss-mdns: name.local addresses together with avahi'
            'tailscale: reach the computers away from home (or another VPN)')
provides=("$_name")
conflicts=("$_name")
# Python only, no binaries: nothing to strip, no debug package.
options=('!strip' '!debug')
install=$_name.install
source=("git+$url.git")
sha256sums=('SKIP')

# Same scheme as packaging/arch/build-local.sh: the release in the code, then
# the number of commits and the commit.
pkgver() {
  cd "$_name"
  local release
  release=$(sed -n 's/^__version__ = "\(.*\)"$/\1/p' homemesh/__init__.py)
  printf '%s.r%s.g%s' "$release" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

check() {
  cd "$_name"
  python -m unittest discover -s tests -q
}

package() {
  cd "$_name"
  make -s DESTDIR="$pkgdir" PREFIX=/usr install
  install -Dm644 README.md README.pl.md -t "$pkgdir/usr/share/doc/$_name/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  # The modules live in a private directory that users cannot write to, so
  # without this Python would recompile them at every start.
  python -m compileall -q -o 0 -o 1 -s "$pkgdir" -p / "$pkgdir/usr/lib/$_name"
}
