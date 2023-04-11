# Maintainer: everyx <lunt.luo#gmail.com>

_pkgname=rime-ice
pkgname=rime-ice-git
pkgver=r164.1d660e2
pkgrel=1
pkgdesc="Rime 配置：雾凇拼音 | 长期维护的简体词库"
arch=("any")
url="https://github.com/iDvel/rime-ice"
license=("GPL3")
makedepends=("librime" "rime-prelude")
provides=("${_pkgname}")
conflicts=("${_pkgname}" "rime-emoji-git" "rime-emoji")
source=("${_pkgname}::git+${url}.git")
sha512sums=("SKIP")

pkgver() {
  cd "${_pkgname}" &&
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${_pkgname}" &&
    mv ./default.yaml ./default_custom.yaml &&
    # Link essentials.
    for _f in $(pacman -Qql rime-prelude | grep -v "/$"); do ln -sf "$_f" .; done
}

build() {
  cd "${_pkgname}" &&
    for _s in *.schema.yaml; do rime_deployer --compile "$_s"; done
}

package() {
  cd "${_pkgname}" || return

  find . -type l -delete && rm build/*.txt

  install -Dm644 ./default_custom.yaml "${pkgdir}/usr/share/rime-data/rime_ice_suggestion.yaml"

  install -Dm644 ./*.{schema,dict}.yaml -t "${pkgdir}/usr/share/rime-data/"
  install -Dm644 ./*.{lua,gram} -t "${pkgdir}/usr/share/rime-data/"
  install -Dm644 symbols_custom.yaml -t "${pkgdir}/usr/share/rime-data/"

  install -Dm644 cn_dicts/* -t "${pkgdir}/usr/share/rime-data/cn_dicts"
  install -Dm644 en_dicts/* -t "${pkgdir}/usr/share/rime-data/en_dicts"
  install -Dm644 opencc/* -t "${pkgdir}/usr/share/rime-data/opencc"
  install -Dm644 build/* -t "${pkgdir}/usr/share/rime-data/build/"
}
