# Maintainer: Jason Scurtu (scujas) <jscurtu@gmail.com>
# Original Maintainer: Marcin Tydelski <marcin.tydelski@gmail.com> 
# Contributor: Jan Lukas Gernert (JeanLuc) <https://launchpad.net/~eviltwin1>

pkgname=feedreader
pkgver=1.4.1
pkgrel=3
pkgdesc='A simple feedreader client for web services like Tiny Tiny RSS and in the future others.'
arch=('i686' 'x86_64')
url='https://launchpad.net/feedreader'
license=('GPL3')
depends=('sqlite3' 'gtk3' 'webkit2gtk' 'libnotify' 'html2text-with-utf8' 'libsoup' 'libgee' 'json-glib' 'libsecret')
makedepends=('vala' 'gobject-introspection' 'cmake')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
install="${pkgname%-*}.install"
source=('https://launchpad.net/feedreader/'${pkgver%.*}'/'${pkgver}'/+download/FeedReader-'${pkgver}'.tar.gz' patched_tmp_folder.patch)
sha256sums=('1a0fcaf3d6bbd6bc75e3ef85e2d00e63ad85b150c566212de3b8f58decd0cfeb'
            'f00d16f3e0ed85171972c8c87fe8aec9058eb85273fd1523a50e40ead2f9cf17')

pkgver() {
  cd "${srcdir}"
}

##Build without Libunity (-DWITH_LIBUNITY=OFF)
build() {
  cd "${srcdir}"
  if [[ -d "${srcdir}/build" ]]; then
    rm -rf "${srcdir}/build"
  fi
  patch -p1 -i $srcdir/patched_tmp_folder.patch
  mkdir "${srcdir}/build" && cd "${srcdir}/build"
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DUSE_WEBKIT_4=ON -DWITH_LIBUNITY=OFF -DWITH_VILISTEXTUM=OFF ..
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et
