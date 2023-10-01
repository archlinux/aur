# Maintainer: Marco Pompili <aur@odd.red>

DLAGENTS=("https::/usr/bin/curl -k -o %o %u")

pkgname=openframeworks
pkgver=0.12.0
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
  "of-make-workspace"
  "https://github.com/openframeworks/openFrameworks/releases/download/0.12.0/of_v0.12.0_linux64gcc6_release.tar.gz"
)
sha256sums=('b4fc38288595df566f770018d871970fb13fb2ad4af7e9e5cddc60288f338806'
            '942cd299c903e0aeea5f05e429ab813702e0ba4f99a5a3d0e7c21e61be9b3b2b')

_name="of_v${pkgver}_linux64gcc6_release"

prepare() {
  cd ${srcdir}

  export OF_ROOT=${srcdir}/${_name}
  export LC_ALL=C
  export CXXFLAGS="-Wall -Wno-error -Wno-format-security"

  ARCH=$(uname -m)

  if [ "$ARCH" = "x86_64" ]; then
    LIBSPATH=linux64
  else
    LIBSPATH=linux
  fi
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
