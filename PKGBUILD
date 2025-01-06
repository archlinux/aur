# Maintainer: PhotonX <michael dot kogan at gmx dot net>
# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Connor Behan <connor.behan@gmail.com>
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>

# no = disable python2 support
# yes = enable python2 support with virtual terminal
_opt_python2='no'

set -u
pkgname='medit'
pkgver='1.2.0'
pkgrel='7'
pkgdesc='GTK+ text editor'
arch=('x86_64')
url='http://mooedit.sourceforge.net/'
license=('LGPL-2.1-only')
depends=('libsm')
depends+=('glibc' 'gcc-libs' 'glib2' 'at-spi2-core' 'bash' 'cairo' 'gdk-pixbuf2' 'gtk2' 'hicolor-icon-theme' 'libice' 'libx11' 'libxml2' 'pango')
#depends+=('pcre') # this isn't used
makedepends=('intltool' 'python')
makedepends+=('glib2-devel' 'pkg-config')
optdepends=('ctags: Show functions in the open document')
_srcdir="${pkgname}-${pkgver}"
source=(
  "https://downloads.sourceforge.net/mooedit/${pkgname}-${pkgver}.tar.bz2"
  'medit-python3.diff' # https://sourceforge.net/p/mooedit/feature-requests/19/
  '0000-medit-python3.diff' # The above patch was incompatible with python2. I rewrote the lines to be compatible with both.
  'medit.appdata.xml'
)
md5sums=('8388a8e275d0e1fa6cd19f7bb081279a'
         '26ac2f35877056e1430c66983ae81245'
         '398e8df3a484a1bfea1e7de780398f30'
         'd8443e6eab7addaa79f286cf4d6e8e82')
sha256sums=('f0f7b3d9e3337907a5b27aa2ff3a084250d7517b38488c50872a621b4e1f3a4d'
            'cafdb2581e2f301756a8a38269e143b884b1a0191f30a92f39cf1ed3e3f7fbf4'
            'b83a2c4f97bf4f7e21860cf123ac3ba0b45932814182ed3a6098c6b3bd73d88b'
            'dd83c9fcb5023563b7826ad6b796946a86947f886bdff773a8feb1a35b462618')

if [ "${_opt_python2}" = 'yes' ]; then
  depends+=('python2' 'pygtk')
  optdepends+=('vte-legacy: Use the integrated terminal')
  export PYTHON='/usr/bin/python2'
fi

prepare() {
  cd "${_srcdir}"

  # Python2 fix
  sed -i 's@^#!.*python$@#!/usr/bin/python2@' 'moo/moopython/plugins/lib/pyconsole.py'

  # Recognise PKGBUILD as shell script
  sed -i 's/*.sh/*.sh;PKGBUILD/' 'moo/mooedit/langs/sh.lang'

  #cd '..'; cp -pr "${_srcdir}" 'a'; ln -s "${_srcdir}" 'b'; false
  #diff -pNaru3 'a' 'b' > "0000-$RANDOM.patch"
  patch -Nup1 -i "${srcdir}/0000-medit-python3.diff"
}

build() {
  cd "${_srcdir}"
  if [ ! -s 'Makefile' ]; then
    # Switching to python3 would require converting pygtk code to python3-gobject https://askubuntu.com/questions/97023/why-cant-i-import-pygtk-with-python-3-2-from-pydev
    CFLAGS="${CFLAGS} -Wno-incompatible-pointer-types" \
    ./configure --prefix=/usr --disable-install-hooks --with-python="${_opt_python2}"
  fi
  nice make # V=1
}

package() {
  cd "${_srcdir}"
  make DESTDIR="${pkgdir}" install
  install -Dpm644 "${srcdir}/${pkgname}.appdata.xml" -t "${pkgdir}/usr/share/metainfo/"
  install -Dpm644 'COPYING' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
set +u
