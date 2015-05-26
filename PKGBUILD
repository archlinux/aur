# $Id: PKGBUILD 114073 2014-07-01 13:06:37Z kkeen $
# Maintainer: tobias <tobias@archlinux.org>
# Contributor: Jochem Kossen <j.kossen@home.nl>

pkgname=rox-filer-git
_realname=rox-filer
pkgver=2.11.r2531
pkgrel=1
groups=rox-desktop
provides=("rox" "rox-filer")
replaces=("rox" "rox-filer")
pkgdesc="A small and fast file manager which can optionally manage the desktop background and panels"
arch=("i686" "x86_64")
license=("GPL")
url="http://roscidus.com/desktop/"
depends=("sh" "libsm" "gtk2")
makedepends=("librsvg" "python2")
source=("${_realname}::git+https://github.com/rox-desktop/${_realname}.git"
        "rox.desktop"
        "rox.svg"
        "rox.sh")
md5sums=('SKIP'
         'de05c906395abd4402b0470c1bc2ae6e'
         '658c8648b51e215558e13e6afb2b5c76'
         '31578a90b241f0a8d09c9f8587608d00')

pkgver(){
        cd "${_realname}"
        echo "2.11.r$(git rev-list --count HEAD | sed 's/-/./g' )"
}

build() {
  cd "${srcdir}/${_realname}"
  ./ROX-Filer/AppRun --compile LIBS="-ldl -lm"

  # finally we render a png as fallback for svg unaware menu applications
  # Attention: always make sure you check the dimensions of the source-svg,
  # you can read the dimensions via inkscape's export function
  rsvg-convert -w 48 -h 38 -f png -o "${srcdir}/rox.png" "${srcdir}/rox.svg"
}

package() {
  cd "${srcdir}/${_realname}"
  install -d "${pkgdir}/usr/share/Choices/MIME-types"
  install -m755 Choices/MIME-types/* "${pkgdir}/usr/share/Choices/MIME-types/"
  cp -rp ROX-Filer "${pkgdir}/usr/share/"
  rm -fr "${pkgdir}"/usr/share/ROX-Filer/{src,build}

  install -Dm755 "${srcdir}/rox.sh" "${pkgdir}/usr/bin/rox-filer"

  # No more manpage in main build, any help is welkome
  #install -Dm644 rox.1 "${pkgdir}/usr/share/man/man1/rox.1"
  #ln -sf rox.1 "${pkgdir}/usr/share/man/man1/ROX-Filer.1"

  install -Dm644 "${srcdir}/rox.desktop" "${pkgdir}/usr/share/applications/rox.desktop"
  install -Dm644 "${srcdir}/rox.svg" "${pkgdir}/usr/share/pixmaps/rox.svg"
  install -Dm644 "${srcdir}/rox.png" "${pkgdir}/usr/share/pixmaps/rox.png"
}
