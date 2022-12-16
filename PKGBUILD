# Maintainer: Salvador Pardiñas <darkfm at vera dot com dot uy>
# Contributor: Levente Polyak <levente[at]leventepolyak[dot]net>
# Contributor: Dr.T.Error <der_dot_t_dot_error_at_online_dot_de>

pkgname=ufoai-git
_gitname=code
pkgver=2.6.45213.9b2eab2222
pkgrel=1
epoch=1
pkgdesc="In UFO: Alien Invasion you fight aliens trying to capture Earth (dev version)"
url="http://ufoai.org/wiki/News"
license=('GPL')
arch=('aarch64' 'x86_64')
depends=('libjpeg' 'libgl' 'libpng' 'curl' 'sdl2_image' 'sdl2_mixer' 'sdl2_ttf' 'libtheora' 'xvidcore' 'glu')
makedepends=('git' 'python2' 'zip' 'gtksourceview2' 'gtkglext' 'openal' 'python-urllib3')
optdepends=('python2: compiling self-created maps'
            'gtksourceview2: compiling the map-editor'
            'gtkglext: compiling the map-editor'
            'openal: compiling the map-editor')
conflicts=('ufoai' 'ufoai-data')
source=(git+git://git.code.sf.net/p/ufoai/code "0001-Fix-compilation-errors-on-format-security.patch")
#source=('git+file:///home/kouta-kun/ufo')
sha256sums=('SKIP' "18a4cc6cfed138c58f02fd733d19250749ba31d6eaa9078dffb6537bca92eb25")

pkgver() {
  cd ${_gitname}
  _ufover=$(grep UFO_VERSION src/common/common.h | sed -e 's/.*UFO_VERSION \"\(.*\)\"/\1/'|cut -d- -f1)
  echo ${_ufover}.$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
    cd ${_gitname}
    patch --forward --strip=1 --input="${srcdir}/0001-Fix-compilation-errors-on-format-security.patch"
    # uncomment the '--enable-uforadiant' line for ufo-radiant (map editor)
    ./configure --prefix=/usr --datadir=/usr/share/ufoai \
		--enable-release --localedir=/usr/share/ufoai/base/i18n/ \
		--disable-uforadiant
}

build() {
  cd ${_gitname}

  make
  make lang
  make models
  make maps-sync
  make pk3
}

package() {
  cd ${_gitname}

  # binaries
  install -Dm755 ufo "${pkgdir}/usr/bin/ufo"
  install -Dm755 ufoded "${pkgdir}/usr/bin/ufoded"
  install -Dm755 ufo2map "${pkgdir}/usr/bin/ufo2map"
  install -Dm755 ufomodel "${pkgdir}/usr/bin/ufomodel"

  # gamedata
  install -d -m755 "${pkgdir}/usr/share/ufoai"
  cp -r base "${pkgdir}/usr/share/ufoai"

  # licenses
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  cp COPYING LICENSES "${pkgdir}/usr/share/licenses/${pkgname}/"

  install -Dm644 debian/ufoai.desktop "${pkgdir}/usr/share/applications/ufoai.desktop"
  install -Dm644 debian/ufoai-safe.desktop "${pkgdir}/usr/share/applications/ufoai-safe.desktop"
  install -Dm644 debian/ufoded.desktop "${pkgdir}/usr/share/applications/ufoded.desktop"

  sed -i 's|/usr/games/||' "${pkgdir}"/usr/share/applications/*

  install -Dm644 debian/ufoai.xpm "${pkgdir}/usr/share/pixmaps/ufoai.xpm"
  install -Dm644 debian/ufoded.xpm "${pkgdir}/usr/share/pixmaps/ufoded.xpm"
}
# vim: ts=2 sw=2 et:
