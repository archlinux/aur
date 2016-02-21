# Maintainer: Davide Iosca <dvdios [at] aol [dot] com>

pkgname='vkcube-git'
pkgdesc='Demo cube app for Vulkan'
pkgver=r34.55ca5fb
pkgrel=2
url='https://github.com/krh/vkcube'
arch=('i686' 'x86_64')
license=('MIT')
depends=('vulkan-icd-loader' 'libpng' 'mesa')
source=('git+https://github.com/krh/vkcube'
  'fedora-fixes.diff')
sha1sums=('SKIP'
  '759aead188d3e45c7d2284280c1b98fd108f2dc1')
makedepends=('git' 'vulkan-i965-git')

pkgver() {
  cd "${srcdir}"/vkcube
  printf "r%d.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}"/vkcube

  patch -p1 < ../fedora-fixes.diff

  autoreconf -f -i -v
  ./configure --prefix=/usr
	
  # Temporary fix until Intel vulkan driver moves to /usr/
  sed -i.bak 's|DEFAULT_INCLUDES = -I.|DEFAULT_INCLUDES = -I. -I/opt/mesa-vulkan/include|g' Makefile
}

build() {
  cd "${srcdir}"/vkcube

  make V=1 -j2
}

package() {
  cd "${srcdir}"/vkcube

  install -dm755 "${pkgdir}"/usr/bin
  install  -m755 vkcube "${pkgdir}"/usr/bin/vkcube
}

