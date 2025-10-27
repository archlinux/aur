# Maintainer: Connor Behan <connor.behan@gmail.com>

pkgname=pidgin-talkfilters
pkgver=2.7.0
pkgrel=7
pkgdesc="Implements GNU talkfilters in pidgin chats"
arch=('x86_64')
url="https://keep.imfreedom.org/pidgin/purple-plugin-pack/"
license=('GPL')
depends=('libpurple' 'talkfilters')
makedepends=('intltool' 'gettext' 'python' 'pidgin' 'mercurial')
source=('hg+https://keep.imfreedom.org/pidgin/purple-plugin-pack/'
        'python3.patch')
sha256sums=('SKIP'
            '842292c95e61fb5a45b30eaed490d29ee67f725b46301e3590feafeb10014980')

build() {
  cd "$srcdir"/purple-plugin-pack
  hg checkout 165442c46226

  patch -Np1 -i ../python3.patch
  sed -i -e 's|GETTEXT_PACKAGE=plugin_pack|GETTEXT_PACKAGE=pidgin_talkfilters|'\
    configure.ac
  PYTHON=/usr/bin/python \
    ./autogen.sh --prefix=/usr --with-plugins=talkfilters

  make
}

package() {
  cd "$srcdir"/purple-plugin-pack

  make DESTDIR="$pkgdir" install
}
