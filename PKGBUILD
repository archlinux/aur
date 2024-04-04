# Contributor: Kisaragi Hiu <mail@kisaragi-hiu.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Kasei Wang <kasei@kasei.im>

pkgbase=fcitx5-pinyin-zhwiktionary-git
_converter=fcitx5-pinyin-zhwiki
pkgname=(fcitx5-pinyin-zhwiktionary rime-pinyin-zhwiktionary)
_zhwiktionaryver=latest
pkgver=0.20240401
pkgrel=1
pkgdesc="Fcitx 5 Pinyin Dictionary from zh.wiktionary.org"
arch=('any')
url="https://github.com/kaseiwang/fcitx5-pinyin-zhwiki"
license=('CCPL:by-sa' 'custom:GFDL')
makedepends=('libime' 'opencc' 'pypinyin')
source=(git+https://github.com/kaseiwang/fcitx5-pinyin-zhwiki
        https://dumps.wikimedia.org/zhwiktionary/$_zhwiktionaryver/zhwiktionary-$_zhwiktionaryver-all-titles-in-ns0.gz
        https://dumps.wikimedia.org/zhwiktionary/$_zhwiktionaryver/zhwiktionary-$_zhwiktionaryver-md5sums.txt
        https://www.gnu.org/licenses/fdl-1.3.txt)
sha512sums=('SKIP'
            'SKIP'
            'SKIP'
            '22d46818d3998ad841f537af4de7c50440dd918099fb6c5d4ab324cd71dc03066bfe1b67210a5efde77abd1d97b88da3c3dbfc39a24ae7248ee2d64e7f0fe6bb')

_make="make -L VERSION=$_zhwiktionaryver"

pkgver() {
  if [[ $(head -1 zhwiktionary-$_zhwiktionaryver-md5sums.txt) =~ [[:digit:]]{8} ]]; then
    echo 0.${BASH_REMATCH[0]}
  fi
}

prepare() {
  cd $_converter
  # Workaround pacman decompression
  touch zhwiktionary-$_zhwiktionaryver-all-titles-in-ns0.gz
  ln -sf ../zhwiktionary-$_zhwiktionaryver-all-titles-in-ns0
}

build() {
  cd $_converter
  $_make zhwiktionary.dict zhwiktionary.dict.yaml
}

package_fcitx5-pinyin-zhwiktionary() {
  cd $_converter
  $_make DESTDIR="$pkgdir" install
  install -Dm644 ../fdl-1.3.txt -t "$pkgdir"/usr/share/licenses/$pkgname/
}

package_rime-pinyin-zhwiktionary() {
  cd $_converter
  $_make DESTDIR="$pkgdir" install_rime_dict
  install -Dm644 ../fdl-1.3.txt -t "$pkgdir"/usr/share/licenses/$pkgname/
}
