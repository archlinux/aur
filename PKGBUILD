# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix
# Contributor: Michael DeGuzis <mdeguzis@gmail.com>

pkgname=play-emu-git
pkgver=0.59.r52.g8e1cc18b
pkgrel=2
pkgdesc="Play! is an experimental Playstation 2 emulator."
arch=(x86_64)
url="https://purei.org/"
license=(MIT)
depends=(qt5-base qt5-x11extras openal glew)
makedepends=(git cmake ninja nlohmann-json)
source=("${pkgname%-git}::git+https://github.com/jpd002/Play-.git"
        "git+https://github.com/jpd002/Play-Dependencies.git"
        "git+https://github.com/jpd002/Play--Framework.git"
        "git+https://github.com/jpd002/Play--CodeGen.git"
        "git+https://github.com/jpd002/Nuanceur.git"
        "git+https://github.com/jpd002/libchdr.git"
        "git+https://github.com/jpd002/AltKit.git"
        "git+https://github.com/rs/SDWebImage.git"
        "git+https://github.com/gulrak/filesystem.git"
        "git+https://github.com/facebook/zstd.git"
        "git+https://github.com/Cyan4973/xxHash.git")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare () {
  cd "${pkgname%-git}"

  git submodule init
  git config 'submodule.deps/Dependencies.url' "${srcdir}/Play-Dependencies"
  git config 'submodule.deps/Framework.url' "${srcdir}/Play--Framework"
  git config 'submodule.deps/CodeGen.url' "${srcdir}/Play--CodeGen"
  git config 'submodule.deps/Nuanceur.url' "${srcdir}/Nuanceur"
  git config 'submodule.deps/libchdr.url' "${srcdir}/libchdr"
  git config 'submodule.deps/AltKit.url' "${srcdir}/AltKit"
  git -c protocol.file.allow=always submodule update

  install -d build

  cd "${srcdir}/${pkgname%-git}"/deps/Dependencies

  git submodule init
  git config 'submodule.SDWebImage.url' "${srcdir}/SDWebImage"
  git config 'submodule.ghc_filesystem.url' "${srcdir}/filesystem"
  git config 'submodule.zstd.url' "${srcdir}/zstd"
  git config 'submodule.xxHash.url' "${srcdir}/xxHash"
  git -c protocol.file.allow=always submodule update
}

build() {
  cd "${pkgname%-git}/build"
  cmake .. -Wno-dev -G"Ninja"
  cmake --build . --config Release
}

package() {
  cd "${pkgname%-git}"
  install -Dm755 build/Source/ui_qt/Play    "${pkgdir}"/usr/bin/play-emu
  install -D icons/icon.svg                 "${pkgdir}"/usr/share/pixmaps/play.svg
  install -D installer_unix/org.purei.Play.desktop -t "${pkgdir}"/usr/share/applications/
  install -D License.txt                    "${pkgdir}/usr/share/licenses/${pkgname}"/License.txt
}
