# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: thecashewtrader <thecashewtrader at protonmail dot com>

_zig=0.13
pkgname="scafetch"
_commit_rel="550f9ca577311507e261232131deb22749afc487" # 0.1.1
_commit="c7111347a0ed83465d0fe311213633dfec47e235" # r14
pkgver="0.1.1+r14+g${_commit::7}"
pkgrel=1
pkgdesc="Display information about your remote Git repositories in an aesthetic and visually pleasing way"
arch=('x86_64')
url="https://github.com/iddev5/${pkgname}"
license=('MIT')
depends=(
  'glibc'
)
makedepends=(
  "zig${_zig}"
)
_zigdepends=(
  "ay-arg-80c1df8b85214bd8d3bd61458cd9e6533880dc1f.tar.gz::https://github.com/iddev5/ay-arg/archive/80c1df8b85214bd8d3bd61458cd9e6533880dc1f.tar.gz"
)
_pkgsrc="${url##*/}-${_commit}"
noextract=("${_zigdepends[@]%%::*}")
source=("${_pkgsrc}.tar.gz::${url}/archive/${_commit}.tar.gz"
        "${_zigdepends[@]}")
b2sums=('42ca12b6464216651db94c0835a122e83c6414509a8b92b147e4a3fec4d848583bbcb063615f18cc154e7f02b159377d99fa8058062ac2423f776a26f96ae25f'
        'bab878a3309af9f8d4b147fd4549512cf7525fada930e508cc360f00e2ba56c3ee779ed11d9ea8ce2ea18aff970c1dafc5d3f68676e55b4c859cb44860d8b29b')
           
prepare() {
  cd "${srcdir}"
  for dep in "${_zigdepends[@]}"; do
    "zig${_zig}" fetch --global-cache-dir ./zig-global-cache "${dep%%::*}"
  done
}

build() {
  local zig_options=(
    --summary all
    --prefix /usr
    --search-prefix /usr
    --global-cache-dir "${srcdir}/zig-global-cache"
    --system "${srcdir}/zig-global-cache/p"
    --verbose
    -Dtarget=native-linux.6.15-gnu.2.42
    -Dcpu=baseline
    -Doptimize=ReleaseSafe
  )

  cd "${srcdir}/${_pkgsrc}"
  DESTDIR="build" "zig${_zig}" build "${zig_options[@]}"
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  cp -vaT --no-preserve=ownership "build" "${pkgdir}"

  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
