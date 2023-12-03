# Maintainer : MorsMortium <morsmortium@disroot.org>

_pkgname=dry
pkgname=${_pkgname}-git
pkgver=r182.a55f089
pkgrel=1
pkgdesc='Dry – a bare bones fork of Urho3D – is a FOSS cross-platform 2D and 3D game engine implemented in C++'
arch=('x86_64')
url="https://gitlab.com/luckeyproductions/${_pkgname}"
license=('MIT')
depends=('xorg-server')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
makedepends=('git' 'cmake' 'bash')
sha512sums=('SKIP')
source=("${pkgname}::git+${url}.git")

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}"
  ./script/cmake_generic.sh ./ -D VIDEO_WAYLAND=OFF -D DRY_SAMPLES=0
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  mkdir -p ${pkgdir}/opt/dry
  cp -R "${srcdir}/${pkgname}/." ${pkgdir}/opt/dry/

  rm -r ${pkgdir}/opt/dry/Docs ${pkgdir}/opt/dry/script \
    ${pkgdir}/opt/dry/CMake ${pkgdir}/opt/dry/CMakeCache.txt \
    ${pkgdir}/opt/dry/quick.sh ${pkgdir}/opt/dry/.git* \

  find ${pkgdir}/opt/dry -name "*.cmake" -type f -delete
  find ${pkgdir}/opt/dry -name "*.c" -type f -delete
  find ${pkgdir}/opt/dry -name "*.cpp" -type f -delete
  find ${pkgdir}/opt/dry -name "Makefile" -type f -delete
  find ${pkgdir}/opt/dry -name "CMakeFiles" -type d -exec rm -r {} +
  find ${pkgdir}/opt/dry -name "CMakeLists.txt" -type f -delete

  for File in $(find ${pkgdir}/opt/dry/include/Dry)
  do
    if [ -L "$File" ]
    then
      if [ -d "$File" ]
      then
        RealPath=`realpath "$File"`
        rm $File
        mkdir $File
        mv "$RealPath"/* "$File"/
      else
        if [[ $File == */opt/dry/include/Dry/ThirdParty/SDL/SDL_config.h ]]
        then
          rm "$File"
          ln -s ./generated/SDL_config.h "$File"
        else
          mv `realpath "$File"` "$File"
        fi
      fi
    fi
  done

  rm -r ${pkgdir}/opt/dry/Source
}
