# Maintainer: MAGPINY BO <magpinyb@proton.me>
pkgname=sysinfoviewer
pkgver=0.3.1
pkgrel=1
pkgdesc="A comprehensive system information viewer built with wxWidgets"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/Magpiny/sysinfoviewer"
license=('MIT')
depends=(
  'wxwidgets-gtk3>=2.8'
  'curl'
  'alsa-lib'
  'libdrm'
)
makedepends=(
  'cmake'
  'gcc'
)
optdepends=(
  'upower: Battery vendor, model, serial and accurate time-remaining'
  'lspci: GPU name detection fallback'
  'lm_sensors: Additional hardware monitoring support'
  'smartmontools: Disk health information'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Magpiny/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('d4d01eecb7643f28d795c42e084fdba80bd1df0a64864d3692cc43a6006804a5')

# Optimization flags for production builds
export CFLAGS="-march=x86-64 -mtune=generic -O3 -pipe -fno-plt -fexceptions \
               -Wp,-D_FORTIFY_SOURCE=2 -Wformat -Werror=format-security \
               -fstack-clash-protection -fcf-protection"
export CXXFLAGS="$CFLAGS -Wp,-D_GLIBCXX_ASSERTIONS"
export LDFLAGS="-Wl,-O1,--sort-common,--as-needed,-z,relro,-z,now"

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  cmake -B build -S . \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_C_FLAGS_RELEASE="${CFLAGS} -DNDEBUG -ffunction-sections -fdata-sections" \
    -DCMAKE_CXX_FLAGS_RELEASE="${CXXFLAGS} -DNDEBUG -ffunction-sections -fdata-sections" \
    -DCMAKE_EXE_LINKER_FLAGS="${LDFLAGS} -Wl,--gc-sections" \
    -DCMAKE_INTERPROCEDURAL_OPTIMIZATION=ON \
    -DCMAKE_SKIP_RPATH=ON \
    -Wno-dev

  cmake --build build --parallel
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  # cmake --build build --target test
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  DESTDIR="${pkgdir}" cmake --install build

  # Strip binary
  strip --strip-all "${pkgdir}/usr/bin/${pkgname}" 2>/dev/null || true

  # License
  install -Dm644 LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Documentation
  install -Dm644 README.md \
    "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  # Desktop entry
  if [ -f "${pkgname}.desktop" ]; then
    install -Dm644 "${pkgname}.desktop" \
      "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  fi

  # Icon
  if [ -f "icons/${pkgname}.png" ]; then
    install -Dm644 "icons/${pkgname}.png" \
      "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  fi

  # Man page
  if [ -f "docs/${pkgname}.1" ]; then
    install -Dm644 "docs/${pkgname}.1" \
      "${pkgdir}/usr/share/man/man1/${pkgname}.1"
  fi
}
