# Maintainer: Evgeniy Alekseev <arcanis at archlinux dot org>

pkgname=1pass-hg
_pkgname=1pass
pkgver=r44.2150bce729df
pkgrel=2
pkgdesc="1Password-compatible password management tool for Linux"
arch=('i686' 'x86_64')
license=('zlib')
url="https://www.icculus.org/1pass/"
depends=('gtk2' 'libxtst')
makedepends=('mercurial')
source=("hg+http://hg.icculus.org/icculus/1pass/"
        "1pass-lua.patch")
md5sums=('SKIP'
         'a0a4e1790ac53596d0e0ee9ee244944b')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

prepare() {
  patch -p0 -i "1pass-lua.patch"
  rm -rf "${_pkgname}/build"
  mkdir "${_pkgname}/build"
}

build() {
  cd "${_pkgname}/build"
  cmake -DCMAKE_BUILD_TYPE=Release ..
  make
}

package() {
  # the package has no install target
  install -Dm755 "${srcdir}/${_pkgname}/build/1pass" "${pkgdir}/usr/bin/1pass"
  install -Dm644 "${srcdir}/${_pkgname}/1pass.lua" \
                 "${pkgdir}/usr/share/1pass/1pass.lua"
  install -Dm644 "${srcdir}/${_pkgname}/JSON.lua" \
                 "${pkgdir}/usr/share/1pass/JSON.lua"
  install -Dm644 "${srcdir}/${_pkgname}/dumptable.lua" \
                 "${pkgdir}/usr/share/1pass/dumptable.lua"

  install -Dm644 "${srcdir}/${_pkgname}/LICENSE.txt" \
                 "${pkgdir}/usr/share/licenses/${_pkgname}/COPYING"
}
