# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_Name="XenonRecomp"
_pkgname="${_Name,,}"
pkgname="${_pkgname}-git"
pkgver=r165.04e7161
pkgrel=2
pkgdesc="A tool for recompiling Xbox 360 games to native executables"
arch=('x86_64')
url="https://github.com/hedge-dev/${_Name}"
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('clang>=18' 'cmake>=3.20' 'git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_Name}"
source=("${_pkgsrc}::git+${url}.git")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

declare -rAg _git_submodules=(
  [xxHash]=Cyan4973
  [fmt]=fmtlib
  [tomlplusplus]=marzer
  [libmspack]=kyz
  [tiny-AES-c]=kokke
)

for repo in "${!_git_submodules[@]}"; do
  source+=("${repo}::git+https://github.com/${_git_submodules[$repo]}/${repo}.git")
done

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  git submodule init
  for repo in "${!_git_submodules[@]}"; do
    git config submodule."thirdparty/${repo}".url "${srcdir}/${repo}"
  done
  git -c protocol.file.allow=always submodule update

  # echo 'set(INSTALL_TO_SYSTEM FALSE)' >> "thirdparty/CMakeLists.txt"
}

pkgver() {
  cd "${srcdir}/${_pkgsrc}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  export CC="clang"
  export CXX="clang++"
  local cmake_options=(
    -G 'Unix Makefiles' \
    -B "${_pkgsrc}/build" \
    -S "${_pkgsrc}" \
    -DCMAKE_BUILD_TYPE:STRING='None' \
    -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
    -Wno-dev
  )

  cd "${srcdir}"
  cmake "${cmake_options[@]}"
  cmake --build "${_pkgsrc}/build"
}

package() {
  cd "${srcdir}"
  # DESTDIR="${pkgdir}" cmake --install "${_pkgsrc}/build"

  cd "${_pkgsrc}"
  install -vDm644 "README.md"  "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.md"

  cd "build"
  install -vDm755 "${_Name}/${_Name}"         "${pkgdir}/usr/bin/${_Name}"
  install -vDm755 "XenonAnalyse/XenonAnalyse" "${pkgdir}/usr/bin/XenonAnalyse"
}
