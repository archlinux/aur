# Maintainer: Bruno Pagani <archange@archlinux.org>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Alexandre Filgueira <alexfilgueira@cinnarch.com>
# Contributor: Ner0
# Contributor: bones <bones99@archlinux.org>

pkgname=nemo-always-merge
_srcname=nemo
pkgver=6.6.4
pkgrel=1
pkgdesc='Nemo file manager with a hidden gsetting option to automatically merge directories during copy/move conflicts.'
arch=(x86_64)
url='https://github.com/linuxmint/nemo'
license=('GPL-3.0-or-later AND LGPL-2.1-or-later')
depends=(
  at-spi2-core
  bash
  cairo
  cinnamon-desktop
  dconf
  exempi
  libgcc
  gdk-pixbuf2
  glib2
  glibc
  gtk3
  gvfs
  hicolor-icon-theme
  json-glib
  libexif
  libx11
  libxmlb
  pango
  python
  python-cairo
  python-gobject
  xapp
)
optdepends=(
  'catdoc: search helpers support for legacy MS Word files'
  'cinnamon-translations: i18n'
  'ffmpegthumbnailer: support for video thumbnails'
  'ghostscript: search helpers support for PostScript files'
  'libgsf: search helpers support for MS Office files'
  'libreoffice: search helpers support for legacy MS PowerPoint files'
  'poppler: search helpers support for PDF files'
  'python-xlrd: search helpers support for legacy MS Excel files'
)
makedepends=(
  git
  glib2-devel
  gobject-introspection
  gtk-doc
  intltool
  libgsf
  meson
)
source=(
  "git+https://github.com/linuxmint/nemo.git#tag=$pkgver"
  "always-merge-directories.patch"
)
b2sums=('14ebc3efe1a229180aad7e3d848116622e833263909a467b9810110171e167be8df7eb2999ffc3831671ff4dd90e43e47d4fac9238d554f549fe7d15c9f78457'
        '921926c6afd360fde666e0ea07141f28147ad964a0d179027362a048f3d74a7108fdab022b7a97cb674aa14b5676ea5fc4a311431da35edcad91ad0a5aaf6a5b')

provides=('nemo')
conflicts=('nemo')

prepare() {
  cd $_srcname
  patch --forward \
      -Np1 -i $srcdir/always-merge-directories.patch
}

build() {
  arch-meson $_srcname build \
    --libexecdir=lib/nemo \
    -D gtk_doc=true
  meson compile -C build
}

package() {
  meson install -C build --destdir="$pkgdir"
}
