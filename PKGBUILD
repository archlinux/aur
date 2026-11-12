# Maintainer: Fred Mitchell <your-email-here>

pkgname=slit-scan-git
_pkgname=slit-scan
pkgver=0.1.0.r87.gea07ec1
pkgrel=1
pkgdesc="Streaming slit-scan animations from images, videos and a camera (git version)"
arch=('x86_64' 'aarch64')
url="https://github.com/flajann2/slit-scan-cpp"
license=('MIT')
depends=('gtkmm-4.0' 'opencv' 'yaml-cpp' 'libzip' 'ffmpeg' 'freetype2'
         'glibmm-2.68' 'libsigc++-3.0' 'gcc-libs' 'glibc')
# Arch's OpenCV CMake config references the VTK and HDF5 targets, so
# find_package(OpenCV) fails without them at build time.
makedepends=('cmake' 'ninja' 'git' 'vtk' 'hdf5')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://github.com/flajann2/slit-scan-cpp.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  # v0.1.0-3-gabc1234 -> 0.1.0.r3.gabc1234; before the first tag, 0.1.0.r<count>.g<hash>
  if git describe --tags >/dev/null 2>&1; then
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
  else
    printf "0.1.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  fi
}

build() {
  cmake -B build -S "$_pkgname" -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DENABLE_PLAYGROUND=OFF \
    -DSLITSCAN_REGENERATE_UI=OFF \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
