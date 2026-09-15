# Maintainer: TheFeelTrain <the@feeltra.in>
# Contributor: Josh Holmer <jholmer.in@gmail.com>

pkgname=python-videotimestamps
_origpkgname=videotimestamps
pkgver=1.2.0
pkgrel=2
pkgdesc="Get video timestamps."
arch=("x86_64")
url='https://github.com/moi15moi/VideoTimestamps/'
license=("MIT")
depends=(
  "ffmpeg"
  "ffms2-git"
  "dav1d"
  "python-xxhash"
  "xxhash"
  "vapoursynth-plugin-bestsource"
)
makedepends=(
  "meson"
  "meson-python"
  "python-build"
  "python-installer"
  "python-wheel"
  "python-setuptools"
  "nanobind"
  "robin-map"
  "vapoursynth"
)
source=("https://files.pythonhosted.org/packages/source/v/${_origpkgname}/${_origpkgname}-${pkgver}.tar.gz")
sha256sums=('a8ace9dcb148656dd552b6fc8d9c817bc2bd5192b4985ff50a0384caf0b835cb')

prepare() {
  cd "${_origpkgname}-${pkgver}" || exit

  # Prefer the system libraries over the forced fallback subprojects.
  sed -i 's/--default-library=static/--default-library=shared/g' pyproject.toml
  sed -i 's/--wrap-mode=forcefallback/--wrap-mode=default/g' pyproject.toml

  # The bestsource subproject is only used for its headers; the library itself comes from vapoursynth-plugin-bestsource
  meson subprojects download bestsource

  # meson cannot probe nanobind's CMake package so expose the system headers through pkg-config and build nanobind's implementation source into each extension module.
  local nanobind_inc nanobind_ver
  nanobind_inc="$(python -c 'import nanobind; print(nanobind.include_dir())')"
  nanobind_ver="$(python -c 'import nanobind; print(nanobind.__version__)')"
  sed -i "/^nanobind_dep = dependency('nanobind')$/a nanobind_dep = declare_dependency(dependencies: nanobind_dep, sources: files(run_command(py, '-c', 'import nanobind; print(nanobind.source_dir() + \"/nb_combined.cpp\")', check: true).stdout().strip()))" meson.build

  # vapoursynth-plugin-bestsource does not have headers nor a pkg-config file 
  # feed meson's dependency('bestsource') a stub that points at the system shared library plus the headers downloaded above
  local plugins_dir
  plugins_dir="$(python -c 'import os, vapoursynth; print(os.path.join(os.path.dirname(vapoursynth.__file__), "plugins"))')"
  cat > bestsource.pc <<EOF
includedir=${srcdir}/${_origpkgname}-${pkgver}/subprojects/bestsource/src
pluginsdir=${plugins_dir}

Name: bestsource
Description: A super great audio/video source and FFmpeg wrapper
Version: 20.0
Cflags: -I\${includedir}
Libs: -L\${pluginsdir} -lbestsource -Wl,-rpath,\${pluginsdir}
EOF

  cat > nanobind.pc <<EOF
includedir=${nanobind_inc}

Name: nanobind
Description: nanobind C++/Python bindings
Version: ${nanobind_ver}
Cflags: -I\${includedir}
EOF
}

build() {
  cd "${_origpkgname}-${pkgver}" || exit
  export PKG_CONFIG_PATH="$srcdir/${_origpkgname}-${pkgver}${PKG_CONFIG_PATH:+:$PKG_CONFIG_PATH}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_origpkgname}-${pkgver}" || exit
  python -m installer --destdir="$pkgdir" dist/*.whl
}