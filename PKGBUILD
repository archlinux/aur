# Maintainer: MikolajQ

pkgname=luxtide-git
_name=luxtide
pkgver=2.0.0.r24.gfd8cb0a
pkgrel=1
pkgdesc='Automatic screen brightness that follows the sun, for DDC/CI monitors and laptop panels (development version)'
arch=('any')
url='https://github.com/MikolajQ/luxtide'
license=('MIT')
depends=('gtk4' 'python' 'python-gobject')
# fakeroot and make are part of base-devel, which AUR packages usually take
# for granted; listed so that an AUR helper installs them where it is missing.
makedepends=('git' 'fakeroot' 'make')
optdepends=('ddcutil: external monitors over DDC/CI'
            'gnome-shell-extension-appindicator: tray icon on GNOME'
            'geoclue: find the location automatically'
            'libshumate: map in the location window')
provides=("$_name")
# ddc-sun-dimmer is the project's former name.
conflicts=("$_name" 'ddc-sun-dimmer')
# Python only, no binaries: nothing to strip, no debug package, and no need
# for strip or debugedit at build time.
options=('!strip' '!debug')
install=$_name.install
source=("git+$url.git")
sha256sums=('SKIP')

# Same scheme as packaging/arch/build-local.sh: the release in the code, then
# the number of commits and the commit.
pkgver() {
  cd "$_name"
  local release
  release=$(sed -n 's/^__version__ = "\(.*\)"$/\1/p' luxtide/__init__.py)
  printf '%s.r%s.g%s' "$release" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

check() {
  cd "$_name"
  python -m unittest discover -s tests -q
}

package() {
  cd "$_name"
  make -s DESTDIR="$pkgdir" PREFIX=/usr install
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$_name/"
  # make install puts the licence under the plain name.
  ln -s "$_name" "$pkgdir/usr/share/licenses/$pkgname"

  # The modules live in a private directory that users cannot write to, so
  # without this Python would recompile them at every start.
  python -m compileall -q -o 0 -o 1 -s "$pkgdir" -p / "$pkgdir/usr/lib/$_name"
}
