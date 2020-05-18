# Maintainer: AndyRTR <andyrtr@archlinux.org>
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=shared-mime-info
_commit=6bf9e4ff0fb7eff11a02bd937045bf5dc291841a # master 2020-05-06
pkgver=2.0+1+g6bf9e4f
pkgrel=2
pkgdesc="Freedesktop.org Shared MIME Info"
arch=('x86_64')
license=('GPL2')
depends=('libxml2' 'glib2')
#makedepends=('itstool' 'gettext')
makedepends=('itstool' 'gettext' 'xmlto' 'docbook-xsl' 'git' 'meson')
install=shared-mime-info.install
# https://gitlab.freedesktop.org/xdg/shared-mime-info
url="https://www.freedesktop.org/wiki/Specifications/shared-mime-info-spec/"
#source=(https://gitlab.freedesktop.org/xdg/shared-mime-info/uploads/b27eb88e4155d8fccb8bb3cd12025d5b/$pkgname-$pkgver.tar.xz
source=("git+https://gitlab.freedesktop.org/xdg/shared-mime-info.git#commit=$_commit"
        # tu run the testsuite
        "git+https://gitlab.freedesktop.org/xdg/xdgmime.git#commit=6663a2288d11b37bc07f5a01b4b85dcd377787e1" # master 2019-06-03
        update-mime-database.hook)
sha256sums=('SKIP'
            'SKIP'
            'f08efbcbac9d2bd18a805b8dcf3ed06d7763b97eca5935aa64d65593774b6501')
options=(!makeflags)

pkgver() {
  cd $pkgname
  git describe --long | sed 's/^Release.//;s/\([^-]*-g\)/\1/;s/-/+/g;'
}

prepare() {
  # build xdgmime from source to run the testsuite - check HACKING.md
  CFLAGS= make -C xdgmime
}

build() {
  # https://bugs.archlinux.org/task/38836
  # https://bugs.freedesktop.org/show_bug.cgi?id=70366
  # https://bugs.archlinux.org/task/66687
  #export ac_cv_func_fdatasync=no -> for now moved into aplm hook

  arch-meson ${pkgname} build \
    -D update-mimedb=false \
    -D xdgmime-path=${srcdir}/xdgmime

  # Print config
  meson configure build
  # compile it
  ninja -C build 
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
  install -Dm644 "$srcdir"/update-mime-database.hook "$pkgdir"/usr/share/libalpm/hooks/update-mime-database.hook
}
