# Maintainer: Tinu Weber <http://ayekat.ch/>

pkgname=arachne-git
pkgver=r462.2c5cc16
pkgrel=1
arch=(x86_64)

pkgdesc='Core aware thread management system'
license=(unknown)
url='https://github.com/PlatformLab/Arachne/'

source=('git+https://github.com/PlatformLab/Arachne/'
        'makefile.diff')
sha256sums=(SKIP
            4ffa97a8a6b1e9fbf15c709a5c02a3bb13ef54ceb3c150d59345df57a75c2ed5)

provides=(arachne)
conflicts=(arachne)

makedepends=(git corearbiter perfutils)

options=(staticlibs)

pkgver() {
  cd Arachne
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd Arachne
  patch -p1 -i "$srcdir"/makefile.diff
}

build() {
  cd Arachne
  make PERFUTILS=/usr COREARBITER=/usr \
       EXTRA_CXXFLAGS='-Wno-error=class-memaccess'
}

package() {
  cd Arachne

  # libraries
  install -Dm0644 lib/libArachne.a "$pkgdir"/usr/lib/libArachne.a

  # headers
  install -dm0755 "$pkgdir"/usr/include/Arachne
  install -m0644 include/Arachne/* "$pkgdir"/usr/include/Arachne/

  # misc
  install -Dm0644 README.md "$pkgdir"/usr/share/doc/"${pkgname%-git}"/README.md
}
