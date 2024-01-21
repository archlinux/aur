# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: CrocoDuck <crocoduck dot oducks at gmail dot com>
pkgname=gmsh-bin
pkgver=4.12.2
pkgrel=1
pkgdesc="An three-dimensional finite element mesh generator with built-in pre- and post-processing facilities (includes SDK)"
arch=(x86_64)
url="https://gmsh.info"
license=(GPL2)
depends=(libxft libxinerama libxcursor glu)
makedepends=(gendesk chrpath)
optdepends=('python: for gmsh.py'
  'python-numpy: for gmsh.py'
  'julia: for gmsh.jl'
  'man-db: manual pages for gmsh')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=(${url}/bin/Linux/${pkgname%-*}-${pkgver}-Linux64-sdk.tgz)
sha512sums=('41ad403bcda3b971836039f0a1e55eee148d57147e552c9d310757962990a1a436f7b0469e4798cf75ef9ec15e7800ee54cb457236f53db98e0fd7ee603c62b0')

prepare() {
  # Set Icon and Launcher:
  cp "${srcdir}/${pkgname%-*}-${pkgver}-Linux64-sdk/share/doc/${pkgname%-*}/tutorials/t4_image.png" "${srcdir}/gmsh_icon.png"
  gendesk -f -n --pkgname "${pkgname}" --pkgdesc "${pkgdesc}" --name=${pkgname%-*} --exec=${pkgname%-*} --categories 'Education;Science;Math;'
  # Strip RPATH from binaries:
  chrpath -d "${srcdir}/${pkgname%-*}-${pkgver}-Linux64-sdk/bin/gmsh"
  chrpath -d "${srcdir}/${pkgname%-*}-${pkgver}-Linux64-sdk/lib/libgmsh.so.${pkgver}"
}

package() {
  # Program Files
  cd "${srcdir}/${pkgname%-*}-${pkgver}-Linux64-sdk/bin"
  for file in *; do
    install -Dm 755 "$file" "${pkgdir}/usr/bin/$file"
  done
  # Include
  cd "${srcdir}/${pkgname%-*}-${pkgver}-Linux64-sdk/include"
  for file in *; do
    install -Dm 644 "$file" "${pkgdir}/usr/include/$file"
  done
  # Lib
  cp -a "${srcdir}/${pkgname%-*}-${pkgver}-Linux64-sdk/lib/" "${pkgdir}/usr/lib/"
  # Docs:
  cd "$srcdir"
  mkdir -p "${pkgdir}/usr/share/doc"
  cp -r "${srcdir}/${pkgname%-*}-${pkgver}-Linux64-sdk/share/doc/${pkgname%-*}" "${pkgdir}/usr/share/doc/${pkgname%-*}"
  # Man
  cd "$srcdir"
  install -D "${srcdir}/${pkgname%-*}-${pkgver}-Linux64-sdk/share/man/man1/${pkgname%-*}.1" "${pkgdir}/usr/share/man/man1/${pkgname%-*}.1"
  # Launcher
  install -Dm 644 "${srcdir}/gmsh_icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-}.png"
  install -Dm 644 "${srcdir}/${pkgname%-*}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-*}.desktop"

  # Bindings for Python, Julia
  install -D -m644 "${pkgdir}/usr/lib/gmsh.py" "${pkgdir}/usr/share/gmsh/api/python/gmsh.py"
  install -D -m644 "${pkgdir}/usr/lib/gmsh.jl" "${pkgdir}/usr/share/gmsh/api/julia/gmsh.jl"
  rm -f "${pkgdir}/usr/lib/gmsh.py" "${pkgdir}/usr/lib/gmsh.jl"
  install -d "${pkgdir}/etc/profile.d"
  echo 'export PYTHONPATH="/usr/share/gmsh/api/python:$PYTHONPATH"' >>"${pkgdir}"/etc/profile.d/gmsh.sh
  echo 'export JULIA_LOAD_PATH="/usr/share/gmsh/api/julia:$JULIA_LOAD_PATH"' >>"${pkgdir}/etc/profile.d/gmsh.sh"
}
