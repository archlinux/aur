# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
# Maintainer: fusion809 <CONTACT via comments at https://aur.archlinux.org/packages/jucipp>
# Maintainer: eidheim
# Contributor: archshift

pkgname=jucipp
glab="https://gitlab.com"
cpp="$glab/cppit"
pkgdesc='A lightweight cross-platform C++ IDE'
pkgver=1.7.2
pkgrel=1
arch=('x86_64')
url="$cpp/jucipp"
license=('MIT')
depends=('gtksourceviewmm' 'clang' 'aspell-en' 'lldb' 'boost-libs' 'libgit2' 'ctags')
makedepends=('git' 'cmake' 'pkg-config' 'boost')
source=("$pkgname::git+$url.git#tag=v${pkgver}"
  "git+$cpp/libclangmm.git"
  "git+$glab/eidheim/tiny-process-library")
sha1sums=('SKIP'
          'SKIP'
          'SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --tags `git rev-list --tags --max-count=1` | sed 's/v//g'
}

prepare() {
  cd "$srcdir/$pkgname"

  git submodule init
  git config submodule.libclangmm.url "$srcdir/lib/libclangmm"
  git config submodule.tiny-process-library.url "$srcdir/lib/tiny-process-library"
  git submodule update

  mkdir -p build
}

build() {
  cd "$srcdir/$pkgname/build"
  cmake -DCMAKE_INSTALL_PREFIX=/usr -Wno-dev ..
}

package() {
  cd "$srcdir/$pkgname/build"
  make DESTDIR="$pkgdir" install
  install -D -m644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
