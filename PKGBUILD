# Maintainer: Romina Killpack <aur@xj9.io>

_pkgname=tomo-el-fuego
pkgname=${_pkgname}-git
pkgver=r1007.0c13bb7b
pkgrel=1
pkgdesc='An experimental solarpunk operating system. (Git)'
arch=('any')
url='https://git.sunshinegardens.org/~xj9/tomo'
license=('GPL2')
depends_i686=('gcc-libs' 'libx11' 'libxext')
depends_x86_64=('lib32-gcc-libs' 'lib32-libx11' 'lib32-libxext')
makedepends_i686=('gcc' 'glibc' 'mercurial')
makedepends_x86_64=('gcc-multilib' 'lib32-glibc' 'mercurial')
provides=("${_pkgname}")
conflicts=("${_pkgname}" 'inferno' 'inferno-hg')
options=('!strip')
source=("${_pkgname}::git+https://git.sunshinegardens.org/~xj9/tomo"
        'make-install-root.sh')
sha1sums=('SKIP'
          'SKIP')
install=${_pkgname}.install

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${_pkgname}"
  sed -i 's~$HOME/src/tomo~$IROOT~' mkconfig
  sed -i 's/SYSHOST=Plan9/SYSHOST=$SYSHOST/' mkconfig
  sed -i 's/$objtype/$OBJTYPE/' mkconfig
}

build() {
  cd "${_pkgname}"
  export IROOT=$PWD
  export SYSHOST=Linux
  export OBJTYPE=386
  ./makemk.sh
  export PATH="$IROOT/$SYSHOST/$OBJTYPE/bin:$PATH"
  # sed -i "s/'-fno-aggressive-loop-optimizations'//" "mkfiles/mkfile-$SYSHOST-$OBJTYPE"
  mk nuke
  mk mkdirs
  mk install
  cat > tomo-el-fuego << 'END'
#!/usr/bin/env bash
ROOT="/usr/local/tomo"
IBIN="$ROOT/Linux/386/bin"
export PATH="$IBIN:$PATH"
export EMU="-r$ROOT"
exec emu "$@"
END
}

package() {
  export IROOT="usr/local/tomo"
  ./make-install-root.sh "${_pkgname}" "${pkgdir}/$IROOT"
  find "${pkgdir}/$IROOT" -path "${pkgdir}/$IROOT/Linux" -prune -o -exec chmod g+w {} +
  mkdir -p "${pkgdir}/$IROOT/Linux"
  cp -r "${_pkgname}/Linux/386" "${pkgdir}/$IROOT/Linux/"
  mkdir -p "${pkgdir}/usr/bin"
  install -D -m755 "${_pkgname}/tomo-el-fuego" "${pkgdir}/usr/bin/tomo-el-fuego"
  install -D -m644 "${_pkgname}/NOTICE" "${pkgdir}/usr/share/licenses/${_pkgname}/NOTICE"
}
