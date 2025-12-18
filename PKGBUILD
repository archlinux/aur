pkgbase=emacs-deco
pkgname=(emacs-deco)
pkgver=30.2
pkgrel=1
arch=('x86_64')
url='https://www.gnu.org/software/emacs/emacs.html'
license=('GPL3')
provides=('emacs')
conflicts=('emacs-wayland')
depends=(
  gmp
  gnutls
  lcms2
  libacl.so
  libasound.so
  libgccjit
  libdbus-1.so
  libfontconfig.so
  libfreetype.so
  libgdk-3.so
  libgdk_pixbuf-2.0.so
  libgif.so
  libgio-2.0.so
  libglib-2.0.so
  libgobject-2.0.so
  libgpm.so
  libgtk-3.so
  libharfbuzz.so
  libice
  libjpeg.so
  libncursesw.so
  libotf
  libpango-1.0.so
  libpng
  librsvg-2.so
  libsm
  sqlite libsqlite3.so
  libsystemd.so
  libtiff.so
  libtree-sitter.so
  libwebp.so
  libwebpdemux.so
  libxfixes
  libxml2.so
  m17n-lib
  zlib
)
makedepends=(libgccjit)
source=(
  https://ftp.gnu.org/gnu/emacs/${provides}-${pkgver}.tar.xz{,.sig}
  0001-pgtk-headerbar-color.patch  
)
b2sums=('9163ba6bfab1010a156c669ac085ad363545d73e3ffac21c710b14b618df61a4c6a80a50fd3fa81d852c2ccace5080e614b679606fa584e28509f99ad6196784'
        'SKIP'
        '9c1be7d9745a1887dbeca6fde826858596a167913f354552ee5f7eaa2b785f1aa0ee5b29f86747e22f5c967eeca6cff3c6bae19689c3688a16a20b0f1120149e')
validpgpkeys=('17E90D521672C04631B1183EE78DAE0F3115E06B'  # Eli Zaretskii <eliz@gnu.org>
              'CEA1DE21AB108493CC9C65742E82323B8F4353EE') # Stefan Kangas <stefankangas@gmail.com>

prepare() {
  cp --reflink=auto -ar ${provides}-${pkgver} ${provides}-${pkgver}-deco
  cd ${provides}-${pkgver}-deco
  patch --strip=1 --input=../0001-pgtk-headerbar-color.patch
}

build() {
  local _confflags=(
    --sysconfdir=/etc
    --prefix=/usr
    --libexecdir=/usr/lib
    --localstatedir=/var
    --disable-build-details
    --with-cairo
    --with-harfbuzz
    --with-libsystemd
    --with-modules
    --with-native-compilation=aot
    --with-tree-sitter
  )

  export ac_cv_lib_gif_EGifPutExtensionLast=yes

  cd ${provides}-${pkgver}-deco
  ./configure \
    --with-pgtk \
    "${_confflags[@]}"
  make bootstrap
}

package() {
  pkgdesc='The extensible, customizable, self-documenting real-time display editor with PGTK enabled and colored headerbar'
  provides=(emacs)
  conflicts=(emacs)

  cd ${provides}-${pkgver}-deco
  make DESTDIR="${pkgdir}" install

  # remove conflict with ctags package
  mv "${pkgdir}"/usr/bin/{ctags,ctags.emacs}
  mv "${pkgdir}"/usr/share/man/man1/{ctags.1.gz,ctags.emacs.1}

  # fix user/root permissions on usr/share files
  chown -R root:root "${pkgdir}/usr/share/emacs/${pkgver}"
}
