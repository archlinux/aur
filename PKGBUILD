# Maintainer: Aline Freitas <aline@alinefreitas.com.br>

pkgname=polkit-git
pkgver=20120725
pkgrel=1
pkgdesc="Application development toolkit for controlling system-wide privileges"
arch=(i686 x86_64)
license=('LGPL')
url="http://www.freedesktop.org/wiki/Software/PolicyKit"
depends=('glib2' 'pam' 'expat' 'js')
makedepends=('intltool' 'gtk-doc' 'gobject-introspection' 'git')
replaces=('policykit')
provides=('polkit')
conflicts=('polkit')
source=('polkit.pam')
md5sums=('6564f95878297b954f0572bc1610dd15')
install=polkit.install

_gitroot=('http://anongit.freedesktop.org/git/polkit.git')
_gitname=('polkit')

build() {
    cd ${srcdir}
    msg "Connecting to GIT server...."

    if [ -d ${_gitname} ]; then
        cd ${_gitname} && git pull origin
        msg "The local files are updated."
    else
        git clone ${_gitroot} ${_gitname}
    fi

    msg "GIT checkout done or server timeout."

  cd ${srcdir}/${_gitname}
  ./autogen.sh --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --libexecdir=/usr/lib/polkit-1 \
      --disable-static --enable-gtk-doc 
  make
}

package() {
  cd ${srcdir}/${_gitname}
  make DESTDIR="$pkgdir" install

  install -m644 "$srcdir/polkit.pam" "$pkgdir/etc/pam.d/polkit-1"
}
