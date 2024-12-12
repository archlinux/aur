# Maintainer: badcast <lmecomposer@gmail.com>
_pkgbase="epic-piano-instrument"
pkgname=${_pkgbase}
pkgver=1.1.0
pkgrel=1
url="https://github.com/badcast/epic-piano-instrument"
pkgdesc="Epic Piano - The virtual instrument based on the RoninEngine framework that allows you to unleash your creative potential and craft music of epic proportions."
arch=(x86_64)
license=('GPLv3')
depends=('sdl2' 'sdl2_image' 'sdl2_ttf' 'sdl2_mixer')
makedepends=('cmake' 'gcc' 'make' 'pkgconf')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/v$pkgver.tar.gz"
        "git+https://github.com/badcast/ronin-engine.git#commit=b52a50bfdc1c43af5007c514994bc694e4a9cd1b"
        "${_pkgbase}.desktop"
        "${_pkgbase}-icon.png")
sha256sums=('349ae1df03c7dcd31df10b7b2b8f2de7f84b7f31a72fa4711b91f4535dd5657c'
         'SKIP'
         '8b0420f68a8fc61927d296f3c14dc7a45f9a4292f8cbca90053439911ff9f41f'
         '8434f3dfe581ff89f222b6eb6c8bc3f847c4e20bc2153ea6778d550899c15be4')

build(){
   build_dir="${srcdir}/build"
   cmake -S $_pkgbase-$pkgver -B "${build_dir}" -DBUILD_SHARED_LIBS=OFF -DCMAKE_BUILD_TYPE=Release -DRONIN_NO_CONFIG=ON -DUSE_SYSRONIN=OFF -DCMAKE_INSTALL_PREFIX=/usr
   cmake --build "${build_dir}"
}

package(){
   build_dir="${srcdir}/build"
   source_dir="${srcdir}/${_pkgbase}-$pkgver"
   DESTDIR="${pkgdir}" cmake --install "${build_dir}"
   chmod 755 "${pkgdir}/usr/bin/${_pkgbase}"
   install -Dm644 "$srcdir/${_pkgbase}.desktop" -t "${pkgdir}/usr/share/applications"
   install -Dm644 "$srcdir/${_pkgbase}-icon.png" -t "${pkgdir}/usr/share/icons"
   install -Dm644 "$source_dir/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgbase}/LICENSE"
}
