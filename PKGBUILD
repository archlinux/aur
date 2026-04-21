# Maintainer: taotieren <admin@taotieren.com>
# Contributor: Anatol Pomozov
# Co-Maintainer: Abdelhak Bougouffa <abougouffa@fedoraproject.org>
# Contributor: Thomas Krug <t.krug@elektronenpumpe.de>

pkgname=dsview-git
pkgver=1.3.2.r53.g2e9e2c8
pkgrel=16
pkgdesc='GUI programe for supporting various instruments from DreamSourceLab, including logic analyzer, oscilloscope, etc.'
arch=($CARCH)
url='http://www.dreamsourcelab.com/'
license=('GPL-3.0-only')
provides=(
  ${pkgname%-git}
)
conflicts=(
  ${pkgname%-git}
)
replaces=()
# Upstream added VCS dependency to libsigrokdecode :/
_qt=qt6
depends=(
  hicolor-icon-theme
  glib2
  glibc
  libgcc
  libstdc++
  libusb
  ${_qt}-base
  fftw
  python
  zlib
  # AUR
  python-mcp
  python-toon
)
makedepends=(
  boost
  boost-libs
  cmake
  git
  ${_qt}-tools
  ninja
  pkgconf
)
source=("${pkgname}::git+https://github.com/DreamSourceLab/DSView.git")
sha1sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  (
    set -o pipefail
    git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

prepare() {
  git -C "${srcdir}/${pkgname}" clean -dfx
  cd "${srcdir}"/${pkgname}/

  # DSView is now the default app for .dsl files and added to 'Open With' #753
  git cherry-pick -n 6a10c7c6600267d5e8b3b9a9d2e691288ae8379a
  git cherry-pick -n c27f1ecf641e8daa49b84a38a648f7bb9a55929e

  # 修复 Arch Linux 下 dsview 编译报错 #826 
  git cherry-pick -n 80fd274fb1b73a842499a115f1672fcbb792c9d0
  git cherry-pick -n fa25478f206fd95108ce57983905b555e24d2b01

  # update zh #828
  git cherry-pick -n 502a418a4a301d1e9e41b23955d3a9179dac3b35
  
  # Small style tweaks to improve usability #844
  git cherry-pick -n ddfd45f2e4e93ab237e5cba7773fa6f5428fc5fd
  git cherry-pick -n 15d25dbb0c65978e6a3c5742449b19aa736e9a62
  git cherry-pick -n c9fb9a24721ab0ecee853d513c038e0516061572
  git cherry-pick -n 126b24c55fa325968abf81fdc3a35c3a66afe9ee

  # Add manual setting for external clock frequency #845
  git cherry-pick -n 91f687eb264640cf212a12dac1cd94fec5f6fc91

  # Glitch Filter for 1:I2C decoder #853
  git cherry-pick -n 9934143da49a1b669ae458c451e53f239b1c5c08
  git cherry-pick -n 5aa0b9de18342fc46e42edc691891eca7af503cb

  # fix: make project buildable with CMake 4+ #886
  git cherry-pick -n cdf3f540bc33ad46d8c47e8d0941db34a218df33

  # Packaging, CLI and MCP agent #899
  git cherry-pick -n bfa6c18cb4abbc738c2e7b7a44e5b29d11fbed6f
  git cherry-pick -n d33e389ec66476349ce703b209c74ec3582df06a
  git cherry-pick -n f69b6f3a328541e8bf1c83fa3daac5501f956593
  git cherry-pick -n ba6e86fcd7a20303e1ec25d8f12069beb6cd58db

  # Fix window drag on Wayland #902
  git cherry-pick -n c9aeded7d621264c82b7646ed34c04697812e2cd

  sed -i 's#MODE="0666"#TAG+="uaccess"#' DSView/DreamSourceLab.rules
}

build() {
  export CFLAGS+=" ${CPPFLAGS}"
  export CXXFLAGS+=" ${CPPFLAGS}"
  export LDFLAGS+=" ${LDFLAGS}"
  cd "${srcdir}"/${pkgname}/

  # see：https://wiki.archlinux.org/title/CMake_package_guidelines
  cmake -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -Wno-dev \
    -B build \
    -G Ninja

  ninja -C build
}

check() {
  cd "${srcdir}"/${pkgname}/
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="${pkgdir}" ninja -C "${srcdir}"/${pkgname}/build install
  install -Dm0644 "${srcdir}/${pkgname}/COPYING" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
