# Mantainer: Lorenzo Ferrillo <lorenzofer@live.it>
# Contributor: Ray Rashif <schiv@archlinux.org>

_basename=lv2
pkgname=lib32-${_basename}
pkgver=1.16.0
pkgrel=1
pkgdesc="Successor to the LADSPA audio plug-in standard"
url="http://lv2plug.in/"
license=('LGPL' 'custom')
arch=('x86_64')
makedepends=('lib32-python' 'lib32-libsndfile' 'lib32-gtk2' 'lv2')  #lib32-python should be more correct
optdepends=('libsndfile: Example sampler'
            'gtk2: Example sampler'
            'python2: Scripts')
provides=('lib32-lv2core')
conflicts=('lib32-lv2core')
replaces=('lib32-lv2core')
source=("http://lv2plug.in/spec/$_basename-$pkgver.tar.bz2"
        "lv2-1.16.0-fix_lv2_validate.patch"
       )
sha512sums=('ead6d590cded5dd7a548d6ffe0f2f9f8efadfa7bb9e8b4fa0aea6664ccdfbb3ca697514bddebe695a9442fba5b62714b5cd45c1bf7d0aaef12ffe50972c2d88c'
            'd0293d9599440db06066ef5c26bbef8195a4dc9cc9581036bf9a2b8fb96140e10f24ebd30f40cab62ee91acb70de8de17c7cc1dcf7b017736858aa12222df5bc'
)

build() {
  cd "$srcdir/$_basename-$pkgver"
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  
  # let wscript(s) find the custom waf scripts
  mkdir -pv tools
  touch __init__.py
  cp -v waflib/extras/{autowaf,lv2}.py tools/
  mkdir -pv plugins/tools/
  cp -v waflib/extras/{autowaf,lv2}.py plugins/tools/
  rm -rv waflib
  sed -e 's/waflib.extras/tools/g' \
      -e "s/load('autowaf'/load('autowaf', tooldir='tools'/g" \
      -e "s/load('lv2'/load('lv2', tooldir='tools'/g" \
      -i {,plugins/,plugins/*/}wscript
  patch -Np1 -i "../lv2-1.16.0-fix_lv2_validate.patch"
   # --docs is currently broken: https://gitlab.com/lv2/lv2/issues/28
  waf -vv configure --prefix=/usr \
                --libdir=/usr/lib32 \
                --test
  waf -vv build $MAKEFLAGS
}

package() {
  cd "$srcdir/$_basename-$pkgver"
#REMOVE includes and others
  waf install --destdir="$pkgdir"
  rm ${pkgdir}/usr/bin ${pkgdir}/usr/include ${pkgdir}/usr/share -Rf
}

# vim:set ts=2 sw=2 et:
 
