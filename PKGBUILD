# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_reponame=XTinyTerror.lv2
_pkgname=xtinyterror.lv2
_lv2uri="http://guitarix.sourceforge.net/plugins/${_reponame//.lv2}_#_tinyterror_"
pkgname="${_pkgname}-git"
pkgver=r15.015b055
pkgrel=2
pkgdesc="An amplifier simulation LV2 plugin modelled after a small british valve amp (git version)"
arch=('i686' 'x86_64')
url="https://github.com/brummer10/${_reponame}"
license=('0BSD')
depends=('cairo' 'gcc-libs' 'libx11')
makedepends=('git' 'lv2' 'lv2lint' 'xxd')
groups=('pro-audio' 'lv2-plugins')
provides=("${_pkgname}" "${_pkgname}=${pkgver//.r*/}" "${_pkgname//-/.}")
conflicts=("${_pkgname}" "${_pkgname//-/.}")
source=("${_pkgname}::git+https://github.com/brummer10/${_reponame}.git"
        'xputty::git+https://github.com/brummer10/Xputty.git')
md5sums=('SKIP'
         'SKIP')


pkgver() {
  cd "${srcdir}/${_pkgname}"

  # no release yet and no version number anywhere in the sources
  #local ver="$(grep '^\s*VER =' Xmonk/Makefile | cut -d ' ' -f 3)"
  #echo "$ver.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${_pkgname}"

  git submodule init
  git config submodule.Xputty.url "${srcdir}/xputty"
  git -c protocol.file.allow=always submodule update
}

build() {
  cd "${srcdir}/${_pkgname}"
  make
}

check() {
  cd "${srcdir}/${_pkgname}"
  mkdir -p lv2
  ln -sf ../${_reponame//.lv2}/${_reponame} lv2/${_reponame}
  # expected to produce errors
  #sord_validate -l "${PWD}/lv2/${_reponame}"/*.ttl || :
  LV2_PATH="${PWD}/lv2:/usr/lib/lv2" lv2lint -M pack "${_lv2uri}"
}

package() {
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="${pkgdir}" PREFIX=/usr install

  # documentation
  install -vDm 644 README.md "${_reponame//.lv2}.png" -t "${pkgdir}/usr/share/doc/${pkgname}"
  # license
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
