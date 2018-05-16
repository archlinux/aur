# Maintainer: Damjan Georgievski <gdamjan@gmail.com>

pkgname=minijail-git
_gitname=minijail
pkgver=r1039.5423421
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc='Tool to run a process in jailed environment'
url="https://android.googlesource.com/platform/external/minijail/"
license=('custom:chromiumos')
depends=('libcap')
provides=('minijail')
conflicts=('minijail')
makedepends=('git' 'make')
sha256sums=('SKIP'
            '551be8c810a93273ad47797e74cfe96d6e2338901547d93a14f42e3d238749b1')

source=('git+https://android.googlesource.com/platform/external/minijail'
        'signal_handler.patch')

pkgver() {
  cd "${srcdir}/${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_gitname}"
  patch -p1 < ${srcdir}/signal_handler.patch
  make
}

package() {
  cd "${srcdir}/${_gitname}"
  install -m755 -D minijail0 "$pkgdir"/usr/bin/minijail0
  install -m755 -D libminijail.so "$pkgdir"/usr/lib/libminijail.so
  install -m755 -D libminijailpreload.so "$pkgdir"/usr/lib/libminijailpreload.so
  install -m644 -D libminijail.h "$pkgdir"/usr/include/libminijail.h
  install -m644 -D minijail0.1 "$pkgdir"/usr/share/man/man1/minijail0.1
  install -m644 -D minijail0.5 "$pkgdir"/usr/share/man/man5/minijail0.5
  install -m644 -D LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
