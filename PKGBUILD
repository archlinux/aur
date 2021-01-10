pkgname=briar-gtk-git
_pkgname=briar-gtk
conflicts=('briar-gtk')
pkgver=0.1.0.beta2.r53.ga462450
pkgrel=2
pkgdesc='Native GTK Briar client'
url='https://code.briarproject.org/briar/briar-gtk'
arch=('any')
license=('GPL')
depends=('libhandy' 'python' 'gettext'
         'python-briar-wrapper-git' 'python-gobject'
         'briar-headless-git' 'java-runtime=11'
         'python-cairo')
makedepends=('meson' 'gtk3' 'appstream-glib' 'cmake'
             'git' 'ninja' 'java-environment=11')
source=("git+https://code.briarproject.org/briar/${_pkgname}.git"
        "briar-wrapper::git+https://code.briarproject.org/briar/python-briar-wrapper.git")
sha512sums=('SKIP' 'SKIP')

pkgver() {
  cd ${_pkgname}
  git describe --long --tags | sed -e 's/^v//' -e 's/-\([^-]*-g[^-]*\)$/-r\1/' -e 's/-/./g'
}

prepare() {
  cd ${_pkgname}
  git submodule init
  git config submodule.python-briar-wrapper.url "$srcdir/briar-wrapper"
  git submodule update --init --recursive
}

build() {
  arch-meson ${_pkgname} _build
  ninja -C _build all
}

package() {
  DESTDIR="$pkgdir" ninja install -C _build
}
