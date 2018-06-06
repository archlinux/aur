# Maintainer: Piotr Gorski <lucjan.lucjanov@gmail.com>
# Contributor: Bartlomiej Piotrowski <nospam@bpiotrowski.pl>

pkgname=pkgconf-git
_pkgname=pkgconf
pkgver=1.4.2.41.g390b020
pkgrel=1
pkgdesc='pkg-config compatible utility which does not depend on glib'
url='https://github.com/pkgconf/pkgconf'
arch=('i686' 'x86_64')
license=('ISC')
depends=(glibc sh git)
conflicts=('pkg-config' 'pkgconfig' 'pkgconf')
provides=('pkg-config' 'pkgconfig' 'pkgconf')
source=(git://github.com/pkgconf/pkgconf.git
        platform-pkg-config.in)
md5sums=('SKIP'
         '8208d56d649808fe561f088cd32c74e0')

_pcdirs=/usr/lib/pkgconfig:/usr/share/pkgconfig
_libdir=/usr/lib
_includedir=/usr/include

pkgver() {
  cd $_pkgname
  git describe --tags --long | sed 's/^pkgconf-//;s/-/./g'
}

prepare() {
  mkdir build
  cd $_pkgname
  ./autogen.sh
}

build() {
  cd build
  ../$_pkgname/configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --with-pkg-config-dir="$_pcdirs" \
    --with-system-libdir="$_libdir" \
    --with-system-includedir="$_includedir" \
    --disable-static
  make
}

package() {
  DESTDIR="$pkgdir" make -C build install

  # From https://src.fedoraproject.org/rpms/pkgconf/
  sed -e "s|@TARGET_PLATFORM@|$CHOST|g" \
      -e "s|@PKGCONF_LIBDIRS@|$_pcdirs|g" \
      -e "s|@PKGCONF_SYSLIBDIR@|$_libdir|g" \
      -e "s|@PKGCONF_SYSINCDIR@|$_includedir|g" \
      platform-pkg-config.in |
    install -D /dev/stdin "$pkgdir/usr/bin/$CHOST-pkg-config"
  ln -s $CHOST-pkg-config "$pkgdir/usr/bin/pkg-config"

  # Multilib
  if [[ $CARCH = x86_64 ]]; then
    _host32=${CHOST/x86_64/i686}
    sed -e "s|@TARGET_PLATFORM@|$_host32|g" \
        -e "s|@PKGCONF_LIBDIRS@|${_pcdirs/lib/lib32}|g" \
        -e "s|@PKGCONF_SYSLIBDIR@|${_libdir/lib/lib32}|g" \
        -e "s|@PKGCONF_SYSINCDIR@|$_includedir|g" \
        platform-pkg-config.in |
      install -D /dev/stdin "$pkgdir/usr/bin/$_host32-pkg-config"
    ln -s $_host32-pkg-config "$pkgdir/usr/bin/pkg-config-32"
  fi

  ln -s pkgconf.1 "$pkgdir/usr/share/man/man1/pkg-config.1"
  install -Dt "$pkgdir/usr/share/licenses/$_pkgname" -m644 $_pkgname/COPYING
}
