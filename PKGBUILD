# Maintainer: Joachim Desroches <joachim.desroches@epfl.ch>

pkgname=epfl-moody-git
pkgver=r108.3033089
pkgrel=1
pkgdesc="Gnome client for EPFL's Moodle system"

arch=('x86_64')
url='https://gitlab.gnugen.ch/afontain/moodle/'
license=('GPL3')

depends=('libhandy' 'modest' 'libsecret')
optdepends=('kwallet: use KWallet as a backend for libsecret.'
            'gnome-keyring: use gnome-keyring as a backend for libsecret.')
makedepends=('git' 'meson' 'patch')

conflicts=(epfl-moody)
provides=(epfl-moody)

source=('git+https://gitlab.gnugen.ch/afontain/moodle' 'meson.build.patch')
md5sums=('SKIP'
         '9ac03a20b058e5b8139359641373efe2')

pkgver() {
  cd moodle/
  printf 'r%d.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  patch --forward --strip=1 --input=meson.build.patch
}

build() {
  cd moodle/
  meson --buildtype=release --prefix=/usr --sysconfdir=/etc build/
  ninja -C build/ all
}

package() {
  cd moodle/
  DESTDIR="$pkgdir" ninja -C build/ install
}
