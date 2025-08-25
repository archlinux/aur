# Maintainer:  David Wang < cryptic.triangles AT gmail.com >

pkgbase=libebu
pkgname=('libebu-zlib' 'libebu-libdeflate')
_pkgname='ebu'
pkgver=4.5_20220808
pkgrel=2
arch=('x86_64')
url='http://green.ribbon.to/~ikazuhiro/dic/ebu.html'
license=('BSD-3-Clause')
makedepends=('sed' 'findutils' 'zlib' 'libdeflate')
provides=('libebu.so' "$pkgbase")
source=("${url//ebu.html/files}/${_pkgname}-${pkgver//_/-}.tar.gz")
sha256sums=('374e90f8738d0ffc7a1e2f3d1c2be70626135f89aeb0656bc7ab0a0eb66f5b89')

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver//_/-}"
  echo "Removing link configuration for unused libraries..."
  sed -e 's/-liconv//g' \
      -i 'm4/gettext.m4' \
      -i 'configure'
  sed -e 's/-lnsl//g' \
      -e 's/-lresolv//g' \
      -i 'configure'
  sed -e '/AC_CHECK_LIB(nsl/c/' \
      -e '/AC_CHECK_LIB(resolv/c/' \
      -i 'configure.ac'

  echo "[autoupdate] Refreshing configure.ac..."
  autoupdate --force

  echo "[autoreconf] Refreshing make configuration scripts..."
  autoreconf --verbose --force --install --symlink

  # Check that ja-JP.EUC-JP is available in iconv which is needed for converting EUC-JP character encoded files
  if [ "$(iconv --list | grep -q "EUC-JP" ; echo $?)" != "0" ]; then
     echo "Please ensure your /etc/locale.def has ja-JP.EUC-JP line uncommented, and that you have ran locale-gen"
     exit 1
  fi

  echo "Converting EUC-JP HTML documents to UTF-8..."
  cd "${srcdir}/${_pkgname}-${pkgver//_/-}/doc"
  # Convert EUC-JP character encoded *.html.in to UTF-8
    while read html
      do
          iconv -f EUC-JP -t UTF-8 "$html" | sed 's/euc-jp/utf-8/' > "$html.utf8"
          mv "$html.utf8" "$html"
      done < <(find . -type f -name "*.html.in" -or -name "html-split")

  echo "Converting EUC-JP po-eb to UTF-8..."
  cd "${srcdir}/${_pkgname}-${pkgver//_/-}/po-eb"
  # Do the same for ../po-eb/ja.po
     iconv -f EUC-JP -t UTF-8 ja.po | sed 's/EUC-JP/UTF-8/' > ja.po.new
     mv ja.po.new ja.po

  echo "Converting EUC-JP po-ebutils to UTF-8..."
  cd "${srcdir}/${_pkgname}-${pkgver//_/-}/po-ebutils"
  # Do the same as well for ../po-ebutils/ja.po
     iconv -f EUC-JP -t UTF-8 ja.po | sed 's/EUC-JP/UTF-8/' > ja.po.new
     mv ja.po.new ja.po
}

build() {
  cp -a "${srcdir}/${_pkgname}-${pkgver//_/-}" "$pkgbase-zlib"
  cp -a "${srcdir}/${_pkgname}-${pkgver//_/-}" "$pkgbase-libdeflate"

  # build zlib
  cd "${srcdir}/${pkgbase}-zlib"
  CFLAGS+=' -Wno-incompatible-pointer-types'
  # https://gitlab.archlinux.org/pacman/namcap/-/issues/72#note_189964
  LDFLAGS+=' -Wl,-z,shstk'
  ./configure \
    --prefix='/usr' \
    --libexecdir="/usr/lib/${pkgbase}-zlib" \
    --localstatedir="/var/lib/${pkgbase}-zlib" \
    --sysconfdir='/etc' \
    --with-pkgdocdir="/usr/share/doc/html/${pkgbase}-zlib" \
    --disable-static
  make CFLAGS="-std=gnu17 -fpermissive"

  # build deflate
  cd "${srcdir}/${pkgbase}-libdeflate"
  CFLAGS+=' -Wno-incompatible-pointer-types'
  LDFLAGS+=' -Wl,-z,shstk'
  ./configure \
    --prefix='/usr' \
    --libexecdir="/usr/lib/${pkgbase}-libdeflate" \
    --localstatedir="/var/lib/${pkgbase}-libdeflate" \
    --sysconfdir='/etc' \
    --with-pkgdocdir="/usr/share/doc/html/${pkgbase}-libdeflate" \
    --disable-static \
    --enable-libdeflate
  make CFLAGS="-std=gnu17 -fpermissive"
}

check() {
  # for zlib
  cd "${srcdir}/${pkgbase}-zlib"
  make -k check

  # for libdeflate
  cd "${srcdir}/${pkgbase}-libdeflate"
  make -k check
}

package_libebu-zlib() {
  pkgdesc="Modified EB Library with JIS X 4081 UTF-8 extensions (zlib)"
  depends=('perl' 'zlib')
  conflicts=('libebu-libdeflate')
  replaces=('libebu-libdeflate')
  cd "${srcdir}/${pkgbase}-zlib"
  make DESTDIR="$pkgdir" install
  install -D -m644 'COPYING' "${pkgdir}/usr/share/licenses/${pkgbase}-zlib/LICENSE"
  # Include missing doc/ebutils.css
  install -m644 "doc/ebutils.css" "${pkgdir}/usr/share/doc/html/${pkgbase}-zlib"
  # Include ebappendix/ebuappendix
  install -D -m655 "ebappendix/ebuappendix" "${pkgdir}/usr/share/${pkgbase}-zlib/appendix"
}

package_libebu-libdeflate() {
  pkgdesc="Modified EB Library with JIS X 4081 UTF-8 extensions (libdeflate)"
  depends=('perl' 'libdeflate')
  conflicts=('libebu-zlib')
  replaces=('libebu-zlib')
  cd "${srcdir}/${pkgbase}-libdeflate"
  make DESTDIR="$pkgdir" install
  install -D -m644 'COPYING' "${pkgdir}/usr/share/licenses/${pkgbase}-libdeflate/LICENSE"
  # Include missing doc/ebutils.css
  install -m644 "doc/ebutils.css" "${pkgdir}/usr/share/doc/html/${pkgbase}-libdeflate"
  # Include ebappendix/ebuappendix
  install -D -m655 "ebappendix/ebuappendix" "${pkgdir}/usr/share/${pkgbase}-libdeflate/appendix"
}
