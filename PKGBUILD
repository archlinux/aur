# Maintainer: Alexandre Demers <alexandre.f.demers@gmail.com>

_pkgbasename=libplacebo
pkgname=lib32-$_pkgbasename
pkgver=7.351.0
pkgrel=1
pkgdesc='Reusable library for GPU-accelerated video/image rendering primitives (32bit)'
url='https://github.com/haasn/libplacebo'
arch=('x86_64')
license=('LGPL2.1-or-later')
depends=(
        "$_pkgbasename>=${pkgver}"
#        "$_pkgbasename"
        'lib32-vulkan-icd-loader>=1.2.176'
        'lib32-glslang>=8.13.3559'
        'lib32-lcms2'
        'lib32-shaderc'
        'lib32-glibc'
        'lib32-gcc-libs'
        'lib32-libunwind'
        'lib32-libdovi'
#        'lib32-xxhash'
        )
makedepends=(
        'glad' 
        'meson'
#        'meson-cross-x86-linux-gnu>=1.0.4'
        'libglvnd'
        'ninja'
        'nuklear'
        'python'
        'python-jinja'
        'python-mako'
        'python-markupsafe' 
        'python-setuptools' 
        'vulkan-headers'
        )
provides=('libplacebo.so')
source=(
    "https://code.videolan.org/videolan/libplacebo/-/archive/v${pkgver}/${_pkgbasename}-v${pkgver}.tar.gz"
    fix_glslang_linking.patch
  )
sha512sums=(
    '325e14b783aafdd0120abc6125d3949d60e2336fba3cd8d9aefececf93005a8333e5e6c53d6e54bb4c19e4a29981c9014f303fb48b5b89383ca948f64e7e6449'
    'f25f4532fd93b39efc2b481e88eadb8013d5ea32b0b785de336b3d03b52cd22577a933c5df6ed29f9c188a7ac7c8fa465114b230d3e43cb319a70072d8cbaefd'
  )
b2sums=(
    '631b292b789b44e51a1b7352f07c6eb8010c372e3562af49b670b7bac3f41b1a1b0100bd6b15988626831ecfad5bc328cbca1fccae45cb053172417f29673a00'
    '227a59c05d66e5226c297e39acad3244a50ab3fdc1c2742fd94979ffa09679e60c89fe916ff72321b0f91cb3516e35e52e0913067cde4c1325a28ff9db22fb3c'
  )

prepare() {
  cd ${_pkgbasename}-v${pkgver}

  # Patching if needed
  # Fix linking for glslang 15.0.0
  patch -Np1 < "${srcdir}/fix_glslang_linking.patch"
}

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  export CFLAGS+=" ${CPPFLAGS}"
  export CXXFLAGS+=" ${CPPFLAGS} -I/usr/include/glslang"
 
  cd ${_pkgbasename}-v${pkgver}
  meson setup build \
    --prefix=/usr \
    --libdir=lib32 \
    -D tests=false \
    -D vulkan=enabled \
    -D glslang=enabled \
    -D shaderc=enabled \
    -D lcms=enabled \
    -D d3d11=disabled \
    -D demos=false

#    --cross-file x86-linux-gnu \

  meson compile -C build
}

check() {
  cd ${_pkgbasename}-v${pkgver}
#  meson test -C build --print-errorlogs
}

package() {
  cd ${_pkgbasename}-v${pkgver}

  meson install -C build --destdir "${pkgdir}"

  rm -r "${pkgdir}"/usr/include
}
