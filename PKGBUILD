# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="rubberband"
pkgbase="lib32-${_name}"
pkgname=(
  "${pkgbase}"
  "${pkgbase}-ladspa"
  "${pkgbase}-lv2"
  "${pkgbase}-vamp"
)
pkgver=4.0.0
pkgrel=2
pkgdesc="Time-stretching and pitch-shifting audio library and utility" # (32-bit)
arch=(
  'x86_64'
)
url="https://www.breakfastquay.com/rubberband/"
_url="https://github.com/breakfastquay/${_name}"
license=(
  'GPL-2.0-or-later'
)
depends=(
  'lib32-fftw'
  'lib32-gcc-libs'
  'lib32-glibc'
  'lib32-libsamplerate'
)
makedepends=(
  # 'lib32-boost>=1.73'
  'lib32-ladspa'
  'lib32-lv2'
  'lib32-libsamplerate>=0.1.8'
  'lib32-libsndfile>=1.0.16'
  'lib32-vamp-plugin-sdk'

  'java-environment-openjdk'
  'meson>=0.53.0'
)
options=(
  '!emptydirs'
)
_pkgsrc="${_url##*/}-${pkgver}"
source=(
  "${_url}/archive/refs/tags/v${pkgver}/${_pkgsrc}.tar.gz"
)
sha512sums=('f581e900a71f78fde3361d2bed2fe165952c2ca087168c5f4e4994586bd832267eea58e0662a74b6a7430bc361fe80b5307b2ee6bf631a3561a8cba86e1cd3f2')
b2sums=('5ed7c160ac6653eec25c0e0d555ae98b72bb36ae330f7361e39104ace64d837c3b17dbb0922c40e9a630b37e25d6bb2e17f6455c870ae477361496307c82b980')

build() {
  export CFLAGS+=" -m32"
  export CXXFLAGS+=" -m32"
  export LDFLAGS+=" -m32"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  local java_major=$(java --version 2>/dev/null |grep 'openjdk'| cut -d ' ' -f2| cut -d '.' -f1)
  local meson_options=(
    --cross-file lib32
    -Dfft=fftw
    -Dresampler=libsamplerate
    -Dextra_include_dirs="/usr/lib/jvm/java-$java_major-openjdk/include,/usr/lib/jvm/java-$java_major-openjdk/include/linux"
  )

  cd "${srcdir}"
  arch-meson "${_pkgsrc}" "${_pkgsrc}/build" "${meson_options[@]}" 
  meson compile -C "${_pkgsrc}/build"
}

# check() {
#   cd "${srcdir}"
#   meson test -C "${_pkgsrc}/build" --print-errorlogs
# }

package_lib32-rubberband() {
  pkgdesc+=" (32-bit)"
  depends+=(
    'lib32-fftw'
    'lib32-libsndfile'
  )
  provides=(
    'librubberband.so'
    'librubberband-jni.so'
  )

  meson install -C "${_pkgsrc}/build" --destdir "${pkgdir}"

  cd "${pkgdir}/usr"
  rm -rf "bin" "include" "share"

  cd "lib32"
  rm -rf "ladspa" "lv2" "vamp"
}

package_lib32-rubberband-ladspa() {
  pkgdesc+=" - LADSPA plugin (32-bit)"
  depends+=(
    # 'lib32-ladspa-host'
  )
  groups=(
    'lib32-pro-audio'
    'lib32-ladspa-plugins'
  )

  meson install -C "${_pkgsrc}/build" --destdir "${pkgdir}"

  cd "${pkgdir}/usr"
  rm -rf "bin" "include" "share"

  find "lib32" -type f,l ! -name '*ladspa*' -delete
}

package_lib32-rubberband-lv2() {
  pkgdesc+=" - LV2 plugin (32-bit)"
  depends+=(
    'lib32-libsamplerate'
    # 'lib32-lv2-host'
  )
  groups=(
    'lib32-pro-audio'
    'lib32-lv2-plugins'
  )

  meson install -C "${_pkgsrc}/build" --destdir "${pkgdir}"

  cd "${pkgdir}/usr"
  rm -rf "bin" "include" "share"

  find "lib32" -type f,l ! -name '*lv2*' -delete
}

package_lib32-rubberband-vamp() {
  pkgdesc+=" - VAMP plugin (32-bit)"
  depends+=(
    'lib32-libsamplerate'
    # 'lib32-vamp-host'
    'lib32-vamp-plugin-sdk'
  )
  groups=(
    'lib32-pro-audio'
    'lib32-vamp-plugins'
  )

  meson install -C "${_pkgsrc}/build" --destdir "${pkgdir}"

  cd "${pkgdir}/usr"
  rm -rf "bin" "include" "share"

  find "lib32" -type f,l ! -name '*vamp*' -delete
}
