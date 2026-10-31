# Maintainer: Alex Reinking <alex.reinking@gmail.com>
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Kyle Keen <keenerd@gmail.com>
_base=halide
pkgname=${_base}-bin
pkgver=22.1.0
pkgrel=1
pkgdesc="A language for fast and portable data-parallel computation"
url="https://github.com/${_base}/${_base/h/H}"
arch=('x86_64' 'aarch64')
license=(MIT)
depends=('glibc' 'libgcc' 'libstdc++' 'bash')
conflicts=("${_base}")
provides=("${_base}=${pkgver}")
options=('!strip' '!debug')

# Since Halide 22, the prebuilt C++ SDK (libHalide, autoschedulers, headers,
# CMake packages) is published to PyPI as the Python-independent halide-bin wheel.
_wheel="https://files.pythonhosted.org/packages/py3/h/${pkgname}/${pkgname/-/_}-${pkgver}-py3-none"
source_x86_64=("${_wheel}-manylinux_2_27_x86_64.manylinux_2_28_x86_64.whl")
source_aarch64=("${_wheel}-manylinux_2_27_aarch64.manylinux_2_28_aarch64.whl")
noextract=("${source_x86_64[@]##*/}" "${source_aarch64[@]##*/}")

sha256sums_x86_64=('fa445243347cf5e8fc4704718f5295f63184f4abd9d920d8a4ef80e2ce94d8d7')
sha256sums_aarch64=('3e74032d939ec7467e986d8104a304546e977f148f649f91b8c004953b24f667')

prepare() {
  rm -rf "${srcdir}/wheel"
  mkdir "${srcdir}/wheel"
  bsdtar -xf "${srcdir}/${pkgname/-/_}-${pkgver}"-*.whl -C "${srcdir}/wheel" "${_base}"

  # The wheel uses lib64/ and share/tools/; Arch uses lib/ and keeps the
  # tools where earlier versions of this package put them.
  cd "${srcdir}/wheel/${_base}"
  sed -i -e 's|/lib64/|/lib/|g' -e 's|/share/tools|/share/Halide/tools|g' lib64/cmake/*/*.cmake
}

package() {
  cd "${srcdir}/wheel/${_base}"

  install -Dvm755 bin/gengen -t "${pkgdir}/usr/bin"
  install -Dvm644 include/*.h -t "${pkgdir}/usr/include"
  install -Dvm755 lib64/lib*.so -t "${pkgdir}/usr/lib"
  install -Dvm644 lib64/libHalide_GenGen.a -t "${pkgdir}/usr/lib"

  for i in lib64/cmake/*/; do
    install -Dvm644 "${i}"* -t "${pkgdir}/usr/lib/cmake/$(basename "${i}")"
  done

  install -Dvm644 share/tools/* -t "${pkgdir}/usr/share/Halide/tools"
  chmod 755 "${pkgdir}"/usr/share/Halide/tools/*.sh

  install -dm755 "${pkgdir}/usr/share/doc/Halide"
  cp -r share/doc/Halide/. "${pkgdir}/usr/share/doc/Halide"
  install -Dvm644 share/doc/Halide/LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
