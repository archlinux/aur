# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgbase="diplib"
pkgname=(
  "${pkgbase}"
  "dipviewer"
  "java-${pkgbase}"
  "python-${pkgbase}"
)
pkgver=3.6.0
pkgrel=1
pkgdesc="Quantitative Image Analysis in C++, MATLAB, and Python"
arch=(
  'x86_64'
)
url="https://diplib.org"
_url="https://github.com/DIPlib/${pkgbase}"
license=(
  'Apache-2.0'
)
makedepends=(
  'cmake>=3.12'
  'freeglut'
  'glfw'
  'java-environment'
  'libglvnd'
  'python>=3.8'
  'python-build'
  'python-installer'
  'python-setuptools'
  'pybind11'
)
_pkgsrc="${_url##*/}-${pkgver}"
source=(
  "${_url}/archive/refs/tags/${pkgver}/${_pkgsrc}.tar.gz"
)
b2sums=('453b133e071e521a7b017f87ca332f81dd8e18cdee43181b24ce993cc9e5e97930a1415fc466587ef374417890da7b6ff3c1039ce4e8161bab4c32a84b1b70e1')

build() {
  local cmake_options=(
    -B "${_pkgsrc}/build"
    -S "${_pkgsrc}"
    -G 'Unix Makefiles'
    -W no-dev
    -D CMAKE_BUILD_TYPE:STRING='None'
    -D CMAKE_INSTALL_PREFIX:PATH='/usr'
    -D OpenGL_GL_PREFERENCE=GLVND
    -D DIP_BUILD_DIPIMAGE:BOOL=OFF # disable MATLAB bindings
  )
  
  cd "${srcdir}"
  cmake "${cmake_options[@]}"
  cmake --build "${cmake_options[1]}"
  # generate "${cmake_options[1]}/pydip/wheel.txt"
  cmake --build "${cmake_options[1]}" --target pip_install
}

# check() {
#   cd "${srcdir}"
#   cmake --build "${_pkgsrc}/build" --target check
# }

package_diplib() {
  depends=(
    'glibc'
    'libgcc'
    'libgomp'
    'libstdc++'
  )
  optdepends=(
    "dipviewer: viewer module"
    "java-${pkgbase}: Java bindings"
    "python-${pkgbase}: Python bindings"
  )

  cd "${srcdir}"
  DESTDIR="${pkgdir}" cmake --install "${_pkgsrc}/build"

  local tmpdir="$(mktemp -d)"
  DESTDIR="${tmpdir}" cmake --install "${_pkgsrc}/build/viewer"
  DESTDIR="${tmpdir}" cmake --install "${_pkgsrc}/build/javaio"
  cd "${tmpdir}"
  find . \( -type f -o -type l \) -exec rm -f "${pkgdir}/{}" \;
  find . -type d -exec rmdir --ignore-fail-on-non-empty "${pkgdir}/{}" \;

  cd "${srcdir}/${_pkgsrc}"
  install -vDm644 "README.md"   -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -vDm644 "LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgbase}"
}

package_dipviewer() {
  pkgdesc+=" (viewer module)"
  url+="/diplib-docs/dipviewer.html"
  depends=(
    "${pkgbase}>=${pkgver}-${pkgrel}"
    'freeglut'
    'glfw'
    'glibc'
    'libgcc'
    'libglvnd'
    'libstdc++'
  )
  optdepends=(
    "java-${pkgbase}: Java-based frontend"
  )

  cd "${srcdir}"
  DESTDIR="${pkgdir}" cmake --install "${_pkgsrc}/build/viewer"

  install -vd "${pkgdir}/usr/share/licenses"
  ln -vsf "${pkgbase}" "${pkgdir}/usr/share/licenses/${pkgname}"
}

package_java-diplib() {
  pkgdesc+=" (Java bindings)"
  url+="/diplib-docs/dipjavaio.html"
  depends=(
    "${pkgbase}>=${pkgver}-${pkgrel}"
    'glibc'
    'java-runtime-headless'
    'libgcc'
    'libstdc++'
  )

  cd "${srcdir}"
  DESTDIR="${pkgdir}" cmake --install "${_pkgsrc}/build/javaio"

  cd "${pkgdir}/usr/lib"
  install -vd "${pkgdir}/usr/share/java/${pkgbase}"
  find . -type f -name '*.jar' \
    -exec cp -va "{}" -t "${pkgdir}/usr/share/java/${pkgbase}" \; \
    -exec rm -f "{}" +
}

package_python-diplib() {
  pkgdesc+=" (Python bindings)"
  url+="/PyDIP.html"
  depends=(
    "${pkgbase}>=${pkgver}-${pkgrel}"
    'glibc'
    'libgcc'
    'libstdc++'
    'python>=3.8'
  )
  optdepends=(
    'python-pandas: convert the measurement object into a Pandas DataFrame'
    'python-matplotlib: display functionality (`diplib.Show()` and `diplib.Image.Show()`)'
  )

  local site_packages="$(python -c "import site; print(site.getsitepackages()[0])")"

  cd "${srcdir}/${_pkgsrc}/build/pydip"
  python -m installer --destdir="${pkgdir}" "$(cat wheel.txt)"

  rm -rf "${pkgdir}/usr/bin"

  install -vd "${pkgdir}/usr/share/doc/${pkgname}"
  ln -vsf "${site_packages}/diplib-${pkgver}.dist-info/licenses/README.md" \
    "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
