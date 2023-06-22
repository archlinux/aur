# Maintainer: robertfoster
# Contributor: LIN Rs <LinRs[d]users.noreply.github.com>
# Contributor: yochananmarqos <mark.wagie at tutanota dot com>

pkgbase=devilutionx
pkgname=("${pkgbase}" "${pkgbase}-fonts" "${pkgbase}-voices")
pkgver=1.5.0
pkgrel=3
pkgdesc="Diablo devolved for linux"
arch=('armv6h' 'armv7h' 'arm' 'aarch64' 'i686' 'x86_64')
url="https://github.com/diasurgical/devilutionX"
license=('custom:unlicense')
depends=('bzip2' 'fmt' 'libpng' 'libsodium' 'sdl2' 'sdl2_image' 'simpleini' 'zlib')
makedepends=('cmake' 'devilutionx-graphics-tools-git' 'flac' 'gettext' 'git' 'lame' 'ninja' 'smpq')
options=('strip')
source=("${url}/releases/download/${pkgver}/devilutionx-src.tar.xz"
  "${url}-assets/releases/download/v3/fonts.mpq"
  "${url}-assets/releases/download/v3/pl.mpq"
  "${url}-assets/releases/download/v3/ru.mpq"
)

build() {
  cmake -S "${pkgbase}-src-${pkgver}" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DBUILD_TESTING=off \
    -DCPACK=ON \
    -Bbuild

  cmake --build build -j $(getconf _NPROCESSORS_ONLN)
}

package_devilutionx() {
  pkgdesc="Diablo devolved for linux (main package)"
  install="${pkgbase}".install
  optdepends=("${pkgbase}-fonts" "${pkgbase}-voices")

  cd build
  DESTDIR="${pkgdir}" \
    cmake --install .
}

package_devilutionx-voices() {
  pkgdesc="Additional voices for DevilutionX"
  depends=("${pkgbase}")

  install -Dm644 pl.mpq \
    "${pkgdir}/usr/share/diasurgical/devilutionx/pl.mpq"
  install -Dm644 ru.mpq \
    "${pkgdir}/usr/share/diasurgical/devilutionx/ru.mpq"
}

package_devilutionx-fonts() {
  pkgdesc="Additional fonts for DevilutionX"
  depends=("${pkgbase}")

  install -Dm644 fonts.mpq \
    "${pkgdir}/usr/share/diasurgical/devilutionx/fonts.mpq"
}

sha256sums=('425e63891792c4ab213865f8e1b4401317439bf47450f18064ee72ebf9a2abf8'
            '6b62e03c42ae4427055e0f292a1beafb5e840c397adaf1f641b909be37b8653e'
            'b78c058a51733d9a0513c3cc535312b00a2bdff8ad0efac75971104c9ae11f41'
            '01749f4c4009b93bb1bb40e2ee09dba409fa37501da32bdb0b468146e56c9689')
