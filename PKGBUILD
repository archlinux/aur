# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Thomas Baechler <thomas@archlinux.org>

pkgname=libfprint-git
_pkgname=libfprint
epoch=1
pkgver=0.8.1.r10.gb9e5b3a
pkgrel=1
pkgdesc="Library for fingerprint readers"
arch=(x86_64)
url="http://www.freedesktop.org/wiki/Software/fprint/libfprint"
license=(LGPL)
depends=(libusb nss pixman glib2)
makedepends=(git meson gtk-doc)
groups=(fprint-git)
provides=(libfprint)
conflicts=(libfprint)
source=("git+https://gitlab.freedesktop.org/libfprint/libfprint.git")
md5sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/^V_//;s/_/./g;s/-/.r/;s/-/./'
}

prepare() {
  cd $_pkgname
}

build() {
  # FIXME: documentation doesn't build:
  #
  # Building documentation for libfprint
  # ERROR:
  # Error in gtkdoc helper script:
  # 
  # ERROR: 'gtkdoc-scangobj' failed with status 1
  # Traceback (most recent call last):
  #   File "/usr/bin/gtkdoc-scangobj", line 71, in <module>
  #     sys.exit(scangobj.run(options))
  #   File "/usr/share/gtk-doc/python/gtkdoc/scangobj.py", line 1230, in run
  #     for line in common.open_text(options.types):
  #   File "/usr/share/gtk-doc/python/gtkdoc/common.py", line 51, in open_text
  #     return open(filename, mode, encoding=encoding)
  # FileNotFoundError: [Errno 2] No such file or directory: '/tmp/makepkg/build/libfprint/src/libfprint/build/doc/libfprint.types'
  # FAILED: meson-install
  # /usr/bin/python /usr/bin/meson install --no-rebuild
  # ninja: build stopped: subcommand failed.
  #
  arch-meson $_pkgname build -D x11-examples=false -D doc=false
  ninja -C build
}

check() {
  cd build
  meson test
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}
