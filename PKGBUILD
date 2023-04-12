_pkgname=rime-ice
pkgname=rime-ice
pkgver=2023_04_11T15_24_25Z
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

_default_bak=default_custom.yaml
prepare() {
  cd "${_pkgname}" &&
    mv ./default.yaml ./${_default_bak} &&
    # Link essentials.
    for _f in $(pacman -Qql rime-prelude | grep -v "/$"); do ln -sf "$_f" .; done
}


package() {
  cd "${_pkgname}" || return

  install -Dm644 ./${_default_bak} "${pkgdir}/usr/share/rime-data/rime_ice_suggestion.yaml"

  rm ./${_default_bak} && find . -type l -delete


  install -Dm644 cn_dicts/* -t "${pkgdir}/usr/share/rime-data/cn_dicts"
  install -Dm644 en_dicts/* -t "${pkgdir}/usr/share/rime-data/en_dicts"
  install -Dm644 opencc/*   -t "${pkgdir}/usr/share/rime-data/opencc"

  install -Dm644 ./*.{yaml,lua,gram} -t "${pkgdir}/usr/share/rime-data/"
}
