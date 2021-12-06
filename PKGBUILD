# Maintainer: Ilya Basin <basinilya at gmail dot com>
# Contributor: Mantas Mikulėnas <grawity@gmail.com>
# Contributor: Ionut Biru <ionut@archlinux.ro>
# Contributor: Vesa Kaihlavirta <vesa@archlinux.org>

_architectures='i686-w64-mingw32 x86_64-w64-mingw32'
options=(!strip !buildflags !emptydirs)

_realname=silc-toolkit
pkgname=mingw-w64-silc-toolkit
pkgver=1.1.12
pkgrel=1
pkgdesc="Toolkit for Secure Internet Live Conferencing"
url="http://silcnet.org"
license=(GPL2)
arch=('any')
#depends=('libidn' 'perl')
source=("https://downloads.sourceforge.net/project/silc/silc/toolkit/sources/$_realname-$pkgver.tar.gz"
        pidgin-silc-toolkit-1.1.12.patch
        GWLP_USERDATA.patch
        )
sha512sums=('21393e9e7880670550e2325aa2eeda65a802bca87888b6d807ebed3a86844428b2a99f7434e6208ff61308df3767a12dd5d047dc546197bb78782811cf2b5e60'
        SKIP
        SKIP
        )

prepare() {
  cd "$srcdir/$_realname-$pkgver"
  patch -Np1 -i ../pidgin-silc-toolkit-1.1.12.patch
  patch -Np1 -i ../GWLP_USERDATA.patch
  sed -i -e 's/AC_RUN_IFELSE/AC_LINK_IFELSE/g' configure.ac
  autoreconf -if
}

build() {
  cd "$srcdir"
  for _arch in ${_architectures}; do
  # VPATH Build broken
  cp -aT "$_realname-$pkgver" "build-${_arch}" && pushd "build-${_arch}"

  ${_arch}-configure \
    --with-win32 \
    "."

  make

  popd
  done
}

package() {
  for _arch in ${_architectures}; do
  pushd "$srcdir/build-${_arch}"

  make DESTDIR="$pkgdir" install
  # remove 26 MB of developer-oriented documentation
  rm -rf "$pkgdir"/usr/${_arch}/share/doc/$_realname

  popd
  done
}

# vim: ts=2:sw=2:et:nowrap
