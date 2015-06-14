# Maintainer: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Contributor: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# vim:set ts=2 sw=2 et ft=sh tw=100: expandtab

pkgname=itk-cvs
pkgver=3.4
pkgrel=2
pkgdesc='a framework for building mega-widgets using the [incr Tcl] object system.'
arch=('i686' 'x86_64')
url='http://incrtcl.sourceforge.net/itk/'
license=('custom')
depends=(glibc)
makedepends=(cvs)
provides=(itk=$pkgver-$pkgrel)
conflicts=(itk)
_vcsroot="anonymous:@incrtcl.cvs.sourceforge.net:/cvsroot/incrtcl"
_vcsname="incrTcl"
#source=("$_vcsname::cvs+http://incrtcl.cvs.sourceforge.net/viewvc/incrtcl/")
options=(!emptydirs)

build(){
  cd "$srcdir"
  if [ -d "${_vcsname}/CVS" ];	then
    msg2 "Starting CVS update ..."
		cd "${_vcsname}"
		cvs -z3 update -d
		msg2 "... updating finished."
	else
		msg2 "Starting CVS checkout ..."
	  cvs -z3 -f -d:pserver:${_vcsroot} co "${_vcsname}"
		msg2 "... checkout finished."
    cd "${_vcsname}"
	fi

	if [ -e "${srcdir}/${_vcsname}-build" ];	then
		rm -rf "${srcdir}/${_vcsname}-build"
	fi

  msg2 "CVS checkout done or server timeout"

  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}
package(){
  cd "$srcdir"/$_vcsname
  msg2 "Starting make install"
  make DESTDIR="$pkgdir/" install

  # Conflit with itcl-3.4
  rm -rf "$pkgdir"/usr/lib/itcl3.4
  rm -f "$pkgdir"/usr/lib/itclConfig.sh
  # Conflit with tcl-8.6.0
  rm -rf "$pkgdir"/usr/include
  rm -rf "$pkgdir"/usr/share/man

  install -Dm644 "$srcdir"/$_vcsname/itk/license.terms \
    "$pkgdir"/usr/share/licenses/$pkgname/License

  # cleaning
  find "$pkgdir" -type d -name ".svn" -exec rm -rf '{}' +;
}

