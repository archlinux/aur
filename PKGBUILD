# Maintainer: Felix Kauselmann <licorn at gmail dot com>

pkgname=libpdfium-nojs
pkgver=3396.r4.7b8cd8daf
pkgrel=2
pkgdesc="Open-source PDF rendering engine."
arch=('x86_64')
url="https://pdfium.googlesource.com/pdfium/"
license=('BSD')
depends=('freetype2' 'lcms2' 'libjpeg')
conflicts=('libpdfium-bin')
provides=('libpdfium')
makedepends=('git' 'python2' 'gn-bin>=r533513' 'ninja')

source=("git+https://pdfium.googlesource.com/pdfium"
	"git+https://chromium.googlesource.com/chromium/src/build.git"
	"libpdfium.pc"
	)

md5sums=('SKIP'
         'SKIP'
         '7fbbe2baf9a1fed80ad74278e901fa0e')

pkgver() {

  cd $srcdir/pdfium

  # Version = branch name/number + number of commits since branch creation
  # + short head
  printf  "%s.r%s.%s" $(git rev-parse --abbrev-ref HEAD | cut -d '/' -f2)\
   $(git rev-list --count master..) $(git rev-parse --short HEAD)

}

prepare() {

  cd "$srcdir/pdfium"

  ln -sf $srcdir/build build

  # Pdfium is developed alongside Chromium and does not provide releases
  # Upstream recommends using Chromium's dev channels instead

  # Extract pdfium branch name used in stable channel from omahaproxy and do
  # a checkout
  git checkout "chromium/$(curl https://omahaproxy.appspot.com/linux?channel=stable | cut -d'.' -f 3)"

  # git checkout "chromium/$(curl https://omahaproxy.appspot.com/linux?channel=beta | cut -d'.' -f 3)"
  # git checkout "chromium/$(curl https://omahaproxy.appspot.com/linux?channel=dev | cut -d'.' -f 3)"

  # Extract build repo revision needed from DEPS file and do a checkout
  cd "$srcdir/pdfium/build"
  git checkout $(awk '/build_revision/ {print substr($2,2,40)}' $srcdir/pdfium/DEPS) -q

  # Use system provided icu library (unbundling)
  mkdir -p "$srcdir/pdfium/third_party/icu"
  ln -sf "$srcdir/build/linux/unbundle/icu.gn" "$srcdir/pdfium/third_party/icu/BUILD.gn"

  # Download and decode shim header script needed to unbundle icu (gittiles is weird)
  mkdir -p "$srcdir/pdfium/tools/generate_shim_headers/"
  echo "Downloading generate_shim_headers script from buildtools."
  curl https://chromium.googlesource.com/chromium/src/+/master/tools/generate_shim_headers/generate_shim_headers.py?format=TEXT \
    | base64 --decode > "$srcdir/pdfium/tools/generate_shim_headers/generate_shim_headers.py"
  echo "Done."

  # Patch BUILD.gn to build a shared library
  cd "$srcdir/pdfium"
  sed -i 's/jumbo_static_library("pdfium")/shared_library("pdfium")/g' BUILD.gn

  # 'source_set' builds faster and is more reliable for shared libraries
  sed -i 's/static_library/source_set/g' BUILD.gn
  sed -i 's/static_library/source_set/g' third_party/BUILD.gn

  # Patch pdfium headers to enable symbol export
  sed -i 's/\#define FPDF_EXPORT/\#define FPDF_EXPORT __attribute__ ((visibility ("default")))/g'\
	 public/fpdfview.h
  sed -i '/"PNG_PREFIX",/a     "FPDFSDK_EXPORTS",' BUILD.gn

}

build() {

  cd "$srcdir/pdfium"

  local _flags=(
      'is_clang=false'
      'use_sysroot=false'
      'is_debug=false'
      'symbol_level=0'
      'is_component_build=false'
      'pdf_enable_v8=false'
      'pdf_enable_xfa=false'
      'treat_warnings_as_errors=false'
      'use_system_libjpeg=true'
      'use_system_zlib=true'
      'pdf_bundle_freetype=false'
      'use_system_freetype=true'
      'use_system_lcms2=true'
      'use_system_libpng=true'
      'use_custom_libcxx=false'
      'use_gio=false'
  )

  gn gen out/Release --script-executable=/usr/bin/python2 --args="${_flags[*]}"
  ninja -C out/Release pdfium

	# set pdfium version in pc file
	sed "s/@VERSION@/${pkgver}/g" -i "${srcdir}/libpdfium.pc"

}

package() {

  cd "$srcdir/pdfium"

  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D public/*.h --target-directory="${pkgdir}/usr/include/pdfium"
  install -D public/cpp/* --target-directory="${pkgdir}/usr/include/pdfium/cpp"
  install -D docs/* --target-directory="${pkgdir}/usr/share/doc/pdfium"
  install -Dm755 out/Release/libpdfium.so --target-directory="${pkgdir}/usr/lib"
  install -Dm644 ${srcdir}/libpdfium.pc --target-directory=${pkgdir}/usr/lib/pkgconfig

}
