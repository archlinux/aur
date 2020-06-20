# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=lua51-gifine-git
pkgbase='lua-gifine-git'
pkgdesc='Quickly record and edit gifs and videos of your desktop'
pkgver=r46.9cb3277
_rockrel=1
pkgrel=2
arch=('x86_64')
url='https://github.com/leafo/gifine'
license=('MIT')
depends=('ffmpeg'
         'graphicsmagick'
         'gifsicle'
         'slop' 
         'lua51-lgi'
         'lua')
makedepends=('luarocks' 'gendesk')
provides=('gifine')
source=("lua51-gifine::git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}"/gifine
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}"/gifine
  mkdir -p 5.1
  luarocks build --pack-binary-rock --lua-version=5.1 --deps-mode=none "gifine-dev-${_rockrel}.rockspec"
}

package() {
  cd "${srcdir}"/gifine
  luarocks install --lua-version=5.1 --tree="$pkgdir/usr/" --deps-mode=none *.rock
  sed -i "s@${pkgdir}@@" "${pkgdir}/usr/bin/gifine"
  install -Dm 644 "hi.png" "${pkgdir}/usr/share/pixmaps/gifine.png"
  gendesk -f -n --pkgname "gifine" --pkgdesc "${pkgdesc}" --exec="gifine" --categories=Graphics --icon gifine
  install -Dm 644 gifine.desktop "${pkgdir}/usr/share/applications/gifine.desktop"
  # remove luarocks-created root manifest
  rm "$pkgdir/usr/lib/luarocks/rocks-5.1/manifest"
}
# vim:set ts=2 sw=2 et: