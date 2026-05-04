# Maintainer: Andy Alt <arch_stanton5995 at proton.me>
# Contributor: Mike Sampson <mike at sambodata dot com>
# Contributor: dale <dale@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=moon-lander
pkgver=1.0
pkgrel=8
pkgdesc="An addictive game of skill where you must land a space-ship on the moon at a perfect speed."
arch=('x86_64')
url="https://packages.debian.org/source/sid/${pkgname}"
license=('BSD-2-Clause')
depends=(
  'glibc'
  'sdl'
  'sdl_mixer>=1.2.10'
  'sdl_image'
)
source=(
  "http://ftp.debian.org/debian/pool/main/m/${pkgname}/${pkgname}_${pkgver}.orig.tar.gz"
  10_fix-build.patch
  20_fix-score.patch
  30_fix-backgrounds.patch
  40_explicitly-link-to-math-library.patch
  50_fix-LDFLAGS-var-handling.patch
  60_fix-gcc-warnings.patch
  fix-crashes-at-startup.patch
  fix-bonus-ship.patch
  "${pkgname}.desktop"
  LICENSE
)
md5sums=(
  '5726de9d85b9e8b60c27f2ea6428bc96'
  'cbd1514ebd27f954e72da369af316725'
  '9a9f4c724c5404a08fb301bcaba558af'
  'eefb4e0cf1c5c8c14c4ad1249eb2cff1'
  'c6ae23bb2085781a27943c8d92ad2260'
  'cec58c545fbc3115cd642d1ff8b9336c'
  '72e7d9f45701a6a19bce4dc09688520a'
  'e25074e4de9ee446612be31760ba3058'
  '09bddaedd8c6265046fec8234a748f27'
  '8bba1446183337ab24b427cb92a118f8'
  '883198142cca0450dfaab47ec26ac8c2'
)

build() {
  cd "${srcdir}/${pkgname}"
  patch -p1 < ../10_fix-build.patch
  patch -p1 < ../20_fix-score.patch
  patch -p1 < ../30_fix-backgrounds.patch
  patch -p1 < ../40_explicitly-link-to-math-library.patch
  patch -p1 < ../50_fix-LDFLAGS-var-handling.patch
  patch -p1 < ../60_fix-gcc-warnings.patch
  patch -p1 < ../fix-crashes-at-startup.patch
  patch -p1 < ../fix-bonus-ship.patch
  sed -i "s|/usr/share/games/${pkgname}/|/usr/share/${pkgname}/|" moon_lander.c

  make clean
  make
}

package() {
  cd "${srcdir}/${pkgname}"

  install -dm755 "${pkgdir}/usr/share/${pkgname}"/{fonts,images/{backgrounds,kablam},sounds}
  for dir in fonts images{,/backgrounds,/kablam} sounds; do
    cp -R "$dir"/* "${pkgdir}/usr/share/${pkgname}/$dir" && chmod -R 755 "${pkgdir}/usr/share/${pkgname}/$dir"
  done
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

  install -Dm644 "${srcdir}/${pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
