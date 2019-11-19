# Maintainer: Sol Bekic <s+aur at s-ol dot nu>
# Original PKGBUILD: Marco Pompili <aur@emarcs.org>

pkgname=openframeworks-nightly
pkgver=20191119
pkgrel=1
pkgdesc="An open source C++ toolkit for creative coding."
url="http://openframeworks.cc/"
arch=('x86_64')
license=('MIT')
depends=('make' 'pkg-config' 'gcc' 'openal' 'python-lxml' 'glew' 'freeglut' 'freeimage' 'gstreamer'
         'gst-plugins-base' 'gst-plugins-good' 'gst-plugins-bad' 'gst-plugins-ugly' 'gst-libav'
         'opencv' 'libxcursor' 'assimp' 'boost' 'mpg123' 'rtaudio' 'uriparser' 'pugixml' 'glfw')
optdepends=('qtcreator' 'xterm')
options=(!strip)
provides=('openframeworks')
conflicts=('openframeworks')
install=openframeworks.install

_name="of_v${pkgver}_linux64gcc6_release"

source=("http://ci.openframeworks.cc/versions/nightly/of_v${pkgver}_linux64gcc6_nightly.tar.gz"
        "of-make-workspace")
md5sums=('ac1569f11504eff92df0f72f44cd9f6f'
         'd4a0cfda1970138b71d28f1cd81220da')

prepare() {
  export OF_ROOT=${srcdir}/${_name}
  export LC_ALL=C
}

build() {
  cd ${srcdir}/${_name}

  cd libs/openFrameworksCompiled/project

  msg2 "Building openFrameworks Debug version"
  make Debug

  msg2 "Building openFrameworks Release version"
  make Release

  cd ${srcdir}/${_name}

  msg2 "Building OF Project Generator tool..."
  cd apps/projectGenerator/commandLine
  make Release

  cd ${srcdir}/${_name}

  msg2 "Building OF Project Generator interface..."
  cd libs/openFrameworksCompiled/project
  make Release
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
