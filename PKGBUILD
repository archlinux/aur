# Maintainer: Vaporeon <vaporeon@vaporeon.io>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=glib2-patched-thumbnailer
pkgver=2.50.2
pkgrel=1
pkgdesc="GLib2 patched with ahodesuka's thumbnailer patch."
url="http://gist.github.com/ahodesuka/49c1d0eea4b64f24c4c7"
arch=(i686 x86_64)
provides=(glib2)
conflicts=(glib2)
makedepends=('gettext' 'zlib' 'shared-mime-info' 'python' 'libelf' 'git')
depends=('pcre' 'libffi' 'tumbler')
optdepends=('python: for gdbus-codegen and gtester-report'
            'libelf: gresource inspection tool')
checkdepends=(desktop-file-utils dbus)
options=('!docs' '!emptydirs')
license=('LGPL')

_commit=224f8171dceca920cfd8a4b446726b7610cdafd9  # tags/2.50.2^0
_patchver=d0edf118e1c27700300038c1d82b3ff775c0216b

source=("git://git.gnome.org/glib#commit=$_commit"
        glib-compile-schemas.hook
        gio-querymodules.hook
        revert-warn-glib-compile-schemas.patch
        https://gist.githubusercontent.com/ahodesuka/49c1d0eea4b64f24c4c7/raw/$_patchver/glib-thumbnailer.patch)
sha256sums=('SKIP'
            'e1123a5d85d2445faac33f6dae1085fdd620d83279a4e130a83fe38db52b62b3'
            '5ba204a2686304b1454d401a39a9d27d09dd25e4529664e3fd565be3d439f8b6'
            '049240975cd2f1c88fbe7deb28af14d4ec7d2640495f7ca8980d873bb710cc97'
            '1a4673380fbdf8e8e5de3367089de6c97025633e54010575de63c5ab6c8a044d')

pkgver() {
  cd glib
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd glib
  patch -Rp1 -i ../revert-warn-glib-compile-schemas.patch
  patch -Np1 -i ../glib-thumbnailer.patch
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd glib
  ./configure --prefix=/usr --libdir=/usr/lib \
      --sysconfdir=/etc \
      --with-pcre=system \
      --disable-fam
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

# check() {
#   cd glib
#   if ! make check; then
#     make check
#   fi
# }

package() {
  cd glib
  make completiondir=/usr/share/bash-completion/completions DESTDIR="$pkgdir" install

  chmod -x "$pkgdir"/usr/share/bash-completion/completions/*

  # install hooks
  install -d "$pkgdir/usr/share/libalpm/hooks/"
  install -m644 "$srcdir"/{glib-compile-schemas,gio-querymodules}.hook \
    "$pkgdir/usr/share/libalpm/hooks/"
}
