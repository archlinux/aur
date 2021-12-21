#!/hint/bash
# Maintainer: bartus <'arch-user-repo' at the domain 'bartus.33mail.com'>
# Co-Maintainer: Lahfa Samy (AkechiShiro) <'akechishiro-aur' at the domain 'lahfa.xyz'>
# Contributor: Aaron McDaniel (mcd1992) <'aur' at the domain 'fgthou.se'>

# Configuration:
# Use: makepkg VAR1=0 VAR2=1 to enable(1) disable(0) a feature
# Use: {yay,paru} --mflags=VAR1=0,VAR2=1
# Use: aurutils --margs=VAR1=0,VAR2=1
# Use: VAR1=0 VAR2=1 pamac

# Use FRAGMENT={commit,tag,brach}=xxx for bisect build
_fragment=#${FRAGMENT:-branch=dev}

# Use CMAKE_FLAGS=xxx:yyy:zzz to define extra CMake flags
[[ -v CMAKE_FLAGS ]] && mapfile -t -d: _CMAKE_FLAGS < <(echo -n "$CMAKE_FLAGS")

# Use DISABLE_BUNDLED_RIZIN=1 to build against external rizin package
((DISABLE_BUNDLED_RIZIN)) && _bundle_rizin=OFF || _bundle_rizin=ON

_name=cutter
pkgname=rz-${_name}-git
pkgver=2.0.4.r47.gbdeacabf
pkgrel=1
pkgdesc="A Qt and C++ GUI for rizin reverse engineering framework (originally named Iaito)"
url="https://cutter.re/"
arch=('i686' 'x86_64')
license=('GPL')
depends+=('capstone' 'qt5-base' 'qt5-svg' 'qt5-webengine' 'icu' 'python' 'pyside2'
          'python-shiboken2' 'graphviz' 'gcc-libs' 'syntax-highlighting')
((DISABLE_BUNDLED_RIZIN)) && depends+=('rizin=0.3.1')
makedepends=('git' 'cmake' 'ninja' 'shiboken2' 'qt5-tools' 'meson')
provides+=('rz-cutter')
conflicts+=('rz-cutter')
optdepends=('rz-ghidra: ghidra decompiler plugin')
source+=("cutter::git+https://github.com/rizinorg/cutter${_fragment}"
        "git+https://github.com/rizinorg/cutter-translations")
sha512sums+=('SKIP'
            'SKIP')
b2sums+=('SKIP'
        'SKIP')
((DISABLE_BUNDLED_RIZIN)) || {
	source+=("rizin::git+https://github.com/rizinorg/rizin")
	sha512sums+=('SKIP')
	b2sums+=('SKIP')
	conflicts+=('rizin')
	provides+=("rizin=0.3.1")
}

pkgver() {
  # Remove 'v' prefix on tags; prefix revision with 'r'; replace all '-' with '.'
  git -C ${_name} describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  git -C ${_name} config 'submodule.src/translations.url' "${srcdir}/${_name}-translations"
  git -C ${_name} submodule update --init src/translations
  ((DISABLE_BUNDLED_RIZIN)) || {
    git -C ${_name} config submodule.rizin.url "$srcdir/rizin"
    git -C ${_name} submodule update --init rizin
  }
}

build() {
  _CMAKE_FLAGS+=(
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DCUTTER_ENABLE_PYTHON:BOOL=ON \
    -DCUTTER_ENABLE_PYTHON_BINDINGS:BOOL=ON \
    -DCUTTER_USE_ADDITIONAL_RIZIN_PATHS:BOOL=OFF \
    -DCUTTER_ENABLE_CRASH_REPORTS:BOOL=OFF \
    -DCUTTER_ENABLE_GRAPHVIZ:BOOL=ON
    -DCUTTER_USE_BUNDLED_RIZIN=$_bundle_rizin
  )
  cmake -S ${_name} -B build -G Ninja "${_CMAKE_FLAGS[@]}" # --debug-find
# shellcheck disable=SC2086 # allow MAKEFLAGS to carry multiple flags
  ninja -C build ${MAKEFLAGS:--j1}
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
  install -d "${pkgdir}/usr/share/doc/${pkgname}"
  cp -a "${srcdir}"/${_name}/docs/* "${pkgdir}/usr/share/doc/${pkgname}"
}
