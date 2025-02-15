# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix
# Contributor: Michael DeGuzis <mdeguzis@gmail.com>

pkgname=play-emu-git
pkgver=0.69.r21.g0c426757c
pkgrel=2
pkgdesc="Play! is an experimental Playstation 2 emulator"
arch=(x86_64)
url="https://purei.org/"
license=(MIT)
depends=(qt6-base openal glew

         # namcap implicit depends
         hicolor-icon-theme sqlite libglvnd bzip2 curl openssl libevdev glibc icu zlib)
makedepends=(git cmake ninja nlohmann-json vulkan-icd-loader)
optdepends=('vulkan-driver: packaged vulkan driver')
provides=(play-emu)
conflicts=(play-emu)
source=("play-emu::git+https://github.com/jpd002/Play-.git"
        "git+https://github.com/jpd002/Play-Dependencies.git"
        "git+https://github.com/jpd002/Play--Framework.git"
        "git+https://github.com/jpd002/Play--CodeGen.git"
        "git+https://github.com/jpd002/Nuanceur.git"
        "play-emu-libchdr::git+https://github.com/jpd002/libchdr.git"
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
  cd "play-emu"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare () {
  cd "play-emu"
  git submodule init
  git config 'submodule.deps/Dependencies.url' "${srcdir}/Play-Dependencies"
  git config 'submodule.deps/Framework.url' "${srcdir}/Play--Framework"
  git config 'submodule.deps/CodeGen.url' "${srcdir}/Play--CodeGen"
  git config 'submodule.deps/Nuanceur.url' "${srcdir}/Nuanceur"
  git config 'submodule.deps/libchdr.url' "${srcdir}/play-emu-libchdr"
  git config 'submodule.deps/AltKit.url' "${srcdir}/AltKit"
  git -c protocol.file.allow=always submodule update

  cd deps/Dependencies
  git submodule init
  git config 'submodule.SDWebImage.url' "${srcdir}/SDWebImage"
  git config 'submodule.ghc_filesystem.url' "${srcdir}/filesystem"
  git config 'submodule.zstd.url' "${srcdir}/zstd"
  git config 'submodule.xxHash.url' "${srcdir}/xxHash"
  git -c protocol.file.allow=always submodule update
}

build() {
  local _flags=(
    -DWITH_SYSTEM_ZLIB=ON
  )

  cmake -B build -S "play-emu" -Wno-dev \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    "${_flags[@]}"

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  install -D play-emu/License.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
