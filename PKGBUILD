# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: tardo ... nagi-fanboi*net

set -u
pkgname='recoverdm'
pkgver='0.20'; _commit='8ecb7438b6902c040db05313bea57eb093838143'
pkgrel='4'
pkgdesc='recover damaged CD DVD and disks with bad sectors'
arch=('x86_64')
url='http://www.vanheusden.com/recoverdm/'
license=('GPL')
depends=('glibc')
#_giturl='https://github.com/flok99/recoverdm'
_giturl='https://github.com/D3vil0p3r/recoverdm'
_srcdir="${pkgname}-${pkgver}"
#_srcdir="${pkgname}-${_commit}"
source=(
  #"https://www.vanheusden.com/recoverdm/${pkgname}-${pkgver}.tgz"
  #"${pkgname}-${pkgver}-github.tgz::${_giturl}/archive/${_commit}.tar.gz"
  "${pkgname}-${pkgver}-D3vil0p3r.tgz::${_giturl}/archive/refs/tags/${pkgver}.tar.gz"
  '0000-gcc-string.h.patch'
)
_srcdir+='/src'
md5sums=('df70d37f17eed67990aac12a34ca04f3'
         '189b7ca5c734d857e90211ef9ce5059a')
sha256sums=('aa1cd8987a0b5fb8873dc9e50ad8e014ad2c5b7011a321dfcc9fc1f35baed266'
            '88dd33a1d866bcbecbb27494c93d5b2c585445ce8f91dbf925632b9285847384')

prepare() {
  local -; set -u
  cd "${_srcdir}"
  local _pt
  for _pt in "${source[@]%%::*}"; do
    _pt="${_pt##*/}"
    if [[ "${_pt}" = *.patch ]]; then
      set +u; msg2 "Patch ${_pt}"; set -u
      patch -Nup1 -i "${srcdir}/${_pt}"
    fi
  done
  # cd "${srcdir}"; cp -pr "${_srcdir}" 'a'; ln -s "${_srcdir}" 'b'; false
  #diff -pNaru5 'a' 'b' > "0000-$RANDOM.patch"

  sed -Ee '/^CFLAGS=/ s:$: -Wno-error=incompatible-pointer-types:g' -i 'Makefile'
}

build() {
  local -; set -u
  cd "${_srcdir}"
  make
}

package() {
  local -; set -u
  cd "${_srcdir}"
  install -Dpm0755 'mergebad' 'recoverdm' -t "${pkgdir}/usr/bin/"
}
set +u
