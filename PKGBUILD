# $Id$
# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Roman Kyrylych <roman@archlinux.org>
# Contributor: Aurelien Foret <orelien@chez.com>

_gitname=gnokii
pkgname=${_gitname}-git
pkgver=r5004.187de67
pkgrel=1
pkgdesc="Tools and user space driver for use with mobile phones"
arch=('i686' 'x86_64')
url="http://www.gnokii.org/"
license=('GPL')
depends=('libusb-compat' 'libxpm' 'bluez-libs' 'libical' 'sqlite')
makedepends=('git' 'gtk2' 'libmariadbclient' 'postgresql-libs' 'intltool')
optdepends=('dialog: sendsms tool'
            'gtk2: xgnokii GUI'
            'libmariadbclient: smsd mysql backend'
            'postgresql-libs: smsd postgresql backend')
conflicts=('gnokii')
backup=('etc/gnokiirc')
install="${_gitname}.install"
source=("${_gitname}::git://git.savannah.nongnu.org/${_gitname}.git"
        'gnokii-config.patch'
        'gnokii-lock.patch')
md5sums=('SKIP'
         'b2961b52ac1f770c4704ccc50b64fde2'
         '17b629db85a6bb2b98ca59941aa95295')

pkgver() {
  cd "${srcdir}/${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd ${_gitname}

  # Set bindir location
  patch -Np1 -i "${srcdir}/gnokii-config.patch"

  # Set lock path
  patch -Np1 -i "${srcdir}/gnokii-lock.patch"
}

build() {
  cd ${_gitname}

  libtoolize -c -f
  glib-gettextize -f
  intltoolize --force --copy --automake
  aclocal -I m4
  autoheader -I m4
  automake --add-missing
  autoconf

  ./configure --prefix=/usr --sysconfdir=/etc --sbindir=/usr/bin \
              --disable-static --enable-security
  make
  pushd xgnokii
  make
  popd
}

package() {
  cd ${_gitname}

  make DESTDIR="${pkgdir}" install
  pushd xgnokii
  make DESTDIR="${pkgdir}" install
  popd

  # Install inital config file
  install -Dm644 Docs/sample/gnokiirc "${pkgdir}/etc/gnokiirc"

  # Fix file permission
  chmod 755 "${pkgdir}/usr/bin/sendsms"
}

