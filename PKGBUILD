# Maintainer: Yufan You <ouuansteve at gmail>

pkgname=rime-latex-lowercase-git
pkgver=r43.c863ef7
pkgrel=2
provides=('rime-latex' 'rime-latex-lowercase')
conflicts=('rime-latex' 'rime-latex-lowercase')
pkgdesc='Rime Latex 数学符号输入方案，所有符号均使用纯小写字母输入'
arch=('any')
url='https://github.com/shenlebantongying/rime_latex'
_reponame="${url##*/}"
license=('GPL-3.0-only')
makedepends=('git' 'librime')
source=("git+${url}")
sha256sums=('SKIP')

pkgver() {
    cd "$_reponame"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$_reponame"
    sed -i -E 's/(\\\S+)/\L\1/' latex.dict.yaml
    rime_deployer --compile latex.schema.yaml . /usr/share/rime-data
    rm build/*.txt
}

package() {
    cd "$_reponame"
    install -Dm644 ./*.yaml -t "$pkgdir"/usr/share/rime-data/
    install -Dm644 build/* -t "$pkgdir"/usr/share/rime-data/build/
}
