# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_zig=0.10
pkgname="agertu"
_commit_rel="e5e3a0fc2e62701447b32bd3ab3004f5d847e58c" # 1.0.1
_commit="9538804e405e99cab6fca3342aca0d08da214941" # r6
pkgver="1.0.1+r6+g${_commit::7}"
pkgrel=2
pkgdesc="Popup information for river Wayland compositor"
arch=(
  'x86_64'
)
url="https://git.sr.ht/~novakane/${pkgname}"
license=(
  'GPL-3.0-or-later'
)
depends=(
  'fcft>=3.0'
  'glibc'
  'pixman'
  'river'
  'wayland'
)
makedepends=(
  'wayland-protocols'
  "zig${_zig}"
)
_pkgsrc="${url##*/}-${_commit}"
source=(
  "${_pkgsrc}.tar.gz::${url}/archive/${_commit}.tar.gz"
  "zig-fcft-cf6d6057faa8ec7b149c53005ba6bd247c8b6dff.tar.gz::https://git.sr.ht/~novakane/zig-fcft/archive/cf6d6057faa8ec7b149c53005ba6bd247c8b6dff.tar.gz"
  "zig-pixman-4a49ba13eb9ebb0c0f991de924328e3d615bf283.tar.gz::https://codeberg.org/ifreund/zig-pixman/archive/4a49ba13eb9ebb0c0f991de924328e3d615bf283.tar.gz"
  "zig-wayland-ace6aeebcf95930ce52bb277e1899f7c050378d4.tar.gz::https://codeberg.org/ifreund/zig-wayland/archive/ace6aeebcf95930ce52bb277e1899f7c050378d4.tar.gz"
)
b2sums=('c2902262739715ad7d47c4bafaad508aa8712d1bfda7dfbea51cddd25452abc5b0e8134ad76b69475f9ec83361fdca55df70d4a7d8cf1d9835110b1fa5e46fc5'
        '9ea3e90c6317cacf7ad90c39791ac9bae9b71d60a584abff44cc0c6644426b463c571889ab1c342718da7542c264ce8007291104e4f1028c8c003b68aecb123c'
        '4813a1ff7e5bb1c4d5a918ddd7ab27a6e7b337d6418714a9be03a85a73eab06da5c9870dde60d5313e5a147e9a3de6a66d80ac5802405e0971f4ba599e86b4c0'
        'f1277199d2e8e24a7d2bed4444c7cdfb88e467c70c8a0e9e98d67e3a11bac42d1f5d7174e2c3e266b7cab2cd8244c0ae906a467403396ea75c439a795957b469')

prepare() {
  cd "${srcdir}"
  cp -aT "zig-fcft-cf6d6057faa8ec7b149c53005ba6bd247c8b6dff" "${_pkgsrc}/deps/zig-fcft"
  cp -aT "zig-pixman" "${_pkgsrc}/deps/zig-pixman"
  cp -aT "zig-wayland" "${_pkgsrc}/deps/zig-wayland"
}

build() {
  local zig_options=(
    --prefix /usr
    --search-prefix /usr
    --global-cache-dir "${srcdir}/zig-global-cache"
    --verbose
    -Dtarget=native-linux.6.15-gnu.2.34
    -Dcpu=baseline
    -Drelease-safe=true
  )

  cd "${srcdir}/${_pkgsrc}"
  DESTDIR="build" "zig-${_zig}" build "${zig_options[@]}"
}

check() {
  local zig_options=(
    --prefix /usr
    --search-prefix /usr
    --global-cache-dir "${srcdir}/zig-global-cache"
    --verbose
    -Dtarget=native-linux.6.15-gnu.2.34
    -Dcpu=baseline
    -Drelease-safe=true
  )

  cd "${srcdir}/${_pkgsrc}"
  DESTDIR="check" "zig-${_zig}" build test "${zig_options[@]}"
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  cp -vaT --no-preserve=ownership "build" "${pkgdir}"

  install -vDm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -vDm644 "COPYING"   -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
