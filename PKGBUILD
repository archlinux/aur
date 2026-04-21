# Maintainer: Marco Pompili <aur@marcopompili.com>

pkgname=openframeworks
pkgver=0.12.1
pkgrel=1
pkgdesc="An open source C++ toolkit for creative coding."
url="http://openframeworks.cc/"
arch=('x86_64')
license=('MIT')
depends=('make' 'pkgconf' 'gcc' 'poco' 'openal' 'python-lxml' 'glew' 'glfw-x11' 'pugixml' 'freeglut' 'freeimage' 'gstreamer' 'gst-plugins-base' 'gst-plugins-good' 'gst-plugins-bad' 'gst-plugins-ugly' 'gst-libav' 'opencv' 'libxcursor' 'assimp' 'boost' 'mpg123' 'rtaudio' 'uriparser' 'libxinerama')
optdepends=('qtcreator' 'xterm')
options=(!strip)
install=openframeworks.install
source=(
  "of-make-workspace"
  "https://github.com/openframeworks/openFrameworks/releases/download/${pkgver}/of_v${pkgver}_linux64_gcc6_release.tar.gz"
  "fix-algorithm-include.patch"
)
sha256sums=('b4fc38288595df566f770018d871970fb13fb2ad4af7e9e5cddc60288f338806'
            'd6c1dcab777665b2aa63e5e3d9122cc116f096b3421db3493f795a621b399c63'
            'd8c38329177aa3db76904bc3a24c94e4e4c92db4233a894857aa86c440060424')

_name="of_v${pkgver}_linux64_gcc6_release"

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

  cd ${_name}
  patch -p1 < ${srcdir}/fix-algorithm-include.patch
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
  chmod 644 "${pkgdir}"/opt/openFrameworks/apps/myApps/emptyExample/Makefile

  install -D -m644 "${srcdir}/${_name}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
