# Maintainer: Bink

pkgname=qpress-git
_gitname="qpress"
pkgver=20230507.r41.f9252a0
pkgrel=3
pkgdesc="qpress is a portable high-speed file archiver using QuickLZ designed to utilize fast storage systems"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://github.com/PierreLvx/qpress"
license=('GPL')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
	printf "%s.r%s.%s" "$(git -C $_gitname tag --sort=committerdate | tail -1 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')" "$(git -C $_gitname rev-list --count HEAD)" "$(git -C $_gitname rev-parse --short=7 HEAD)"
}

build() {
  cd "${srcdir}/${_gitname}" || exit
  # Fix for isatty()
  sed -i 's|#include <sys/types.h>|#include <sys/types.h>\n  #include <unistd.h> // for isatty()|' qpress.cpp
  make
}

package(){
    install -d "${pkgdir}/usr/bin/"
    install "${srcdir}/${_gitname}/qpress" "${pkgdir}/usr/bin/"
}
