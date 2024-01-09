# Maintainer: A Farzat <a@farzat.xyz>
# Contributor: Samantha Baldwin <fuhsaz 'plus' aur 'at' cryptic 'dot' li>
pkgname=tabbed-git
_pkgname=tabbed
pkgver=0.7.r9.g97ba13b
pkgrel=1
pkgdesc="Simple generic tabbed fronted to xembed aware applications"
arch=('i686' 'x86_64')
url="http://tools.suckless.org/tabbed/"
license=('MIT/X')
depends=('libxft')
makedepends=('git')
provides=('tabbed')
conflicts=('tabbed')
source=("$_pkgname::git+http://git.suckless.org/tabbed")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  echo "Applying patches from $BUILDDIR if they exist..."
  if [ -d "$BUILDDIR/patches" ]; then
  for patch in "$BUILDDIR/patches"/*.diff; do
  echo "Applying $patch ..."
  patch -d $_pkgname -p1 -s -i "$patch"
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
    cp "$BUILDDIR/config.h" $_pkgname
  elif [ ! -e "$BUILDDIR/config.def.h" ]
  then
    msg='This package can be configured in config.h. Copy the config.def.h '
    msg+='that was just placed into the package directory to config.h and '
    msg+='modify it to change the configuration. Or just leave it alone to '
    msg+='continue to use default values.'
    printf %s\\n "$msg"
  fi
  cp $_pkgname/config.def.h "$BUILDDIR"
}

build() {
  cd $_pkgname
  make PREFIX=/usr
}

package() {
  cd $_pkgname
  make DESTDIR="$pkgdir/" PREFIX=/usr install
  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
