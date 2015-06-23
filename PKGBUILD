# $Id: PKGBUILD 6743 2009-12-21 12:17:19Z ibiru $
# Contributor: Yarema aka Knedlyk <yupadmin@gmail.com>

pkgname=em8300-utils-hg
pkgver=727
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="DXR3 and Hollywood+ driver"
url="http://dxr3.sourceforge.net/"
license=('GPL2')
makedepends=('gtk2')
optdepends=('gtk2: to use dxr3view, dhc or autocal'
            'perl: to use em8300 scripts')
conflicts=('em8300-utils')
provides=('em8300-utils')
source=()
md5sums=()
_hgroot=http://hg.assembla.com/
_hgrepo=em8300-cgmeiner

build() {
    cd $srcdir
    
    if [ -d ${_hgrepo} ]; then
        cd ${startdir}/src/${_hgrepo}
        hg pull -u
    else
	hg clone ${_hgroot}${_hgrepo} || return 1
# same but fixing changeset:
#	hg clone ${_hgroot}${_hgrepo} -r $pkgver || return     
    fi

    msg "Mercurial clone done or server timeout"
    msg "Starting make..."
    
    rm -rf $srcdir/$_hgrepo-build
    cp -rf $srcdir/$_hgrepo $srcdir/$_hgrepo-build
    cd $srcdir/$_hgrepo-build


  ./bootstrap
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="${pkgdir}" install || return 1

  install -m 644 -D modules/em8300-udev.rules "${pkgdir}/lib/udev/rules.d/em8300.rules" || return 1
}
