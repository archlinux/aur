# Maintainer :  jyantis <yantis@yantis.net>
# Contributor: Diego Principe <cdprincipeat gmaildot com>
# Contributor: Jan Jezek <honzin.jezek@gmail.com>
# Contributor: Berseker <berseker86 at gmail dot com>

pkgname=exo-git
pkgver=0.10.6.r1635.ce731c3
pkgrel=2
pkgdesc="Extensions to Xfce by os-cillation."
arch=(i686 x86_64)
license=('GPL2' 'LGPL2.1')
url="http://git.xfce.org/xfce/exo/tree/README"
groups=('xfce4-git')
depends=('libxfce4util' 'gtk2>=2.18.6-1' 'glib2>=2.22.4-1' 'hicolor-icon-theme' 'libxfce4ui' 'libsm')
makedepends=('xfce4-dev-tools' 'git' 'pkgconfig' 'libnotify' 'perl-uri' 'pygtk>=2.13') 
optdepends=('libnotify: enables notification support' 'perl: enables mail-compose helper script')
conflicts=('exo')
provides=('exo')
source=('git://git.xfce.org/xfce/exo')
options=('!libtool')
install=$pkgname.install
md5sums=('SKIP')
epoch=1

pkgver(){
  cd exo
  _majorversion=$(grep -F "m4_define([libexo_version_major]" configure.ac.in | awk 'BEGIN {FS = "["} {print $3}' | sed -r 's/(\[|\])//g' | sed -r 's/(\(|\))//g')
  _minorversion=$(grep -F "m4_define([libexo_version_minor]" configure.ac.in | awk 'BEGIN {FS = "["} {print $3}' | sed -r 's/(\[|\])//g' | sed -r 's/(\(|\))//g')
  _microversion=$(grep -F "m4_define([libexo_version_micro]" configure.ac.in | awk 'BEGIN {FS = "["} {print $3}' | sed -r 's/(\[|\])//g' | sed -r 's/(\(|\))//g')

  printf "%s." "$_majorversion"
  printf "%s." "$_minorversion"
  printf "%s." "$_microversion"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $srcdir/exo

  # Python 2 fix
  export PYTHON=python2

  ./autogen.sh \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib/xfce4 \
    --localstatedir=/var  \
    --disable-static \
    --enable-gtk-doc \
    --disable-debug
  make
}

package() {
  cd $srcdir/exo
  make DESTDIR=$pkgdir install
}
