# Maintainer: shizhiex <shizhiex@gmail.com>

pkgname="orca-slicer"
pkgver=2.3.1.c6b8664c8e276413445e
_commit='c6b8664c8e276413445ed25d3a8957101143c006'
pkgrel=2
pkgdesc="Orca Slicer is a fork of Bambu Studio. It was previously known as BambuStudio-SoftFever"
arch=('x86_64')
url="https://github.com/SoftFever/OrcaSlicer"
license=('AGPL3')
depends=('curl' 'dbus' 'eglexternalplatform' 'file' 'gettext' 'glew' 'gstreamer' 'gtk3' 'libsecret' 'libspnav' 'mesa' 'openssl' 'texinfo' 'wayland-protocols' 'webkit2gtk')
makedepends=('cmake' 'extra-cmake-modules' 'git' 'ninja' 'wget' 'pkgconf')
provides=("orca-slicer")
conflicts=("orca-slicer")
source=(
  "git+https://github.com/SoftFever/OrcaSlicer.git#commit=${_commit}"
  "orca-slicer.sh"
  "0001_slic3r_osmesa.patch"
  )
sha256sums=(
  'SKIP'
  '7478461e3e625e87bff32502b56e13b0ed46192c578194bdc979036161080450'
  'edfa7e93db1604058c37e1fd94648c6ee68a4e72f3144251212547adf086c5bb'
)

build() {
  # deps
  cd "$srcdir/OrcaSlicer"
  git apply "$srcdir/../0001_slic3r_osmesa.patch"
  ./BuildLinux.sh -cd -j4
  ./BuildLinux.sh -s -j4
}

package() {
  echo "Entering directory $srcdir/OrcaSlicer/build/package/bin."
  install -d "$pkgdir/usr/bin"
  cd "$srcdir/OrcaSlicer/build/package/bin"
  install "orca-slicer" "$pkgdir/usr/bin/orca-slicer-bin"

  echo "Entering directory $srcdir/OrcaSlicer/build/package."
  cd "$srcdir/OrcaSlicer/build/package"
  find resources -type f -exec install -D {} "$pkgdir/usr/{}" \;

  echo "Entering directory $srcdir/OrcaSlicer/doc."
  cd "$srcdir/OrcaSlicer/doc"
  install -D -t "$pkgdir/usr/share/doc/$pkgname" *.md

  install "$srcdir/orca-slicer.sh" "$pkgdir/usr/bin/orca-slicer"
}
