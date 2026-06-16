# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Maintainer: Patrik Plihal <patrik dot plihal at gmail dot com>

_pkgname=RadeonDeveloperToolSuite-2026-05-28-1806
pkgname=radeon-gpu-profiler
pkgver=2.7.0
pkgrel=1
pkgdesc='A suite of GUI applications that provide detailed low-level information on Radeon GPUs. (rgp, rga)'
arch=(x86_64)
url='https://gpuopen.com/rgp/'
license=('MIT')
depends=(
  brotli
  gcc-libs
  glibc
  sh
  zlib
)
options=(!debug !strip)
source=("https://gpuopen.com/download/${_pkgname}.tgz")
noextract=("${_pkgname}.tgz")
sha256sums=('SKIP')
install=radeon-gpu-profiler.install

prepare() {
  _fullpath=$(readlink -f "${_pkgname}.tgz" 2>&1)
  if (file "${_fullpath}" | grep gzip); then
    echo 'Source file is .tar.gz'
    bsdtar xzf "${_fullpath}"
  else
    echo 'Source file is .tar.gz.zip'
    gunzip --keep --force -c "${_fullpath}" >./${_pkgname}.tar.gz
    bsdtar xzf "${_pkgname}.tar.gz"
  fi
}

package() {
  # copy to opt
  mkdir -p "${pkgdir}/opt/"
  cp -r "${_pkgname}/" "${pkgdir}/opt/${pkgname}/"

  mkdir -p "${pkgdir}/usr/bin/"

  # create launcher scripts
  # (prepended with QT_QPA_PLATFORM= for wayland compat)

  local binaries=(
    RadeonDeveloperPanel
    RadeonGPUAnalyzer
    RadeonGPUProfiler
    RadeonMemoryVisualizer
    RadeonRaytracingAnalyzer
  )

  for _binary in "${binaries[@]}"; do
    cat >"${pkgdir}/usr/bin/${_binary}" <<EOF
#!/usr/bin/env sh
export LD_LIBRARY_PATH=/opt/${pkgname}/lib/
export QT_QPA_PLATFORM=
exec /opt/${pkgname}/${_binary}
EOF

    chmod 0755 "${pkgdir}/usr/bin/${_binary}"
  done

  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "/opt/${pkgname}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  ln -s "/opt/${pkgname}/EULA.txt" "${pkgdir}/usr/share/licenses/${pkgname}/EULA"
}
