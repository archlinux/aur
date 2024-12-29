# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix
# Contributor: Michael DeGuzis <mdeguzis@gmail.com>

pkgname=play-emu
pkgver=0.68
pkgrel=2
pkgdesc="Play! is an experimental Playstation 2 emulator."
arch=(x86_64)
url="https://purei.org/"
license=(MIT)
depends=(qt6-base openal glew

         # namcap implicit depends
         hicolor-icon-theme sqlite libglvnd bzip2 curl openssl libevdev glibc icu zlib)
makedepends=(git cmake ninja nlohmann-json)
source=("${pkgname%-git}::git+https://github.com/jpd002/Play-.git#tag=${pkgver}"
        0001-Add-missing-include-cstring-in-NamcoSys147-NANDReade.patch
        play-emu_profiler_build_fix.patch::https://github.com/jpd002/Play-/commit/4403687dc8d505911980b8a96b13701a10f91b70.patch
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
sha256sums=('09c8663ecc614cefcd88b37676ff32769660b6b7bf97b29f274c19375a0eb136'
            '01460ec361c1a6a4329b8bdcfc544a3439fa062e515b055b06124ea521523643'
            '470dda423c66f2d95c5d6e8977aba8ac27313649e47a0fb7f4490d62a0c38027'
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

prepare () {
  cd "play-emu"

  patch -Np1 -i ../0001-Add-missing-include-cstring-in-NamcoSys147-NANDReade.patch
  patch -Np1 -i ../play-emu_profiler_build_fix.patch

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
