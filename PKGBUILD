# Maintainer: Maciej Suminski <orson@orson.net.pl>

pkgname=fheroes2enh-git
pkgver=r305.21f2504
pkgrel=1
pkgdesc="Free Heroes 2 is an engine recreation of game Heroes 2 (of Might and Magic) with UI and coding enhancements."
arch=('i686' 'x86_64')
url="https://github.com/ciplogic/fheroes2enh"
license=('GPL2')
depends=('sdl_image' 'sdl_mixer' 'sdl_ttf')
makedepends=('git' 'cmake')
conflicts=('fheroes2-svn')
install='fheroes2enh-git.install'
source=("${pkgname}"'::git+https://github.com/ciplogic/fheroes2enh'
        'fheroes2enh-git.install')
sha256sums=('SKIP'
         '9bfcb311ccb8fa3785cb769b1cc5f9a5fa3488cc7a72d2dc6f4e5afe1de16769')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list HEAD --count --first-parent)" "$(git rev-parse --short HEAD)"
}

build() {
  mkdir -p "${srcdir}/build"
  cd "${srcdir}/build"
  cmake "../${pkgname}" -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_CXX_FLAGS="-DCONFIGURE_FHEROES2_DATA='\"/usr/share/fheroes2\"'"
  make
}

package() {
  install -Dm755 "${srcdir}/build/fheroes2" "${pkgdir}/usr/bin/fheroes2"
  install -Dm644 "${srcdir}/${pkgname}/fheroes2.cfg" "${pkgdir}/usr/share/fheroes2/fheroes2.cfg"
  install -Dm644 "${srcdir}/${pkgname}/fheroes2.key" "${pkgdir}/usr/share/fheroes2/fheroes2.key"
  cd ${srcdir}/${pkgname}/files && find . -type f -exec install -Dm644 "{}" "${pkgdir}/usr/share/fheroes2/files/{}" \;
}

# vim:set ts=8 sts=2 sw=2 et:
