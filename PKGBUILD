# Maintainer: Robert Knauer <robert@privatdemail.net>
# Contributor: Thomas Weißschuh <thomas_weissschuh lavabit com>
# Contributor: zoulnix <http://goo.gl/HQaP>

pkgname=ultrastardx-svn
epoch=1
pkgver=3068
pkgrel=1
pkgdesc='Free and open source karaoke game.'
arch=('i686' 'x86_64')
url="http://ultrastardeluxe.org/"
license=('GPL')
depends=('ffmpeg-usdx' 'lua51' 'portaudio' 'sdl_image' 'sqlite' 'ttf-dejavu' 'ttf-freefont' 'wqy-microhei' 'pcre')
makedepends=('subversion' 'fpc')
options=('!libtool')
provides=('ultrastardx')
conflicts=('ultrastardx')
groups=('usdx')
source=(
  'ultrastardx::svn+http://svn.code.sf.net/p/ultrastardx/svn/trunk'
  'Makefile.in.patch'
  'ultrastardx.sh'
)
sha256sums=(
  'SKIP'
  'fbe8489745d4553885689b21415f795dee6d004ff2f1e573b093516421554428'
  '4dafd4314ce99cbc3e4ede811db031dc7e78d77d6033b948d74ee49576edeba7'
)
_svnmod="ultrastardx"

pkgver() {
  cd "${SRCDEST}/${_svnmod}"
  svnversion
}

prepare() {
  # create work copy
  rm -rf "${srcdir}/${_svnmod}-build"
  svn export "${SRCDEST}/${_svnmod}" "${srcdir}/${_svnmod}-build"
  cd "${srcdir}/${_svnmod}-build"
  # patch Makefile.in
  patch "src/Makefile.in" "${srcdir}/Makefile.in.patch"
}

build() {
  cd "${srcdir}/${_svnmod}-build"
  # configure
  PKG_CONFIG_PATH=/usr/lib/ffmpeg-usdx/pkgconfig libpcre_LIBDIR=/usr/lib ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var
  # make
  make LDFLAGS="-O1 --sort-common --as-needed -z relro"
}

package() {
  cd "${srcdir}/${_svnmod}-build"
  # install
  make DESTDIR="${pkgdir}" install
  # create directories"  
  install -d "${pkgdir}/usr/share/"{applications,pixmaps}
  # install desktop file
  install -m644 "${srcdir}/${_svnmod}-build/dists/${_svnmod}.desktop" "${pkgdir}/usr/share/applications/"
  # install icon
  install -m644 "${pkgdir}/usr/share/${_svnmod}/resources/icons/${_svnmod}-icon.png" "${pkgdir}/usr/share/pixmaps/${_svnmod}.png"
  # symlink fonts
  rm -f "${pkgdir}/usr/share/${_svnmod}/fonts/"*/*.tt*
  ln -s "/usr/share/fonts/TTF/DejaVuSans.ttf" "${pkgdir}/usr/share/${_svnmod}/fonts/DejaVu/"
  ln -s "/usr/share/fonts/TTF/DejaVuSans-Bold.ttf" "${pkgdir}/usr/share/${_svnmod}/fonts/DejaVu/"
  ln -s "/usr/share/fonts/TTF/FreeSans.ttf" "${pkgdir}/usr/share/${_svnmod}/fonts/FreeSans/"
  ln -s "/usr/share/fonts/TTF/FreeSansBold.ttf" "${pkgdir}/usr/share/${_svnmod}/fonts/FreeSans/"
  ln -s "/usr/share/fonts/wenquanyi/wqy-microhei/wqy-microhei.ttc" "${pkgdir}/usr/share/${_svnmod}/fonts/wqy-microhei/"
  # remove unnecessary stuff
  find "${pkgdir}" -type f -name "AUTHORS*" -exec rm {} \;
  find "${pkgdir}" -type f -name "COPYING*" -exec rm {} \;
  find "${pkgdir}" -type f -name "CREDITS" -exec rm {} \;
  find "${pkgdir}" -type f -name "LICENSE*" -exec rm {} \;
  find "${pkgdir}" -type f -name "README*" -exec rm {} \;
  # install binary wrapper
  mv "${pkgdir}/usr/bin/ultrastardx" "${pkgdir}/usr/bin/ultrastardx.bin"
  install -m755 "${srcdir}/ultrastardx.sh" "${pkgdir}/usr/bin/ultrastardx"
}
