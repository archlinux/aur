# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: VirtualTam <virtualtam@flibidi.net>

_pkgname=ganv
pkgname="${_pkgname}-git"
pkgver=1.5.4.r348.8b3520b
pkgrel=1
pkgdesc="An interactive Gtkmm canvas widget for graph-based interfaces (git version)"
arch=('i686' 'x86_64')
url="http://drobilla.net/software/ganv/"
license=('GPL3')
depends=('atk' 'cairo' 'fontconfig' 'gcc-libs' 'gdk-pixbuf2' 'glib2' 'glibc' 'glibmm' 'graphviz' 'gtk2' 'gtkmm'
'libfreetype.so' 'pango')
makedepends=('git' 'python')
provides=("$_pkgname" "$_pkgname=${pkgver//.r*/}" "lib${_pkgname}-${pkgver::1}.so")
conflicts=("$_pkgname")
source=("${_pkgname}::git+http://gitlab.com/drobilla/${_pkgname}.git"
        'autowaf::git+http://gitlab.com/drobilla/autowaf.git')
sha256sums=('SKIP'
            'SKIP')


prepare() {
  cd "$srcdir/${_pkgname}"

  git submodule init
  git config submodule.waflib.url "${srcdir}/autowaf"
  git submodule update

  # remove local call to ldconfig
  sed -i "/ldconfig/d" wscript
}

pkgver() {
  cd "$srcdir/${_pkgname}"

  local ver=`grep "^GANV_VERSION" wscript | cut -d "'" -f 2`
  echo "$ver.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build(){
  cd "$srcdir/${_pkgname}"

  python waf configure --prefix="/usr"
  python waf build ${MAKEFLAGS}
}

package() {
  cd "$srcdir/${_pkgname}"

  python waf install --destdir=${pkgdir}
  install -vDm 644 {AUTHORS,NEWS,README} \
    -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
