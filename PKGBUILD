# Maintainer: Doug Newgard <scimmia at archlinux dot info>
# Contributor: Carsten Haitzler (Rasterman)
# Contributor: Ronald van Haren <ronald.archlinux.org>

_pkgname=elementary
pkgbase=$_pkgname-git
pkgname=("$_pkgname-git" "elementary_test-git")
pkgver=1.14.99.11415.gc99c116
pkgrel=1
pkgdesc="Enlightenment GUI toolkit - Development version"
arch=('i686' 'x86_64')
url="http://www.enlightenment.org"
license=('LGPL2.1' 'CCPL:cc-by-sa')
depends=('efl-git')
  [[ ! $(pacman -T ewebkit) ]] && depends+=('ewebkit')                 # webkit-efl support is detected at build time
  [[ ! $(pacman -T libeweather-git) ]] && depends+=('libeweather-git') # eweather support is detected at build time
makedepends=('git')
options=('debug')
source=("git://git.enlightenment.org/core/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"

  local efl_version=$(grep -m1 EFL_VERSION configure.ac | awk -F [][] '{print $2 "." $4 "." $6}')
  efl_version=$(awk -F , -v efl_version=${efl_version%.} '/^AC_INIT/ {gsub(/efl_version/, efl_version); gsub(/[\[\] -]/, ""); print $2}' configure.ac)

  printf "%s.%s.g%s" "$efl_version" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"

  export CFLAGS="$CFLAGS -fvisibility=hidden"

  ./autogen.sh \
    --prefix=/usr \
    --disable-static

  make
}

package_elementary-git() {
  provides=("${pkgname%-*}=$pkgver")
  conflicts=("${pkgname%-*}")

  cd "$srcdir/$_pkgname"

  make -j1 DESTDIR="$pkgdir" install

# install text files
  install -d "$pkgdir/usr/share/doc/$_pkgname/"
  install -m644 -t "$pkgdir/usr/share/doc/$_pkgname/" ChangeLog NEWS README

# install license files
  install -d "$pkgdir/usr/share/licenses/$pkgname/"
  install -m644 -t "$pkgdir/usr/share/licenses/$pkgname/" AUTHORS COMPLIANCE COPYING.images
  sed -n '1,/details./p' COPYING > "$pkgdir/usr/share/licenses/$pkgname/COPYING"

# remove test app
  rm -rf "$pkgdir/usr/bin/"elementary_test \
         "$pkgdir/usr/lib/elementary/modules/"{test_entry,test_map} \
         "$pkgdir/usr/share/applications/elementary_test.desktop" \
         "$pkgdir/usr/share/elementary/"{examples,images,objects}
}

package_elementary_test-git() {
  pkgdesc="Test application for Elementary"
  depends=('elementary')
  provides=("${pkgname%-*}=$pkgver")
  conflicts=("${pkgname%-*}")

  cd "$srcdir/$_pkgname"

  make -j1 DESTDIR="$pkgdir" install

# remove elementary
  rm -rf "$pkgdir/usr/include" \
         "$pkgdir/usr/bin/"{elementary_codegen,elementary_config,elementary_quicklaunch,elementary_run,elm_prefs_cc} \
         "$pkgdir/usr/lib/"{cmake,edje,libelementary.so*,pkgconfig} \
         "$pkgdir/usr/lib/elementary/modules/"{access_output,datetime_input_ctxpopup,prefs} \
         "$pkgdir/usr/share/applications/elementary_config.desktop" \
         "$pkgdir/usr/share/elementary/"{config,examples,themes,edje_externals} \
         "$pkgdir/usr/share/"{eolian,icons,locale}
}
