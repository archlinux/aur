# Maintainer: Adrià Cabello <adro.cc79 at protonmail dot com>
pkgname=xstudio
pkgver=0.11.2
pkgrel=2
pkgdesc="Media playback and review application designed for professionals working in the film and TV post production industries."
arch=('x86_64')
url="https://materialx.org/"
license=('Apache')
depends+=(cmake
		opencolorio
		spdlog
		actor-framework
		opencolorio
		openexr
		python-sphinx_rtd_theme
		pybind11
		qt5-base
		qt5-graphicaleffects
		qt5-quickcontrols
		qt5-declarative
		qt5-tools
		python-breathe
		ffmpeg
		opentimelineio
		taglib
		nlohmann-json
		)
provides=('xstudio')
source=(git+"https://github.com/AcademySoftwareFoundation/${pkgname}.git"
        "xstudio.desktop"
        "xstudio.patch"
        "x-xst.xml")
md5sums=('SKIP'
         '9071c306cfb8b02d8a50bdec53967880'
         '46b80d5f8068cc9ab0493dfc104ea667'
         '34fa339cf9ec1ea6d5f86ed814884a93')

prepare () {
  patch --directory="${srcdir}"/${pkgname} --forward --strip=1 --input="${srcdir}/../xstudio.patch"
}

build() {
#   export CC=clang
#   export CXX=clang++

  _CMAKE_FLAGS+=(
    -DCMAKE_INSTALL_PREFIX:PATH=/opt/${pkgname}
    -DBUILD_DOCS=ON
  )
  
  cmake -S ${pkgname} -B build -G Ninja "${_CMAKE_FLAGS[@]}"

  ninja -C build ${MAKEFLAGS:--j12}
}

package() {
  install -d ${pkgdir}/opt
  install -d ${pkgdir}/usr/bin
  install -d ${pkgdir}/usr/share/icons/hicolor/256x256/apps
  install -d ${pkgdir}/usr/share/applications
  install -d ${pkgdir}/usr/share/mime/image
  install -d ${pkgdir}/usr/share/licenses/${pkgname}

  cp -r "${srcdir}"/build/bin "${pkgdir}"/opt/${pkgname}

  ln -s /opt/${pkgname}/${pkgname}.bin ${pkgdir}/usr/bin/${pkgname}

  cp "${srcdir}"/${pkgname}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  cp "${srcdir}"/${pkgname}/NOTICE.TXT ${pkgdir}/usr/share/licenses/${pkgname}/NOTICE

  cp "${srcdir}"/${pkgname}/ui/qml/${pkgname}/images/${pkgname}_logo_256_v1.svg ${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname}.svg
  cp "${srcdir}"/${pkgname}.desktop ${pkgdir}/usr/share/applications/
  cp "${srcdir}"/x-xst.xml ${pkgdir}/usr/share/mime/image

  chrpath --delete "${pkgdir}"/opt/${pkgname}/lib/*.so
  chrpath --delete "${pkgdir}"/opt/${pkgname}/plugin/*.so
  chrpath --delete "${pkgdir}"/opt/${pkgname}/xstudio.bin
}
