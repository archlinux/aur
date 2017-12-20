# Maintainer: Raymond Wanyoike <raymond[dot]wanyoike[at]gmail[dot]com>

_gitauthor=galliumos
_gitname=xkeyboard-config

pkgname="galliumos-${_gitname}"
pkgver="2.22"
pkgrel=1
pkgdesc="X keyboard configuration files"
arch=("any")
license=("custom")
url="https://www.freedesktop.org/wiki/Software/XKeyboardConfig"
makedepends=("git" "intltool" "xorg-xkbcomp" "libxslt" "xorg-util-macros")
provides=("${_gitname}" "xkbdata")
conflicts=("${_gitname}" "xkbdata")
source=(
  https://xorg.freedesktop.org/archive/individual/data/${_gitname}/${_gitname}-${pkgver}.tar.bz2{,.sig}
  "git+https://github.com/${_gitauthor}/${_gitname}.git")
sha256sums=(
  "deaec9989fbc443358b43864437b7b6d39caff07890a4a8055105ce9fcaa59bd"
  "SKIP"
  "SKIP")
validpgpkeys=("FFB4CCD275AAA422F5F9808E0661D98FC933A145")

prepare() {
  cd "${_gitname}-${pkgver}"
  patch -p1 < "${srcdir}/${_gitname}/debian/patches/chromebook.patch"
}

build() {
  cd "${_gitname}-${pkgver}"
  aclocal # fix automake version mismatch
  ./configure --prefix=/usr \
      --with-xkb-base=/usr/share/X11/xkb \
      --with-xkb-rules-symlink=xorg \
      --enable-compat-rules=yes
  make
}

package() {
  cd "${_gitname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  rm -f "${pkgdir}/usr/share/X11/xkb/compiled"
  install -m755 -d "${pkgdir}/var/lib/xkb"
  install -m644 -Dt "${pkgdir}/usr/share/licenses" COPYING
}
