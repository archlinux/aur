# Maintainer: Marco Pompili <aur@odd.red>

DLAGENTS=("https::/usr/bin/curl -k -o %o %u")

pkgname=openframeworks
pkgver=0.11.2
pkgrel=2
pkgdesc="An open source C++ toolkit for creative coding."
url="http://openframeworks.cc/"
arch=('x86_64')
license=('MIT')
depends=('make' 'pkgconf' 'gcc' 'poco' 'openal' 'python-lxml' 'glew' 'glfw-x11' 'pugixml' 'freeglut' 'freeimage' 'gstreamer' 'gst-plugins-base' 'gst-plugins-good' 'gst-plugins-bad' 'gst-plugins-ugly' 'gst-libav' 'opencv' 'libxcursor' 'assimp' 'boost' 'mpg123' 'rtaudio' 'uriparser')
optdepends=('qtcreator' 'xterm')
options=(!strip)
install=openframeworks.install
source=(
  "of-make-workspace"
  "https://openframeworks.cc/versions/v${pkgver}/of_v${pkgver}_linux64gcc6_release.tar.gz"
  "https://gist.githubusercontent.com/kerrickstaley/7f8c65a27a1f4e79a942235b87c1f0c0/raw/28f7d0dd94237076f72b8eaf2e009831d7d61a5d/fix-libsndfile-error.patch"
)
sha256sums=('b4fc38288595df566f770018d871970fb13fb2ad4af7e9e5cddc60288f338806'
            '9907beae6c786751470f5a55f1273280f3c240b4a93ce0c4a32c4a62b401470c'
            '67693b69e2c36861d14ce9fa57b6855898c48fa4ed90e6aa14d7ce3a779b6110')

_name="of_v${pkgver}_linux64gcc6_release"

prepare() {
  cd ${srcdir}

  export OF_ROOT=${srcdir}/${_name}
  export LC_ALL=C

  ARCH=$(uname -m)

  if [ "$ARCH" = "x86_64" ]; then
    LIBSPATH=linux64
  else
    LIBSPATH=linux
  fi

  pushd `dirname $0` > /dev/null
  SCRIPTPATH=`pwd`
  popd > /dev/null

  BUILD="install"
  JOBS=1
  while getopts tj: opt ; do
    case "$opt" in
      t)  # testing, only build Debug
	      BUILD="test" ;;
      j)  # make job count for parallel build
	      JOBS="$OPTARG"
    esac
  done

  msg2 "Apply patch to fix libsndfile error..."
  cd ${srcdir}/${_name}
  patch -p1 < ${srcdir}/fix-libsndfile-error.patch
}

build() {
  cd ${srcdir}/${_name}

  cd libs/openFrameworksCompiled/project

  msg2 "Building openFrameworks Debug version"
  make -s Debug

  msg2 "Building openFrameworks Release version"
  make -s Release

  cd ${srcdir}/${_name}

  msg2 "Building OF Project Generator tool..."
  cd apps/projectGenerator/commandLine
  make -s Release

  cd ${srcdir}/${_name}

  msg2 "Building OF Project Generator interface..."
  cd libs/openFrameworksCompiled/project
  make -s Release
}

package() {
  install -Dm755 "${srcdir}/${_name}/apps/projectGenerator/commandLine/bin/projectGenerator" \
	  "${pkgdir}/usr/bin/projectGenerator"

  install -dm755 "${pkgdir}/opt"

  cp -R "${srcdir}/${_name}" "${pkgdir}/opt/openFrameworks"

  install -Dm775 "${srcdir}/of-make-workspace" "${pkgdir}/opt/openFrameworks/scripts/of-make-workspace"

  msg2 "Fixing emptyExample project files permissions..."

  chmod 644 "${pkgdir}"/opt/openFrameworks/apps/myApps/emptyExample/addons.make
  chmod 644 "${pkgdir}"/opt/openFrameworks/apps/myApps/emptyExample/config.make
  chmod 644 "${pkgdir}"/opt/openFrameworks/apps/myApps/emptyExample/emptyExample.qbs
  chmod 644 "${pkgdir}"/opt/openFrameworks/apps/myApps/emptyExample/Makefile

  install -D -m644 "${srcdir}/${_name}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
