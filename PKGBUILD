# Maintainer: 0b100100 <0b100100 at protonmail dot ch>
# Contributor: Hans Kramer <kramer@b1-systems.de>

pkgname=linrad-svn
pkgver=05.01.r998
pkgrel=1
pkgdesc="Software defined radio receiver for x11"
arch=('i686' 'x86_64')
url="https://www.sm5bsz.com/linuxdsp/linrad.htm"
license=('MIT')
depends=('portaudio' 'libxext' 'libusb-compat')
optdepends=('hamradio-menus: XDG menus for ham radio software')
makedepends=('subversion' 'nasm' 'icoutils')
provides=('linrad')
conflicts=('linrad')
source=("${pkgname%-svn}::svn+https://svn.code.sf.net/p/linrad/code/trunk"
        "${pkgname%-svn}.desktop"
        "${pkgname%-svn}-wrapper.sh"
        "${pkgname%-svn}-obey-cflags-and-ldflags.patch")
sha512sums=('SKIP'
            '7b4d462d422b15c7c9249544d0792cd9f9902ceb10708770b8594f7cfa226b8aca2617168bcfb88861d6db76e7d573ea86812c3ab20d1ae4c8a2e92ee832e3e7'
            '1c661e4bea550ae496af121fc1c658cccc1fbe15c4aecb783641064729d5593f501fb977dff310739c9e303d4869ddafb36df3290c242df139560e6cbd4c661a'
            '3c499b0acc036c9709474b707919452d4d8333217ae3890499ea3decb3849571395b95bd1d7492d2cc4ab10433e56d68768d2ad8679a178a6ad4cea90a974aee')

# Find line(s) beginning with "#define $1 " in file $2 and output the remainder
_get_def() {
  local s="[[:space:]]"
  sed -n -E "s/^$s*#$s*define$s+$1$s+//p" "$2"
}

pkgver() {
  cd "${pkgname%-svn}"
  local ver=$(echo "$(_get_def PROGRAM_NAME vernr.h)" | sed -e 's/Linrad-//' -e 's/"//g')
  local rev="$(svnversion)"
  printf "%s.r%s" "${ver}" "${rev//[[:alpha:]]}"
}

prepare() {
  cd "${pkgname%-svn}"
  patch -N -i "$srcdir/${pkgname%-svn}-obey-cflags-and-ldflags.patch"

  # Fix path for help and error files
  sed -i "s|help.lir|/usr/share/${pkgname%-svn}/help.lir|g" menu.c help.c
  sed -i "s|errors.lir|/usr/share/${pkgname%-svn}/errors.lir|g" help.c

  ./clean
  autoreconf -fiv
  ./configure
}

build() {
  cd "${pkgname%-svn}"
  if [[ "${CARCH}" == "x86_64" ]]; then
    make xlinrad64
  else
    make xlinrad
  fi
}

package(){
  icotool -x ${pkgname%-svn}/cmake/${pkgname%-svn}.ico -o ${pkgname%-svn}.png
  install -Dm644 ${pkgname%-svn}.png -t "$pkgdir/usr/share/pixmaps/"
  install -Dm644 ${pkgname%-svn}.desktop -t "$pkgdir/usr/share/applications/"
  install -Dm755 ${pkgname%-svn}-wrapper.sh "$pkgdir/usr/bin/${pkgname%-svn}"

  cd "${pkgname%-svn}"
  install -Dm755 xlinrad* "$pkgdir/usr/bin/x${pkgname%-svn}"
  install -Dm644 *.lir -t "$pkgdir/usr/share/${pkgname%-svn}/"
  install -Dm644 z_*.txt -t "$pkgdir/usr/share/doc/${pkgname%-svn}/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

# vim:set ts=2 sw=2 et:
