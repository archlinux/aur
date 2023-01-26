# Maintainer: AndyRTR <andyrtr@archlinux.org>
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=shared-mime-info
_commit=a2ffb2810ebb387182612e3503dfe29455d4536d # = master 2022-12-15
pkgver=2.2+13+ga2ffb28
pkgrel=1
pkgdesc="Freedesktop.org Shared MIME Info"
arch=('x86_64')
license=('GPL2')
depends=('libxml2' 'glib2')
makedepends=('gettext' 'xmlto' 'docbook-xsl' 'git' 'meson')
install=shared-mime-info.install
# https://gitlab.freedesktop.org/xdg/shared-mime-info
url="https://www.freedesktop.org/wiki/Specifications/shared-mime-info-spec/"
source=("git+https://gitlab.freedesktop.org/xdg/shared-mime-info.git#commit=$_commit"
        # to run the testsuite
        "git+https://gitlab.freedesktop.org/xdg/xdgmime.git#commit=92f6a09fda2b23c2ab95cede8eb0612ca96bd0f7" # master 2022-01-19
        update-mime-database.hook)
sha256sums=('SKIP'
            'SKIP'
            'f08efbcbac9d2bd18a805b8dcf3ed06d7763b97eca5935aa64d65593774b6501')
options=(!makeflags)

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/^Release.//;s/\([^-]*-g\)/\1/;s/-/+/g;'
}

prepare() {
  # build xdgmime from source to run the testsuite - check HACKING.md
  CFLAGS= make -C xdgmime
}

build() {
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
  # use a prefix to run it early enough - other hooks may depend on it - FS#72858
  install -Dm644 "$srcdir"/update-mime-database.hook "$pkgdir"/usr/share/libalpm/hooks/30-update-mime-database.hook
}
