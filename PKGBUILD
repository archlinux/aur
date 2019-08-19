# Maintainer: Gegrely Imreh <imrehg@gmail.com>

pkgname=edgetpu_api
pkgver=2.11.1
pkgrel=1
pkgdesc='Google Coral Edge TPU runtime and Python library'
arch=('x86_64' 'aarch64' 'armv7h')
url='https://coral.withgoogle.com/'
license=('Apache')
options=(!strip)
depends=('python' 'python-pip' 'python-pillow' 'python-numpy' 'libunwind' 'libc++')
source=("https://dl.google.com/coral/${pkgname}/${pkgname}_${pkgver}.tar.gz")
md5sums=('b9f38b4322da647e2ec460126750bf80')
sha256sums=('6067fcc921423c3dc23e1bc12186e42ff954eada50b44826b2167700b50dc69e')

package() {

  install -Dm644 "${srcdir}/${pkgname}/99-edgetpu-accelerator.rules" \
    "${pkgdir}/usr/lib/udev/rules.d/99-edgetpu-accelerator.rules"

  case $CARCH in
    x86_64)
      LIBEDGETPU_SUFFIX=x86_64
      libfile="libedgetpu_x86_64.so"
      SWIG_ARCH=x86_64
      ;;
    aarch64)
      LIBEDGETPU_SUFFIX=arm64
      libfile="libedgetpu_arm64.so"
      SWIG_ARCH=aarch64
      ;;
    armv7h)
      LIBEDGETPU_SUFFIX=arm32
      libfile="libedgetpu_arm32.so"
      SWIG_ARCH=arm
      ;;
  esac
  LIBEDGETPU_SRC="${srcdir}/${pkgname}/libedgetpu/libedgetpu_${LIBEDGETPU_SUFFIX}.so"
  LIBEDGETPU_DST="${pkgdir}/usr/lib/libedgetpu.so.1.0"
  install -Dm755 "${LIBEDGETPU_SRC}" "${LIBEDGETPU_DST}"

  python -m pip install --no-cache-dir --no-compile --no-deps --ignore-installed --root="${pkgdir}" "${srcdir}/${pkgname}/edgetpu-${pkgver}-py3-none-any.whl"

  # Architecture cleanup and symlinking for relevant Python versions
  python_versions=( "36m" "37m" )
  find "${pkgdir}/usr/lib/" -name "_edgetpu_cpp_wrapper.*.so"|while read wrapperfile; do
    wrapperfilename=$(basename "$wrapperfile")
    wrapperdirname=$(dirname "$wrapperfile")
    if [ -n "${wrapperfilename##*$SWIG_ARCH*}" ]; then
      rm $wrapperfile
    else
      for version in "${python_versions[@]}" ; do
        testfile="${wrapperfilename/3[5-7]m/$version}"
        if [ "$wrapperfilename" = "$testfile" ]; then
          continue
        elif [ -f "$wrapperdirname/$testfile" ]; then
          break
        else
          msg "Creating link: $wrapperfilename -> $testfile"
          ln -s "$wrapperfilename" "$wrapperdirname/$testfile"
        fi
      done
    fi
  done

}
