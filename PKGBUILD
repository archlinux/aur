# Maintainer: Philipp Wolfer <ph.wolfer@gmail.com>

pkgname=librm
pkgver=2.1.0
pkgrel=2
pkgdesc="Router Manager library"
arch=('i686' 'x86_64')
url="https://www.tabos.org/"
license=('GPL2')

depends=(glib2 gdk-pixbuf2 libsoup speex libxml2 libtiff spandsp json-glib libsndfile gupnp gssdp gstreamer gst-plugins-base isdn4k-utils libsecret)
makedepends=(meson git)

options=('!emptydirs')
# source=("git+https://git.krueger-it.net/tabos.org/${pkgname}.git#tag=v${pkgver}")
source=(
  "git+https://gitlab.com/tabos/${pkgname}.git#tag=v${pkgver}"
  "gupnp-gssdp-1.2.patch"
)
sha512sums=(
  'SKIP'
  'ff00431718e9cb6aaa0f28c910c4409bbcd792a6916a2192c8d62056eb7457ef8a6932deb9fb35d939d6ee52e024805214d04372c70b8deee59c041eea52e404'
)

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --tags | sed 's/^v//;s/-/+/g'
}

prepare() {
  cd "${srcdir}/${pkgname}"
  patch -Np1 -i "${srcdir}/gupnp-gssdp-1.2.patch"
}

build() {
  cd "${srcdir}/${pkgname}"
  meson --prefix /usr --buildtype=plain "builddir"
  ninja -v -C "builddir"
}

check() {
  cd "${srcdir}/${pkgname}"
  ninja -C "builddir" test
}

package() {
  cd "${srcdir}/${pkgname}"
  DESTDIR="$pkgdir" ninja -C "builddir" install
}
