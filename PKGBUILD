# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=pe-bear-git
pkgver=0.7.0.4.r0.g773c7f7
pkgrel=1
pkgdesc="Portable Executable reversing tool with a friendly GUI"
arch=(x86_64 i686 armv7h aarch64)
url="https://hshrzd.wordpress.com/pe-bear/"
license=(GPL2)
depends=(qt5-base glibc gcc-libs)
makedepends=(git cmake)
provides=(pe-bear)
conflicts=(pe-bear)
source=("git+https://github.com/hasherezade/pe-bear.git"
        "git+https://github.com/capstone-engine/capstone.git"
        "git+https://github.com/hasherezade/bearparser.git")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd pe-bear
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd pe-bear
  git submodule init
  git config submodule.capstone.url "${srcdir}/capstone"
  git config submodule.bearparser.url "${srcdir}/bearparser"
  git -c protocol.file.allow=always submodule update
}

build() {
  cmake -B build -S "pe-bear" -Wno-dev \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr

  cmake --build build
}

package() {
  #make DESTDIR="${pkgdir}" install
  install -D build/pe-bear/PE-bear -t "${pkgdir}/usr/lib/pe-bear/"
  install -D pe-bear/SIG.txt       -t "${pkgdir}/usr/lib/pe-bear/"
  install -d "${pkgdir}/usr/bin"
  ln -s /usr/lib/pe-bear/PE-bear "$pkgdir/usr/bin/pe-bear"

  install -D pe-bear/logo/main_ico.png "${pkgdir}/usr/share/pixmaps/pe-bear.png"
}
