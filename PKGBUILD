# Maintainer: Thomas Jost <schnouki@schnouki.net>
# Contributor: Andreas B. Wagner <AndreasBWagner@pointfree.net>
# Contributor: Kaos < gianlucaatlas_AT_gmail_DOT_com >

_use_master=0

pkgname=xf86-input-synaptics-gesturesonly
_pkgname=xf86-input-synaptics
pkgver=1.7.4.r0.g8a5533a
pkgrel=1
pkgdesc="Synaptics driver for notebook touchpads"
arch=('i686' 'x86_64')
url="http://patchwork.freedesktop.org/patch/14393/"
license=('custom')
depends=('libxtst' 'mtdev')
makedepends=('pkgconfig' 'xorg-server' 'git' 'xorg-server-devel')
provides=('synaptics' 'xf86-input-synaptics')
conflicts=('synaptics')
groups=('xorg-input-drivers')
options=('!libtool' 'zipman')
_branch=master
[[ "$_use_master" == 0 ]] && _branch="synaptics-1.7-branch"
source=("$_pkgname"::'git://anongit.freedesktop.org/xorg/driver/xf86-input-synaptics#branch='"$_branch"
        '50-synaptics.conf.patch'
        '14393-gestures-only.patch'
        '14393-gestures-only.master.patch')
md5sums=('SKIP'
         '5ae00aad3e70265defa5bd08da621b5c'
         'ccbc1ece7233f41dceeb7243d09cf8f1'
         'b3ccf67c831b3e9a81dd670c4dfa8e8c')
sha256sums=('SKIP'
            '8c24a04508acfab32b78e8dfbebe589e35f908cc74f1225215eed6fd48c530c3'
            '6251c0b586e8679857a9b5edc66568ae47d838520bf5da114d39210cbefbe3f8'
            '05ab21d33fe7131e7a16a3b69ef741f950fedadb507364d3bbd3d486c3b55270')

pkgver() {
  cd "$srcdir/$_pkgname"
  # Use the tag of the last commit
  git describe --long | sed -E "s/$_pkgname-//; "'s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"

  if [[ "$_use_master" == 0 ]]; then
    patch -p1 < $srcdir/14393-gestures-only.patch
  else
    patch -p1 < $srcdir/14393-gestures-only.patch
  fi

  ./autogen.sh
  ./configure --prefix=/usr --with-xorg-conf-dir=/etc/X11/xorg.conf.d
  make
  patch conf/50-synaptics.conf < $srcdir/50-synaptics.conf.patch
}
package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="${pkgdir}" install
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}
