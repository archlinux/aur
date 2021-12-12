# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Alexander 'z33ky' Hirsch <1zeeky@gmail.com>

pkgname=libabigail
pkgver=2.0
pkgrel=1
pkgdesc='ABI Generic Analysis and Instrumentation Library'
arch=('x86_64')
license=('Apache')
url='https://sourceware.org/libabigail/'
depends=('libxml2' 'elfutils' 'python')
makedepends=('python-sphinx')
source=(
  "http://mirrors.kernel.org/sourceware/libabigail/libabigail-$pkgver.tar.gz"
  'add_kmidiff_man.patch'
)
sha512sums=('288f63f3495f0cd38258c50b78f30a573e43ab60494fefa22c8cba6d6776c5f94742ffea26297a232b78d25f6804f1b3f51febd59ec487733e6ef683cef2c180'
            '3ad314f5a1cdb0e788fae458694af7a770a1a5eeab64c1dea30ab6d112a88c86da8c971624587766c0d19138d06d6070286071b27505baaf13d3a281370f3cab')
b2sums=('2ba6f59bcd7a1484c4a60c6c9f212ad76af239a552d2cc9e47748e0db52363afadd7a99ef3e123c263de34b416f71b9d679bf2a5c542c419bb38ee75f3d5c57b'
        'a0bb44acb93985362966159c60c233c050a825b38d9cecc1f48e803d721d258964d87dd11f0dd951ba4b812c7cf8ef41ea09e7b6b4584bf16c2c48b2cbd97266')

prepare() {
  cd "$pkgname-$pkgver"

  patch -p1 -i ../add_kmidiff_man.patch

  autoreconf -fi
}

build() {
  cd "$pkgname-$pkgver"

  ./configure \
    --prefix=/usr \
    --enable-bash-completion \
    --disable-manual \
    --disable-apidoc \
    --disable-static

  make

  # man pages
  make -C doc/manuals man
}

check() {
  cd "$pkgname-$pkgver"
  make check
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install

  # man pages
  OLDIFS="$IFS"
  IFS="."
  pushd doc/manuals/man

  # delete Fedora-specific man page
  rm -vf fedabipkgdiff.1

  for filename in *; do
    read -ra PART <<< "$filename"
    section="${PART[1]}"
    install -vDm644 -t "$pkgdir/usr/share/man/man${section}" "$filename"
  done
  IFS="$OLDIFS"
  unset OLDIFS
  popd

  # bash completion
  cd bash-completion
  for filename in abicompat abidiff abidw abilint abipkgdiff; do
    install -vDm644 -t "$pkgdir/usr/share/bash-completion/completions" "$filename"
  done
}
