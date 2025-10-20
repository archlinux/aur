# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_zig=0.15
pkgname="hevi"
_commit_rel="d56713927939494b194e9b04092eb7c22d2e480e" # 1.1.0
_commit="6f46f9e6fbcfb7bd331dadbde7f6da48a6679b5c" # r28
pkgver="1.1.0+r28+g${_commit::7}"
pkgrel=1
pkgdesc="A modern hex viewer"
arch=('aarch64' 'i686' 'x86_64')
url="https://arnau478.github.io/hevi"
_url="https://github.com/Arnau478/${pkgname}"
license=('GPL-3.0-only')
makedepends=(
  "zig>=${_zig}"
)
_zigdepends=(
  # hevi
  "ziggy-4353b20ef2ac750e35c6d68e4eb2a07c2d7cf901.tar.gz::https://github.com/kristoff-it/ziggy/archive/4353b20ef2ac750e35c6d68e4eb2a07c2d7cf901.tar.gz"
  "pennant-df76de01bcf06eb1dcb40dbf04f7c219c3a35a7d.tar.gz::https://github.com/Arnau478/pennant/archive/df76de01bcf06eb1dcb40dbf04f7c219c3a35a7d.tar.gz"

  # ziggy
  "known-folders-aa24df42183ad415d10bc0a33e6238c437fc0f59.tar.gz::https://github.com/ziglibs/known-folders/archive/aa24df42183ad415d10bc0a33e6238c437fc0f59.tar.gz"
  "lsp-kit-01c14e592d25dc57dfebba27b8bd2b4aa91c1140.tar.gz::https://github.com/kristoff-it/lsp-kit/archive/01c14e592d25dc57dfebba27b8bd2b4aa91c1140.tar.gz"
)
_pkgsrc="${pkgname}-${_commit}"
source=("${_pkgsrc}.tar.gz::${_url}/archive/${_commit}.tar.gz"
        "${_zigdepends[@]}")
noextract=("${_zigdepends[@]%%::*}")
b2sums=('47c8d8ab6fcc874bed5cd2a583512c304fcaedbed3f798b4af89ba0819761f380995626f19e64f05cc145fc5f6f841d7edcf19b2c074b6b416e9892edda219cb'
        '13ce20c231f31d629b399d5c115eff43e953d1c3d7f1a3b30de177c3b9a2eaa61f801b65483dbe51e18eb8ee7d0605fa2d8c892aca6e2e53fa5463805872ada6'
        '6e54c840abb3d3ea958663e35f40dcb50d38daf906a02cfd96d56e874fcc1ff525d4c63356e565b0429c443e03da24ff89cc7813d401693e45f1b9195ff1dea1'
        'c2d8a5062b1baf2868b4b6f58df9d065638a551c60bc7217a14e8395009a231603d2b2a8112fad7198ede43934f523c2b25654a54f89a088eabf72d23bd9b48d'
        '492dbc25635417efebb71ed5b3c655b8ce95cf499a7c7f9def3af7377fbdb20b1f9fdf698fbd3689cce343a44ece116b858d950850bc7efacbccc894aaf2bef9')

prepare() {
  cd "${srcdir}"
  for dep in "${_zigdepends[@]}"; do
    zig fetch --global-cache-dir ./zig-global-cache "${dep%%::*}"
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
    -Dpie
  )

  cd "${srcdir}/${_pkgsrc}"
  DESTDIR="build" zig build "${zig_options[@]}"
}

check() {
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
    -Dpie
  )

  cd "${srcdir}/${_pkgsrc}"
  DESTDIR="check" zig build "${zig_options[@]}"
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  cp -vaT --no-preserve=ownership "build" "${pkgdir}"

  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  cd "doc"
  install -vDm644 "${pkgname}.1.man" "${pkgdir}/usr/share/man/man1/${pkgname}.1"
  install -vDm644 "${pkgname}.5.man" "${pkgdir}/usr/share/man/man5/${pkgname}.5"
}
