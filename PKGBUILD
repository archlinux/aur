# Maintainer: Konstantinos Foutzopoulos <mail@konfou.xyz>

_pkgname=inferno
pkgname=${_pkgname}-hg
pkgver=832+.62ae0f75aa71+
pkgrel=3
pkgdesc='A compact operating system designed for building distributed and networked systems. (Mercurial)'
arch=('any')
url='https://bitbucket.org/inferno-os/inferno-os-hg'
license=('GPL2')
depends_i686=('gcc-libs' 'libx11' 'libxext')
depends_x86_64=('lib32-gcc-libs' 'lib32-libx11' 'lib32-libxext')
makedepends_i686=('gcc' 'glibc' 'mercurial')
makedepends_x86_64=('gcc-multilib' 'lib32-glibc' 'mercurial')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!strip')
source=("${_pkgname}::hg+https://bitbucket.org/${_pkgname}-os/${_pkgname}-os-hg"
        'make-install-root.sh')
sha1sums=('SKIP'
          'SKIP')
install=${_pkgname}.install

pkgver() {
  cd "${_pkgname}"
  echo $(hg identify -n).$(hg identify -i) | cut -d ' ' -f 2- | tr -d ' '
}

prepare() {
  cd "${_pkgname}"
  sed -i 's~/usr/inferno~$IROOT~' mkconfig
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
  sed -i "s/'-fno-aggressive-loop-optimizations'//" "mkfiles/mkfile-$SYSHOST-$OBJTYPE"
  mk nuke
  mk install
  cat > inferno << 'END'
#!/usr/bin/env bash
ROOT="/usr/local/inferno"
IBIN="$ROOT/Linux/386/bin"
export PATH="$IBIN:$PATH"
export EMU="-r$ROOT"
exec emu "$@"
END
}

package() {
  export IROOT="usr/local/inferno"
  ./make-install-root.sh "${_pkgname}" "${pkgdir}/$IROOT"
  find "${pkgdir}/$IROOT" -path "${pkgdir}/$IROOT/Linux" -prune -o -exec chmod g+w {} +
  mkdir -p "${pkgdir}/$IROOT/Linux"
  cp -r "${_pkgname}/Linux/386" "${pkgdir}/$IROOT/Linux/"
  mkdir -p "${pkgdir}/usr/bin"
  install -D -m755 "${_pkgname}/inferno" "${pkgdir}/usr/bin/inferno"
  install -D -m644 "${_pkgname}/NOTICE" "${pkgdir}/usr/share/licenses/${_pkgname}/NOTICE"
}
