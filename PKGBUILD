# Maintainer: Igor <f2404@yandex.ru>
# Contributor: GordonGR <ntheo1979@gmail.com>
# Contributor: Pablo Lezaeta <prflr arro'a gmail puntocom> (I tryed)
# Contributor: jyantis <yantis@yantis.net>
# Contributor: Diego Principe <cdprincipeat gmaildot com>
# Contributor: Jan Jezek <honzin.jezek@gmail.com>
# Contributor: Berseker <berseker86 at gmail dot com>

pkgname=exo-git
pkgver=0.12.0.r2131.03df63a
pkgrel=2
pkgdesc="Extensions to Xfce originally developed by os-cillation."
arch=('i686' 'x86_64')
license=('GPL2' 'LGPL2.1')
url="https://git.xfce.org/xfce/exo/tree/README"
groups=('xfce4-git')
provides=("exo=${pkgver}")
depends=('libxfce4util>=4.12' 'gtk3>=3.22' 'glib2>=2.42' 'gtk2>=2.24' 'hicolor-icon-theme' 'libxfce4ui>=4.12' 'libsm')
makedepends=('xfce4-dev-tools' 'git' 'pkgconfig' 'libnotify' 'perl-uri' 'pygtk>=2.13')
optdepends=('libnotify: enables notification support'
	'perl: enables mail-compose helper script')
conflicts=('exo')
source=('exo-git::git://git.xfce.org/xfce/exo')
options=('!libtool')
md5sums=('SKIP')
epoch=1

pkgver(){
  cd exo-git
  _majorversion=$(grep -F "m4_define([libexo_version_major]" configure.ac.in | awk 'BEGIN {FS = "["} {print $3}' | sed -r 's/(\[|\])//g' | sed -r 's/(\(|\))//g')
  _minorversion=$(grep -F "m4_define([libexo_version_minor]" configure.ac.in | awk 'BEGIN {FS = "["} {print $3}' | sed -r 's/(\[|\])//g' | sed -r 's/(\(|\))//g')
  _microversion=$(grep -F "m4_define([libexo_version_micro]" configure.ac.in | awk 'BEGIN {FS = "["} {print $3}' | sed -r 's/(\[|\])//g' | sed -r 's/(\(|\))//g')

  printf "%s." "$_majorversion"
  printf "%s." "$_minorversion"
  printf "%s." "$_microversion"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $srcdir/exo-git

  # Python 2 fix
  export PYTHON=python2

  ./autogen.sh \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib/xfce4 \
    --localstatedir=/var  \
    --disable-static \
    --enable-gtk-doc \
    --enable-gtk2 \
    --enable-gtk3 \
    --disable-debug
  make
}

package() {
  cd $srcdir/exo-git
  make DESTDIR=$pkgdir install
}
