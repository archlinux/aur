# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgbase="openvibe"
pkgname=(
  "${pkgbase}-sdk"
  "${pkgbase}-designer"
  "${pkgbase}-extras"
)
pkgver=3.7.0
pkgrel=1
pkgdesc="Software platform dedicated to designing, testing, and using brain-computer interfaces"
arch=(
  'x86_64'
)
url="https://openvibe.inria.fr"
_url="https://gitlab.inria.fr/openvibe"
license=(
  'AGPL-3.0-or-later'
)
makedepends=(
  'boost>=1.71.0'
  'cmake>=3.20'
  'eigen3'
  'git'
  'gtest' # ?

  'boost-libs>=1.71.0'
  'cairo'
  'expat'
  'fftw'
  'freealut'
  'gdk-pixbuf2'
  'glib2'
  'gtk2'
  'itpp'
  'libglvnd'
  'liblsl'
  'libvorbis'
  'lua>=5.1'
  'openal'
  'pango'
  'tinyxml2'
  'vrpn'
  'xerces-c'
  'zlib'
)
_pkgsrc="${pkgbase}-meta"
source=(
  "${_pkgsrc}::git+${_url}/meta.git#tag=${pkgver}"
  "${pkgbase}-sdk::git+${_url}/sdk.git"
  "${pkgbase}-designer::git+${_url}/designer.git"
  "${pkgbase}-extras::git+${_url}/extras.git"
  "${pkgbase}_boost1.87_asio.patch"
  "${pkgbase}_boost1.88_filesystem.patch"
  "${pkgbase}_extras_mr341.patch" # ::${_url}/extras/-/merge_requests/341.patch"
  "${pkgbase}_cxx14_include_algorithm.patch"
  "${pkgbase}_cmake_vrpnserver.patch"
)
sha256sums=('bbce750c8a62bd4c0eb44b01d4155f89195f40dea6ac0c6ab76df74709524701'
            'SKIP'
            'SKIP'
            'SKIP'
            'ffd47c53688f13b2b2a5c71a98908dac124dc45c0332c7e2cfbfd443e47cfac5'
            '2cf96fc12c5a840e3d59cbbfc134b35b9b90277b64f4ecc45da469ab72443c72'
            '399768f4768730561d68abc756f5371f1d71ee076185f6325e250ca439f22c77'
            '48b322bfeed71fdca7951895b44d352ce9e99adcec9490d8288ed0a7ace079f6'
            '942683d0af5d5f403f46a972c468a1d9f5ac55c7aebfedcc86d34fd30c3a85ad')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  git submodule init
  git config submodule.sdk.url      "${srcdir}/${pkgbase}-sdk"
  git config submodule.designer.url "${srcdir}/${pkgbase}-designer"
  git config submodule.extras.url   "${srcdir}/${pkgbase}-extras"
  git -c protocol.file.allow=always submodule update

  patch -Np1 -i "${srcdir}/${pkgbase}_boost1.87_asio.patch" || true
  patch -Np1 -i "${srcdir}/${pkgbase}_boost1.88_filesystem.patch" || true
  patch -Np1 -i "${srcdir}/${pkgbase}_extras_mr341.patch" || true # -d "extras"
  patch -Np1 -i "${srcdir}/${pkgbase}_cxx14_include_algorithm.patch" || true
  patch -Np1 -i "${srcdir}/${pkgbase}_cmake_vrpnserver.patch" || true

  find . -type f -name 'CMakeLists.txt' -exec \
    sed -e 's/Boost::system//g' \
        -e 's/set(CMAKE_CXX_STANDARD 11/set(CMAKE_CXX_STANDARD 14/g' \
        -i "{}" +

  cd "CMake"
  sed -e 's/EXACT//g' \
      -i 'FindThirdPartyPython.cmake'
  sed -e 's/ system//g' \
      -i 'FindThirdPartyBoost.cmake'
}

