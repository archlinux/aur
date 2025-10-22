# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: thecashewtrader <thecashewtrader at protonmail dot com>

_zig=0.15
pkgname="ziggy"
_commit_rel="f0ec5dbf6117d57aa4ee5336c37273c4da7da4e5" # 0.0.1
_commit="4353b20ef2ac750e35c6d68e4eb2a07c2d7cf901" # r72
pkgver="0.0.1+r72+g${_commit::7}"
pkgrel=1
pkgdesc="A data serialization language for expressing clear API messages, config files, etc"
arch=(
  'aarch64'
  'x86_64'
)
url="https://ziggy-lang.io"
_url="https://github.com/kristoff-it/${pkgname}"
license=('MIT')
makedepends=(
  "zig>=${_zig}"
)
_zigdepends=(
  # ziggy
  "known-folders-aa24df42183ad415d10bc0a33e6238c437fc0f59.tar.gz::https://github.com/ziglibs/known-folders/archive/aa24df42183ad415d10bc0a33e6238c437fc0f59.tar.gz"
  "lsp-kit-01c14e592d25dc57dfebba27b8bd2b4aa91c1140.tar.gz::https://github.com/kristoff-it/lsp-kit/archive/01c14e592d25dc57dfebba27b8bd2b4aa91c1140.tar.gz"
)
_pkgsrc="${_url##*/}-${_commit}"
noextract=("${_zigdepends[@]%%::*}")
source=("${_pkgsrc}.tar.gz::${_url}/archive/${_commit}.tar.gz"
        "${_zigdepends[@]}")
b2sums=('13ce20c231f31d629b399d5c115eff43e953d1c3d7f1a3b30de177c3b9a2eaa61f801b65483dbe51e18eb8ee7d0605fa2d8c892aca6e2e53fa5463805872ada6'
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
  )

  cd "${srcdir}/${_pkgsrc}"
  DESTDIR="build" zig build "${zig_options[@]}"
}

# check() {
#   local zig_options=(
#     --summary all
#     --prefix /usr
#     --search-prefix /usr
#     --global-cache-dir "${srcdir}/zig-global-cache"
#     --system "${srcdir}/zig-global-cache/p"
#     --verbose
#     -Dtarget=native-linux.6.15-gnu.2.42
#     -Dcpu=baseline
#     -Doptimize=ReleaseSafe
#   )
# 
#   cd "${srcdir}/${_pkgsrc}"
#   DESTDIR="check" zig build test "${zig_options[@]}"
# }

package() {
  cd "${srcdir}/${_pkgsrc}"
  cp -vaT --no-preserve=ownership "build" "${pkgdir}"

  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
