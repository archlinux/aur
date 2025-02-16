# Maintainer: robertfoster

pkgname=xash3d-git
pkgver=r5300.2465782a
pkgrel=1
pkgdesc="A custom Gold Source engine rewritten from scratch"
arch=('i686' 'x86_64')
url="http://xash.su/"
license=('GPL3')
depends=('fontconfig' 'freetype2' 'libpulse' 'sdl2-compat')
makedepends=('git')
backup=('etc/conf.d/xash3d')
source=("${pkgname%%-git}::git+https://github.com/FWGS/xash3d-fwgs"
  ${pkgname%%-git}.sh
  ${pkgname%%-git}.conf
  ${pkgname%%-git}.desktop
  https://github.com/FWGS/xash-extras/releases/download/v0.19.2/extras.pak
)

pkgver() {
  cd "${srcdir}/${pkgname%%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${pkgname%%-git}"

  git submodule update --init --recursive
}

build() {
  cd "${srcdir}/${pkgname%%-git}"

  ./waf configure \
    --prefix=/usr \
    -8 \
    -T release
  ./waf build
}

package() {
  cd "${srcdir}/${pkgname%%-git}"
  ./waf install --destdir="${pkgdir}/usr/lib/xash3d"

  install -Dm644 ../"${pkgname%%-git}.conf" \
    "${pkgdir}/etc/conf.d/${pkgname%%-git}"
  install -Dm755 ../"${pkgname%%-git}.sh" \
    "${pkgdir}/usr/bin/${pkgname%%-git}"

  install -Dm644 ../"${pkgname%%-git}.desktop" \
    "${pkgdir}/usr/share/applications/${pkgname%%-git}.desktop"
  install -Dm644 ../"${pkgname%%-git}/game_launch/icon-xash-material.png" \
    "${pkgdir}/usr/share/pixmaps/${pkgname%%-git}.png"
  install -Dm644 ../extras.pak \
    "${pkgdir}/usr/share/xash3d/extras.pak"
}

sha256sums=('SKIP'
  '502b3d0b0bf7eec2d6910a71cfca4a1d43860de87d3824f5c5f1e8ee794e9ba5'
  '2e0aafe79dafa39c5341748e17b2a733bd7465b928cbf77797ad182a3004c242'
  '62298a5710fe8f9d33a4b4a43df14ffe973942682c99fbcab852155ae24fbccf'
  'b3783f366f785fb1ac9bdacc6c677324b0507a4d98358a3ec94af3a088e363ce')
