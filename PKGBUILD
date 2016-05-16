pkgname=mcabber-crew-hg-extended
pkgver=2062
pkgrel=2
pkgdesc="mcabber-crew jabber client with extended autocompletion and highlighting"
arch=('i686' 'x86_64')
provides=('mcabber=0.10.2')
conflicts=(mcabber mcabber-lm-hg mcabber-hg mcabber-crew)
url="http://www.mcabber.com"
license=('GPL')
provides=('mcabber-crew-hg')
depends=('ncurses' 'glib2' 'openssl' 'gpgme' 'libotr' 'aspell' 'loudmouth-ossl')
makedepends=('pkgconfig' 'mercurial')
source=(
    register_builtin_cat_export.patch
    should-be-able-to-highlight-message-from-pre-msg-hook.patch
)

md5sums=('b857d5063795e599c1ac0b5bdaa7d232'
         '263f330d3344ce0847631c3aadf4a340')

_hgroot="https://bitbucket.org/McKael/mcabber-crew"
_hgrepo="mcabber-crew"

prepare() {
  cd ${srcdir}
  hg clone ${_hgroot}
}

build() {
  cp -a ${srcdir}/${_hgrepo}/mcabber ${srcdir}/mcabber-build || return 1
  cd ${srcdir}/mcabber-build
  patch -p2 < ../register_builtin_cat_export.patch
  patch -p2 < ../should-be-able-to-highlight-message-from-pre-msg-hook.patch
  ./autogen.sh
  ./configure --with-libotr-inc-prefix=/usr/include/libotr3 --prefix=/usr --enable-hgcset \
      --mandir=/usr/share/man \
      --enable-aspell --enable-modules --enable-otr
  make || return 1
}

package() {
  cd ${srcdir}/mcabber-build
  make DESTDIR=${pkgdir} install || return 1
  mkdir -p ${pkgdir}/usr/share/mcabber/example
  msg "Copying mcabberrc.example to usr/share/mcabber/example/mcabberrc"
  cp -a ${srcdir}/mcabber-build/mcabberrc.example \
    ${pkgdir}/usr/share/mcabber/example/mcabberrc

   mkdir -p ${pkgdir}/usr/share/mcabber/doc
  install -D -m 0644 ${srcdir}/${_hgrepo}/mcabber/doc/HOWTO_modules.txt \
      ${pkgdir}/usr/share/mcabber/doc/HOWTO_modules.txt
  mkdir -p ${pkgdir}/usr/include/mcabber/
  install -D -m 0644 ${srcdir}/mcabber-build/mcabber/*.h \
         ${pkgdir}/usr/include/mcabber/ || return 1

  rm -rf ${srcdir}/mcabber-build
}
