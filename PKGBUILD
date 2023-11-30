_pkgname=rime-ice
pkgname=rime-ice
pkgver=2023_11_29T01_52_15Z
pkgrel=2
pkgdesc="Rime 配置：雾凇拼音 | 长期维护的简体词库 | (自动版本号/减少编译)"
arch=("any")
url="https://github.com/iDvel/rime-ice"
license=("GPL3")
makedepends=("librime" "rime-prelude" "git")
provides=("${_pkgname}")
conflicts=("${_pkgname}" "rime-emoji-git" "rime-emoji")
source=("${_pkgname}::git+${url}.git")
sha512sums=("SKIP")

pkgver() {
  cd "${_pkgname}" &&
    echo | git show --pretty=format:"%cI" | head -1 | awk -F "[-,=,:,+]" '{print $1"_"$2"_"$3"_"$4"_"$5"Z"}'

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
  rm -r others/
  rm "README.md"
  rm "LICENSE"


  cp -r ./* -t "${pkgdir}/usr/share/rime-data/"
}
