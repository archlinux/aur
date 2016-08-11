# Maintainer: Oda Kenta <oda.kenta.hj@gmail.com>

pkgname=ratpoison-jcs-git
_pkgname="${pkgname%%-*}"
pkgver=1.4.6
pkgrel=1
pkgdesc="hacks atop the official ratpoison"
conflicts=('ratpoison')
arch=('i686' 'x86_64')
license=('GPL')
depends=('libxinerama' 'readline' 'bash' 'perl' 'libxtst' 'libxft' 'texinfo')
url="https://github.com/jcs/ratpoison"
source=("${_pkgname}"::"git://github.com/jcs/ratpoison.git#branch=master"
        "${_pkgname}.desktop")
md5sums=('SKIP'
         '29c3cb9be59758e39d8471391231a74a')

build() {
  cd "${srcdir}/${_pkgname}"

  # FS#38726, v1.4.6-2 
  sed -i 's|PRINT_ERROR (("XGetWMName|PRINT_DEBUG (("XGetWMName|' src/manage.c

  ./configure --prefix=/usr
  make CFLAGS="$CFLAGS -DHAVE_GETLINE"
}

package() {
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="${pkgdir}" install

  # fix permissions
  chmod a+x "${pkgdir}/usr/share/ratpoison/"{allwindows.sh,clickframe.pl,rpshowall.sh,rpws,split.sh}

  # Not useful outside the source tree.
  rm "${pkgdir}/usr/share/ratpoison/genrpbindings"

  cd contrib
  ./genrpbindings
  install -dm755 "${pkgdir}/usr/share/ratpoison/bindings"
  install -m644 {Ratpoison.pm,ratpoison-cmd.el,ratpoison.rb,ratpoison.lisp,ratpoison.py} \
    "${pkgdir}/usr/share/ratpoison/bindings/"

  install -dm755 "${pkgdir}/usr/share/emacs/site-lisp"
  install -m644 ratpoison.el \
    "${pkgdir}/usr/share/emacs/site-lisp/"

  rm "${pkgdir}/usr/share/ratpoison/ratpoison.el"

  install -Dm644 "${srcdir}/${_pkgname}.desktop" \
    "${pkgdir}/etc/X11/sessions/${_pkgname}.desktop"
}
