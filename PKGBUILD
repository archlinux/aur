# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_Name="N64Recomp"
_pkgname="${_Name,,}"
pkgname="${_pkgname}-git"
pkgver=r88.989a86b
pkgrel=1
pkgdesc="Tool to statically recompile N64 games into native executables"
arch=('x86_64')
url="https://github.com/${_Name}/${_Name}"
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cmake>=3.20' 'git')
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
  [rabbitizer]=Decompollaborate
  [ELFIO]=serge1
  [fmt]=fmtlib
  [tomlplusplus]=marzer
  [sljit]=zherczeg
)

for repo in "${!_git_submodules[@]}"; do
  source+=("${repo}::git+https://github.com/${_git_submodules[$repo]}/${repo}.git")
done

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  git submodule init
  for repo in "${!_git_submodules[@]}"; do
    git config submodule."lib/${repo}".url "${srcdir}/${repo}"
  done
  git -c protocol.file.allow=always submodule update
}

pkgver() {
  cd "${srcdir}/${_pkgsrc}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
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
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  cd "build"
  for _bin in LiveRecompTest "${_Name}" OfflineModRecomp RecompModTool RSPRecomp; do
    install -vDm755 "${_bin}" "${pkgdir}/usr/bin/${_bin}"
  done
}
