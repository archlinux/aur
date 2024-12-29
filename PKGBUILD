# Maintainer: KorigamiK <korigamik@gmail.com>
_pkgname=sioyek
pkgname="${_pkgname}-devel"
pkgver=r1902.ed14e38
pkgrel=1
pkgdesc="A PDF viewer designed for reading research papers and technical books."
arch=("x86_64" "i686" "aarch64" "armv7h" "armv6h")
url="https://github.com/ahrm/sioyek"
license=("GPL3")
depends=(libmupdf qt6-speech qt6-declarative qt6-svg sqlite3 zlib)
optdepends=(qt6-wayland)
makedepends=("cmake" "git")
provides=("sioyek")
conflicts=("sioyek-git" "sioyek")
source=("git+https://github.com/ahrm/sioyek.git#branch=development")
sha512sums=("SKIP")

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S "${srcdir}/${_pkgname}" -DCMAKE_BUILD_TYPE=Release
  cmake --build build
}

package() {
  install -dm755 "${pkgdir}/usr/bin"
  install -dm755 "${pkgdir}/usr/share/${_pkgname}"
  install -dm755 "${pkgdir}/etc/${_pkgname}"
  install -dm755 "${pkgdir}/usr/share/applications"
  install -dm755 "${pkgdir}/usr/share/pixmaps/"

  install -Dm755 "build/sioyek" "${pkgdir}/usr/bin/sioyek"

  cd "${srcdir}/${_pkgname}"

  install -Dm644 "resources/sioyek.desktop" "${pkgdir}/usr/share/applications/sioyek.desktop"
  install -Dm644 "pdf_viewer/keys.config" "${pkgdir}/etc/${_pkgname}/keys.config"
  install -Dm644 "pdf_viewer/prefs.config" "${pkgdir}/etc/${_pkgname}/prefs.config"

  cp -r "pdf_viewer/shaders" "${pkgdir}/usr/share/${_pkgname}/"
  install -Dm644 "tutorial.pdf" "${pkgdir}/usr/share/${_pkgname}/tutorial.pdf"

  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "resources/sioyek-icon-linux.png" "${pkgdir}/usr/share/pixmaps/"

  # Install man page if it exists
  if [ -f "resources/sioyek.1" ]; then
    install -Dm644 "resources/sioyek.1" "${pkgdir}/usr/share/man/man1/sioyek.1"
  fi
}
