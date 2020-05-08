# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=mda-lv2
pkgname="${_pkgname}-git"
pkgver=1.2.4.r1.g1761c1c
pkgrel=2
pkgdesc="A port of the MDA VST plugins to the LV2 format"
arch=("i686" "x86_64")
url="https://drobilla.net/software/mda-lv2/"
license=("GPL2")
groups=('lv2-plugins')
depends=('gcc-libs' 'glibc')
makedepends=('git' 'lv2' 'python')
provides=("${_pkgname}" "${_pkgname//-/.}")
conflicts=("${_pkgname}" "${_pkgname}-svn" "${_pkgname//-/.}")
source=("${_pkgname}::git+https://gitlab.com/drobilla/mda-lv2.git"
        'autowaf::git+https://gitlab.com/drobilla/autowaf.git')
md5sums=('SKIP'
         'SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"

  #local ver=`grep "^MDA_VERSION" wscript | cut -d "'" -f 2`
  #echo "$ver.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
  echo $(git describe --tags | sed -E -e 's/-([0-9]+)-/-r\1-/' -e 's/^v//' -e 's/-/./g')
}

prepare() {
  cd "${srcdir}/${_pkgname}"

  git submodule init
  git config submodule.waflib.url "${srcdir}/autowaf"
  git submodule update
}

build() {
  cd "${srcdir}/${_pkgname}"

  python waf configure --prefix="/usr"
  python waf build
}

package() {
  cd "${srcdir}/${_pkgname}"

  python waf install --destdir="${pkgdir}"
  install -vDm 644 {NEWS,README.md} -t "${pkgdir}/usr/share/doc/${pkgname}/"
}

# vim:set ts=2 sw=2 et:
