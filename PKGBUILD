# Maintainer: James An <james@jamesan.ca>

pkgname=pinot-search-git
_pkgname=${pkgname%-git}
pkgver=1.09.r2.g1fcd6eb
pkgrel=1
pkgdesc="Personal search and metasearch for the Free Desktop"
arch=('i686' 'x86_64')
url="https://code.google.com/p/$_pkgname"
license=('GPL')
depends=('boost-libs' 'chmlib' 'dbus-glib' 'desktop-file-utils' 'exiv2' 'gmime' 'gsoap' 'gtkmm' 'libexttextcat' 'libxml++2.6' 'openssh-askpass' 'openssl-1.0' 'shared-mime-info' 'sqlite' 'taglib' 'xapian-core')
makedepends=('boost' 'git')
optdepends=(  'antiword: index MS Word documents'
            'catdvi: index DVI TeX documents'
            'catppt: index PowerPoint presentations'
            'djvutxt: index DjVu documents'
            'pdftotext: index PDF documents'
            'rst2html: index reStructuredText documentation'
            'unrtf: index RTF documents'
            'unzip: index OpenDocument/StarOffice files'
            'xls2csv: index MS Excel spreadsheets')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=()
install=
source=("$_pkgname"::"git+https://github.com/kendling/$_pkgname.git"
        'bool-to-null-ptr.patch')
md5sums=('SKIP'
         '29b84f8e0704d78a641cad8db733df45')

prepare() {
  cd "$_pkgname"

  patch -p1 -i ../bool-to-null-ptr.patch
}

build() {
  cd "$_pkgname"

  export SSL_CFLAGS="$(PKG_CONFIG_PATH=/usr/lib/openssl-1.0/pkgconfig pkg-config --cflags "openssl >= 0.9.7")"
  export SSL_LIBS="$(PKG_CONFIG_PATH=/usr/lib/openssl-1.0/pkgconfig pkg-config --libs "openssl >= 0.9.7")"
  export LIBS='-lboost_system'
  ./autogen.sh --prefix=/usr --enable-chmlib --enable-gio --enable-gtkmm3 --enable-libarchive --enable-mempool=no
}

check() {
  cd "$_pkgname"

  make -k check
}

package() {
  cd "$_pkgname"

  make DESTDIR="$pkgdir/" install
}
