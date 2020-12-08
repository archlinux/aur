# Maintainer: Max Harmathy <max.harmathy@web.de>
# Contributor: Wesley Moore <wes@wezm.net>
pkgname=tootle
pkgver=0.2.0
pkgrel=4
pkgdesc="GTK3 client for Mastodon"
arch=('x86_64')
url="https://github.com/bleakgrey/tootle"
license=('GPL3')
depends=('glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'granite' 'json-glib')
optdepends=('noto-fonts-emoji: color emoji')
makedepends=('git' 'desktop-file-utils' 'hicolor-icon-theme' 'intltool' 'yelp-tools' 'gnome-common' 'gobject-introspection' 'meson' 'ninja' 'vala')
options=('!libtool')
source=("https://github.com/bleakgrey/$pkgname/archive/${pkgver//_/-}.tar.gz"
        "fix-build-on-vala-46.patch")
sha256sums=('e83c4a0539bf7b4b9d2b81d036ee0e8a69564b11c70f77ded5091955a89d2737'
            '5158d1e2019eaf6f4fa043b8483f8dfa049335d572a2563a0d4f71f799cae2b0')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -p1 < ../fix-build-on-vala-46.patch
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  arch-meson -Db_pie=false build
  ninja -C build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  DESTDIR="${pkgdir}/" ninja -C build install
  ln -s "/usr/bin/com.github.bleakgrey.tootle" "${pkgdir}/usr/bin/tootle"
}
