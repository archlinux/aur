# Maintainer: Tinu Weber <http://ayekat.ch/>

pkgname=corearbiter-git
pkgver=r149.111b94e
pkgrel=2
arch=(x86_64)

pkgdesc='The Core Arbiter for Arachne'
license=(unknown)
url='https://github.com/PlatformLab/CoreArbiter/'

source=('git+https://github.com/PlatformLab/CoreArbiter/'
        'makefile.diff')
sha256sums=(SKIP
            SKIP)

provides=(corearbiter)
conflicts=(corearbiter)

depends=(gcc-libs glibc pcre)
makedepends=(git perfutils)

options=(staticlibs)

pkgver() {
  cd CoreArbiter
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd CoreArbiter
  patch -p1 -i "$srcdir"/makefile.diff
}

build() {
  cd CoreArbiter
  make PERFUTILS=/usr
}

package() {
  cd CoreArbiter

  # libraries
  install -Dm0644 lib/libCoreArbiter.a "$pkgdir"/usr/lib/libCoreArbiter.a

  # binaries
  install -Dm0755 bin/coreArbiterServer "$pkgdir"/usr/bin/coreArbiterServer

  # headers
  install -dm0755 "$pkgdir"/usr/include/CoreArbiter
  install -m0644 include/CoreArbiter/* "$pkgdir"/usr/include/CoreArbiter/
}
