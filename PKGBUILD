# Maintainer: Evgeniy Alekseev <arcanis at archlinux dot org>
# Contributor: crequill

pkgname=1pass-hg
_pkgname=1pass
pkgver=r58.1390348facc7
pkgrel=1
pkgdesc="1Password-compatible password management tool for Linux"
arch=('i686' 'x86_64')
license=('zlib')
url="https://www.icculus.org/1pass/"
depends=('gtk2' 'libxtst')
makedepends=('cmake' 'mercurial')
source=("hg+http://hg.icculus.org/icculus/1pass/"
        "1pass-lua.patch")
sha512sums=('SKIP'
            '8754cc7ff10546045a72f96ed608d9af6acad8b6274407df44807ce699b570fda630d2a2157df582f65e9f1070580d16c7e368303e9f42e42b8e263d36f6e6db')

pkgver() {
  cd "${_pkgname}"
  local rev="$(hg identify -n)"
  local commit="$(hg identify -i)"
  printf "r%s.%s" ${rev//+/} ${commit//+/}
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
