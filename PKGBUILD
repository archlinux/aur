# Maintainer: A Farzat <a@farzat.xyz>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: T.J. Townsend <blakkheim@archlinux.org>
# Contributor: Sebastian A. Liem <sebastian at liem dot se>

pkgname=slock-git
_pkgname=slock
pkgver=1.5.r6.ga34d8fb
pkgrel=1
pkgdesc='Simple X display locker'
url='http://tools.suckless.org/slock'
arch=('i686' 'x86_64' 'armv7h')
license=('MIT')
makedepends=('git')
depends=('libxext' 'libxrandr')
source=('git://git.suckless.org/slock')
sha256sums=('SKIP')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  echo "Applying patches from $BUILDDIR if they exist..."
  if [ -d "$BUILDDIR/patches" ]; then
  for patch in "$BUILDDIR/patches"/*.diff; do
  echo "Applying $patch ..."
  patch -d "$_pkgname" -p1 -s -i "$patch"
  done;
  fi;

  # This package provides a mechanism to provide a custom config.h. Multiple
  # configuration states are determined by the presence of two files in
  # $BUILDDIR:
  #
  # config.h  config.def.h  state
  # ========  ============  =====
  # absent    absent        Initial state. The user receives a message on how
  #                         to configure this package.
  # absent    present       The user was previously made aware of the
  #                         configuration options and has not made any
  #                         configuration changes. The package is built using
  #                         default values.
  # present                 The user has supplied his or her configuration. The
  #                         file will be copied to $srcdir and used during
  #                         build.
  #
  # After this test, config.def.h is copied from $srcdir to $BUILDDIR to
  # provide an up to date template for the user.
  if [ -e "$BUILDDIR/config.h" ]
  then
    cp "$BUILDDIR/config.h" "$_pkgname"
  elif [ ! -e "$BUILDDIR/config.def.h" ]
  then
    msg='This package can be configured in config.h. Copy the config.def.h '
    msg+='that was just placed into the package directory to config.h and '
    msg+='modify it to change the configuration. Or just leave it alone to '
    msg+='continue to use default values.'
    printf %s\\n "$msg"
  fi
  cd "$_pkgname"
  sed -i 's|static const char \*group = "nogroup";|static const char *group = "nobody";|' config.def.h
  sed -ri 's/((CPP|C|LD)FLAGS) =/\1 +=/g' config.mk
  cp config.def.h "$BUILDDIR"
}

build() {
  cd "$_pkgname"
  make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
  cd "$_pkgname"
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -m644 -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
