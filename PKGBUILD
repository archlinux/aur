# Maintainer: Christian Kugler <syphdias+git@gmail.com>
# Contributor: Moritz Kaspar Rudert (mortzu)
# Contributor: Christian Hesse <mail@eworm.de>

pkgname=blink1
pkgver=2.3.0
_tag=597db6b6a4954dbe9ff17a58b9bf6030bd6aaa89
pkgrel=1
pkgdesc='software for blink(1) USB RGB LED'
arch=('i686' 'x86_64')
url='https://github.com/todbot/blink1-tool/'
license=('GPL')
makedepends=('git')
conflicts=('blink1-git')
source=("git+https://github.com/todbot/blink1-tool.git#tag=${_tag}"
        'git+https://github.com/libusb/hidapi.git')
sha256sums=('SKIP'
            'SKIP')

prepare() {
  cd "${srcdir}/${pkgname}-tool"
  git submodule init

  git config submodule.hidapi.url "${srcdir}/hidapi"

  git -c protocol.file.allow=always submodule update
}

build() {
  cd "${srcdir}/${pkgname}-tool"
  # remove no-format, since it conflicts with format-security
  sed -i 's/-Wno-format //' Makefile
  make
}

package() {
  # binary
  install -D -m0755 "${srcdir}/${pkgname}-tool/blink1-tool" "${pkgdir}/usr/bin/blink1-tool"
}
