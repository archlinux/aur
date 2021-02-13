# Maintainer: mojyack <mojyack at gmail.com>
pkgname=fcitx5-mikan-git
pkgver=1
pkgrel=1
pkgdesc='mikan input method for fcitx5'
arch=('x86_64')
url='https://github.com/mojyack/mikan'
license=('MIT')
depends=('mikan-dictionary' 'fcitx5' 'mecab')
makedepends=('meson' 'ninja')
optdepends=('mikan-additional-dictionary: increases vocabulary')
conflicts=('fcitx5-mikan')
source=("source::git+https://github.com/mojyack/mikan")
md5sums=('SKIP')

pkgver() {
    cd source
    printf "%s_r%s" "$(grep -ozP "(?s)^project\('fcitx5-mikan'.*?version : *'\K[\d.]*" meson.build | tr '\0' '\n')" "$(git rev-parse --short HEAD)"
}

build() {
    cd source
    meson setup release
    meson configure -Dprefix=/usr -Dlibdir=lib/fcitx5 -Ddictionary_path=share/mikan-im/dic -Dbuildtype=release release
    ninja -C release
}

package() {
    cd source
    DESTDIR="${pkgdir}" ninja -C release install
}

