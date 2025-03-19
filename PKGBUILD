# Maintainer: Francesco Cherchi <frnchr.d9var@slmail.me>

pkgname=markdown2zim-git
pkgver=r37.c377bd6
pkgrel=1
pkgdesc="Convert between markdown and zim wiki syntax"
arch=(any)
url="https://github.com/Xunius/markdown2zim"
license=('MIT')
depends=('python')
makedepends=('zip' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/Xunius/markdown2zim.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/${pkgname%-git}"
  for n in markdown2zim zim2markdown; do
    mkdir $n
    cp -r lib/ $n/
    cp $n.py $n/__main__.py
  done
}

build() {
  cd "$srcdir/${pkgname%-git}"
  for n in markdown2zim zim2markdown; do
    pushd $n
    zip -r $n ./*
    printf '#!/usr/bin/env python\n' | cat - $n.zip > $n
    popd
  done
}

package() {
  cd "$srcdir/${pkgname%-git}"
  for n in markdown2zim zim2markdown; do
    install -Dm755 $n/$n "$pkgdir/usr/bin/$n"
  done
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
