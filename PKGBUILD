# Maintainer: Marco Pompili <aur@mg.odd.red>

DLAGENTS=("https::/usr/bin/curl -k -o %o %u")

pkgname=openframeworks
pkgver=0.11.0
pkgrel=1
pkgdesc="An open source C++ toolkit for creative coding."
url="http://openframeworks.cc/"
arch=('x86_64')
license=('MIT')
depends=('make' 'pkgconf' 'gcc' 'poco' 'openal' 'python-lxml' 'glew' 'glfw-x11' 'pugixml' 'freeglut' 'freeimage' 'gstreamer' 'gst-plugins-base' 'gst-plugins-good' 'gst-plugins-bad' 'gst-plugins-ugly' 'gst-libav' 'opencv' 'libxcursor' 'assimp' 'boost' 'mpg123' 'rtaudio' 'uriparser')
optdepends=('qtcreator' 'xterm')
options=(!strip)
install=openframeworks.install
source=(
  "openal_fix.patch"
  "of-make-workspace"
  "https://openframeworks.cc/versions/v${pkgver}/of_v${pkgver}_linux64gcc6_release.tar.gz")
sha256sums=('3e04a8ff4da53e813c0d20b87d5f2231a10767b3a0960af46b0902812b616734'
            'b4fc38288595df566f770018d871970fb13fb2ad4af7e9e5cddc60288f338806'
            '513cee3ce081e79fdc1a942af09869145fff3d7addeee0a76cef26fbc3ae69b1')

_name="of_v${pkgver}_linux64gcc6_release"

prepare() {
  cd ${srcdir}

  msg2 "Applying patch for openAL..."
  # copy patch
  cp openal_fix.patch ${_name}
  
  # apply patch
  cd ${_name}
  patch -p0 < openal_fix.patch 
  
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
}

build() {
  cd ${srcdir}/${_name}

  cd libs/openFrameworksCompiled/project

  msg2 "Building openFrameworks Debug version"
  make -j$cores Debug

  msg2 "Building openFrameworks Release version"
  make -j$cores_JOBS Release

  cd ${srcdir}/${_name}

  msg2 "Building OF Project Generator tool..."
  cd apps/projectGenerator/commandLine
  make -j$cores Release

  cd ${srcdir}/${_name}

  msg2 "Building OF Project Generator interface..."
  cd libs/openFrameworksCompiled/project
  make -j$cores Release
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
