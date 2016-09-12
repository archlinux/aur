# Maintainer: Patrick Glandien <patrick@pagla.de>
# Contributor: Ionut Biru <ibiru@archlinux.org>

_pkgname=cogl
pkgname=$_pkgname-amdgpu-pro
pkgver=1.22.2
pkgrel=1
pkgdesc="cogl with support for amdgpu-pro"
arch=('i686' 'x86_64')
url="http://www.clutter-project.org/"
license=('GPL2')
depends=('mesa' 'libdrm' 'libxext' 'libxdamage' 'libxcomposite' 'gdk-pixbuf2' 'pango' 'libxrandr')
makedepends=('gobject-introspection' 'git' 'gtk-doc')
optdepends=('amdgpu-pro: hybrid driver for AMDGPU cards')
options=(!emptydirs)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
replaces=("${_pkgname}")
_commit=f38cda9046913c3627c52108467ba90e53d18c33
source=("git://git.gnome.org/cogl#commit=$_commit"
        '0001-fix-glsl-version.patch')
sha256sums=('SKIP'
            '1766949fb76a45c218dffaf191f70362791a5547aa72cbc3f51249f0379f3469')

pkgver() {
  cd $_pkgname
  git describe | sed 's/-/+/g'
}

prepare() {
  cd $_pkgname

  # Apply shader fix (thanks @ashleysommer)
  patch -p1 -i "${srcdir}/0001-fix-glsl-version.patch"

  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd "$_pkgname"
  ./configure --prefix=/usr \
    --enable-gles{1,2} \
    --enable-{kms,wayland}-egl-platform \
    --enable-wayland-egl-server

  # https://bugzilla.gnome.org/show_bug.cgi?id=655517
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make -j1
}

package() {
  cd "$_pkgname"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