build() {
  local cmake_options=(
    -B "${_pkgsrc}/build"
    -S "${_pkgsrc}"
    -G 'Unix Makefiles'
    -W no-dev
    # "No known build type defined!" ???
    -D CMAKE_BUILD_TYPE:STRING='Release' # None
    -D CMAKE_INSTALL_PREFIX:PATH='/usr'
    -D OpenGL_GL_PREFERENCE=GLVND
  )
  
  cd "${srcdir}"
  cmake "${cmake_options[@]}"
  cmake --build "${cmake_options[1]}"
}

# check() {
#   local ctest_exclude_regex=""
#   local ctest_options=(
#     --test-dir "${_pkgsrc}/build"
#     --output-on-failure
#     --parallel "$(nproc)"
#     --exclude-regex "${ctest_exclude_regex}"
#   )

#   cd "${srcdir}"
#   ctest "${ctest_options[@]}"
# }

package_openvibe-sdk() {
  depends=(
    'boost-libs>=1.71.0'
    'expat'
    'glibc'
    'libgcc'
    'libgomp'
    'libstdc++'
    'xerces-c'
  )

  cd "${srcdir}"
  DESTDIR="${pkgdir}" cmake --install "${_pkgsrc}/build/sdk"

  cd "${_pkgsrc}"
  install -vDm644 "CHANGELOG.md" "README.md" -t "${pkgdir}/usr/share/doc/${pkgbase}"
  install -vDm644 "COPYING" -t "${pkgdir}/usr/share/licenses/${pkgbase}"
}

package_openvibe-designer() {
  depends=(
    "${pkgbase}-sdk>=${pkgver}-${pkgrel}"
    'boost-libs>=1.71.0'
    'cairo'
    'gdk-pixbuf2'
    'glib2'
    'glibc'
    'gtk2'
    'libgcc'
    'libglvnd'
    'libstdc++'
    'pango'
    'tinyxml2'
    'zlib'
  )

  cd "${srcdir}"
  DESTDIR="${pkgdir}" cmake --install "${_pkgsrc}/build/designer"

  local tmpdir="$(mktemp -d)"
  DESTDIR="${tmpdir}" cmake --install "${_pkgsrc}/build/sdk"
  find . \( -type f -o -type l \) \
    -exec rm -f -- "${pkgdir}/{}" \;
  find . -depth -type d ! -path . \
    -exec rmdir --ignore-fail-on-non-empty -- "${pkgdir}/{}" \; 2>/dev/null
}

package_openvibe-extras() {
  depends=(
    "${pkgbase}-sdk>=${pkgver}-${pkgrel}"
    "${pkgbase}-designer>=${pkgver}-${pkgrel}"
    'bash'
    'boost-libs>=1.71.0'
    'cairo'
    'fftw'
    'freealut'
    'gdk-pixbuf2'
    'glib2'
    'glibc'
    'gtk2'
    'itpp'
    'libgcc'
    'libglvnd'
    'liblsl'
    'libstdc++'
    'libvorbis'
    'lua>=5.1'
    'openal'
    'pango'
    'python>=3.10'
    'python-matplotlib'
    'python-natsort'
    'python-numpy'
    'python-pandas'
    'python-pyriemann'
    'python-scikit-learn'
    'tinyxml2'
    'vrpn'
  )

  cd "${srcdir}"
  DESTDIR="${pkgdir}" cmake --install "${_pkgsrc}/build/extras"

  local tmpdir="$(mktemp -d)"
  DESTDIR="${tmpdir}" cmake --install "${_pkgsrc}/build/sdk"
  DESTDIR="${tmpdir}" cmake --install "${_pkgsrc}/build/designer"
  cd "${tmpdir}"
  find . \( -type f -o -type l \) \
    -exec rm -f -- "${pkgdir}/{}" \;
  find . -depth -type d ! -path . \
    -exec rmdir --ignore-fail-on-non-empty -- "${pkgdir}/{}" \; 2>/dev/null
}