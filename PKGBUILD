# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Bernhard Landauer <oberon@manjaro.org>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Alexandre Filgueira <alexfilgueira@cinnarch.com>
# Contributor: Ner0

pkgname=nemo-git
pkgver=6.4.5.r0.g8d48119
pkgrel=1
pkgdesc="Cinnamon file manager (Nautilus fork)"
arch=(x86_64)
url="https://github.com/linuxmint/nemo"
license=(GPL-2.0-or-later LGPL-2.0-or-later LGPL-2.1-or-later)
depends=(cinnamon-desktop dconf gvfs exempi libexif libnotify libxml2
         python xapp)
optdepends=('cinnamon-translations: i18n'
            'ffmpegthumbnailer: support for video thumbnails'
            'catdoc: search helpers support for legacy MS Office files'
            'ghostscript: search helpers support for PostScript files'
            'libgsf: search helpers support for MS Office files'
            'libreoffice: search helpers support for legacy MS Office powerpoint files'
            'odt2txt: search helpers support for LibreOffice files'
            'poppler: search helpers support for PDF')
makedepends=(git meson samurai gobject-introspection intltool libgsf glib2-devel)
conflicts=(nemo)
provides=(nemo)
source=("git+https://github.com/linuxmint/nemo.git")
sha256sums=('SKIP')

pkgver() {
  cd nemo
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd nemo
  # Rename 'Files' app name to avoid having the same as nautilus
  sed -i '/^\[Desktop Entry/,/^\[Desktop Action/ s/^Name\(.*\)=.*/Name\1=Nemo/' data/nemo.desktop.in
}

build() {
  arch-meson --libexecdir=lib/${pkgname} nemo build
  samu -C build
}

package() {
  DESTDIR="${pkgdir}" samu -C build install
}
