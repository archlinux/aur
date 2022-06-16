# Maintainer: Max Harmathy <max.harmathy@web.de>
# Contributor: Wesley Moore <wes@wezm.net>
pkgname=tootle
pkgver=1.0
_pkgver=${pkgver//_/-}
pkgrel=7
pkgdesc="GTK3 client for Mastodon"
arch=('x86_64' 'aarch64')
url="https://github.com/bleakgrey/tootle"
license=('GPL3')
depends=(
 'glib2'
 'granite'
 'gtk3'
 'hicolor-icon-theme'
 'json-glib'
 'libhandy'
 'libsoup'
)
optdepends=(
 'noto-fonts-emoji: color emoji'
)
makedepends=(
 'cmake'
 'desktop-file-utils'
 'gnome-common'
 'gobject-introspection'
 'hicolor-icon-theme'
 'intltool'
 'meson'
 'ninja'
 'vala'
 'yelp-tools'
)
options=('!libtool')
source=(
 "https://github.com/bleakgrey/$pkgname/archive/${_pkgver}.tar.gz"
 "Use-reason_phrase-instead-of-get_phrase.patch"
 "Adhere-to-GLib.Object-naming-conventions.patch"
 "Application-make-app_entries-private.patch"
 "Fix-construct-prop.patch"
)
sha256sums=('e0a0a062b1b72010242f7bb4db97cd71190f23067188b5c07372264d768a0496'
            '06314649f967661defaf5d847a9ecdf4b942299a08613c4f3087afa6ecf5d7fc'
            '84962b788787c075fadaf2fe4e56f104340b6f1386c889df03455a67fcc5f779'
            '54baf63d378444e37a5bbfb8087fea5fc9c0bf90c67b0bde568b41c121f00660'
            'cd8046061895ca86fcaf07c856366caf40c39f770e2522f9a1afb29a526618d0')

build() {
  cd "${srcdir}/${pkgname}-${_pkgver}"

  patch -p1 < "$startdir/Use-reason_phrase-instead-of-get_phrase.patch"
  patch -p1 < "$startdir/Adhere-to-GLib.Object-naming-conventions.patch"
  patch -p1 < "$startdir/Application-make-app_entries-private.patch"
  patch -p1 < "$startdir/Fix-construct-prop.patch"

  arch-meson build
  ninja -C build
}

package() {
  cd "${srcdir}/${pkgname}-${_pkgver}"
  DESTDIR="$pkgdir" ninja -C build install
  ln -s "/usr/bin/com.github.bleakgrey.tootle" "${pkgdir}/usr/bin/tootle"
}
