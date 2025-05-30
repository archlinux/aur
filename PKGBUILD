# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

_realname=cppwinrt
pkgname=mingw-w64-${_realname}
pkgver=2.0.250303.1
_windows_rs_ver=65
pkgrel=1
arch=('any')
pkgdesc='C++ language projection for Windows Runtime (WinRT) APIs (mingw-w64)'
url='https://aka.ms/cppwinrt'
license=('spdx:MIT')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-gcc' 'mingw-w64-cmake' 'mingw-w64-wine' 'ninja' 'git')
source=("https://github.com/microsoft/cppwinrt/archive/${pkgver}/${_realname}-${pkgver}.tar.gz"
        "https://github.com/microsoft/windows-rs/archive/${_windows_rs_ver}/windows-rs-${_windows_rs_ver}.tar.gz")
sha256sums=('da75b7047f4615a3db582ed8c75ee327f228b05bb47750621593594d2d0459e1'
            'f044c5046fd32745bef1fa43b27db1977b0f4f2be615b65f69ef7c4a8ed61b3a')
options=(!buildflags staticlibs !strip !emptydirs)

_architectures=('i686-w64-mingw32' 'x86_64-w64-mingw32')

build() {
  cd ${_realname}-${pkgver}
  for _arch in "${_architectures[@]}"; do
    mkdir -p "build-${_arch}" && pushd "build-${_arch}"
    # build cppwinrt.exe
    ${_arch}-cmake \
      -G Ninja \
      -DCMAKE_BUILD_TYPE:STRING='Release' \
      -DCMAKE_INSTALL_PREFIX="/usr/${_arch}" \
      -DCPPWINRT_BUILD_VERSION="${pkgver}" \
      -DBUILD_TESTING=OFF \
      ../
    cmake --build .

    # add Windows metadata
    # note: The metadata comes from https://github.com/microsoft/win32metadata. However, at this point
    # this build script cannot make use of that. Instead, one has to just point it to the metadata files
    # usually found under C:/Windows/System32/WinMetadata via the WIN_METADATA environment variable.
    input=()
    if [[ -d $WIN_METADATA ]]; then
      ln -s "$WIN_METADATA" win-metadata
      input+=(-input win-metadata)
    else
      echo "You need to provide metadata files usually found under C:/Windows/System32/WinMetadata on a
Windows system and point this build script to it via the WIN_METADATA environment variable.
Otherwise this package will not contain all headers that are required by e.g. Qt 6."
    fi

    # add rust metadata provided by https://github.com/microsoft/windows-rs
    echo "SPDX-License-Identifier: MIT OR Apache-2.0
SPDX-FileCopyrightText: Copyright (c) Microsoft Corporation

Generated using .winmd files from https://github.com/microsoft/windows-rs
" > license.txt
    ln -s "${srcdir}/windows-rs-${_windows_rs_ver}/crates/libs/bindgen/default" rust-metadata
    input+=(-license license.txt -input rust-metadata)

    # generate headers using cppwinrt.exe
    ${_arch}-wine cppwinrt.exe "${input[@]}" -output "output"
    popd
  done
}

package() {
  cd ${_realname}-${pkgver}
  for _arch in "${_architectures[@]}"; do
    pushd "build-${_arch}"
    DESTDIR="${pkgdir}" cmake --install .
    mkdir "${pkgdir}/usr/${_arch}/include"
    cp -vr --target-directory="${pkgdir}/usr/${_arch}/include" output/*
    ${_arch}-strip --strip-all "$pkgdir"/usr/${_arch}/bin/*.exe
    popd
  done

  install -Dm644 "${srcdir}/${_realname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
