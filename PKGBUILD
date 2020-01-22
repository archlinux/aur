# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=gfxbench
pkgver=4.0.13
pkgrel=5
pkgdesc="Unified graphics benchmark based on DXBenchmark (DirectX) and GLBenchmark (OpenGL ES)"
url='https://gfxbench.com/'
arch=('i686' 'x86_64')
license=('custom')
depends=('libpng12' 'qt5-base' 'icu')
_basename="gfxbench_gl-linux-qt-${pkgver}+community"
source_i686=(  "${_basename}.sh::https://gfxbench.com/download/${_basename}_32bit.sh")
source_x86_64=("${_basename}.sh::https://gfxbench.com/download/${_basename}_64bit.sh")
sha1sums_i686=(  'dfbcd1deeeb3a21cd79738c30d535f08ebfdac6c')
sha1sums_x86_64=('c5740e8a36169c2210fe94185d0b8db8cb757ffb')

package() {
  cd "${srcdir}"

  # Script modifies the running user's files; prevent that by redirecting $HOME
  export HOME=$PWD

  install -dm755 "${pkgdir}"/opt/"${pkgname}"
  sh "${_basename}".sh \
    --skip-license \
    --prefix="${pkgdir}"/opt/"${pkgname}"

  chown root: -R "${pkgdir}"/opt/"${pkgname}"/

  install -dm755 "${pkgdir}"/usr/bin
  ln -s /opt/"${pkgname}"/gfxbench_gl "${pkgdir}"/usr/bin/"${pkgname}"

  install -dm755 "${pkgdir}"/usr/share/licenses/"${pkgname}"
  mv "${pkgdir}"/opt/"${pkgname}"/copyright "${pkgdir}"/usr/share/licenses/"${pkgname}"

  install -Dm644 -t "${pkgdir}"/usr/share/applications/ "${pkgdir}"/opt/"${pkgname}"/gfxbench_gl.desktop
  rm "${pkgdir}"/opt/"${pkgname}"/gfxbench_gl.desktop

  install -Dm644 -t "${pkgdir}"/usr/share/icons/hicolor/128x128/apps/ "${pkgdir}"/opt/"${pkgname}"/gfxbench_gl.png
  rm "${pkgdir}"/opt/"${pkgname}"/gfxbench_gl.png

  # Fix path
  sed -i "s#${pkgdir}##" "${pkgdir}"/usr/share/applications/gfxbench_gl.desktop
  sed -i 's#^Icon=.*$#Icon=/usr/share/icons/hicolor/128x128/apps/gfxbench_gl.png#' \
    "${pkgdir}"/usr/share/applications/gfxbench_gl.desktop

  # Remove unnecessary local copies of libs
  rm "${pkgdir}"/opt/"${pkgname}"/libQt5*
  rm "${pkgdir}"/opt/"${pkgname}"/libicu*
  rm -r "${pkgdir}"/opt/"${pkgname}"/platforms/
  rm -r "${pkgdir}"/opt/"${pkgname}"/xcbglintegrations/

  # Remove start script, since we're not using the local libs anymore
  rm "${pkgdir}"/opt/"${pkgname}"/start.sh
}
