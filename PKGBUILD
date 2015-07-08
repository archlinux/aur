# Maintainer: M0Rf30 <morfeo89 [at] hotmail [dot] it>
# Contributor: Eric Engestrom <aur [at] engestrom [dot] ch>
# Contributor: Leslie Zhai <xiang.zhai [at] i-soft [dot] com [dot] cn>

pkgname=leap-motion-sdk
_major=2.2.7
_build=30199
pkgver=${_major}
pkgrel=2
pkgdesc="The Leap Motion Developer SDK"
arch=('i686' 'x86_64')
url="https://developer.leapmotion.com/downloads"
optdepends=('leap-motion-driver: to install Playground and LeapControlPanel')
license=('custom')
source=(https://dl.dropboxusercontent.com/u/7226803/Leap_Motion_SDK_Linux_${_major}.tgz
	libleap.pc
	LICENSE)

package() {
  cd ${srcdir}/LeapDeveloperKit_${_major}+${_build}_linux

  # copy docs
  mkdir -p ${pkgdir}/usr/share/doc/${pkgname}/
  cp -r LeapSDK/docs/* ${pkgdir}/usr/share/doc/${pkgname}/

  # copy samples, util
  cp -r LeapSDK/{samples,util} ${pkgdir}/usr/share/doc/${pkgname}/

  # copy includes
  mkdir -p ${pkgdir}/usr/include/
  cp -r LeapSDK/include/* ${pkgdir}/usr/include/

  # copy libs
  mkdir -p ${pkgdir}/usr/lib/Leap

  cp LeapSDK/lib/{LeapJava.jar,Leap.py} ${pkgdir}/usr/lib/Leap

  if [ "$CARCH" == 'x86_64' ]; then
    cp LeapSDK/lib/x64/{LeapPython,libLeapCSharp,libLeapJava,libLeap}.so ${pkgdir}/usr/lib/Leap
  else
    cp LeapSDK/lib/x86/{LeapPython,libLeapCSharp,libLeapJava,libLeap}.so ${pkgdir}/usr/lib/Leap
  fi
  cp LeapSDK/lib/LeapCSharp.NET{3.5,4.0}.dll ${pkgdir}/usr/lib/Leap

  ln -s "/usr/lib/Leap/libLeap.so" "${pkgdir}/usr/lib/libLeap.so"
  install -D -m644 "/usr/lib/Leap/Leap.py" "${pkgdir}/usr/lib/python2.7/site-packages/Leap.py"
  install -D -m644 "/usr/lib/Leap/LeapPython.so" "${pkgdir}/usr/lib/python2.7/site-packages/LeapPython.so"

  install -D -m644 "${srcdir}"/libleap.pc "${pkgdir}/usr/lib/pkgconfig/libleap.pc"
  # Copy license
  install -D -m644 "${srcdir}"/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

md5sums=('cc9ffe540a913facc34138b9a87908be'
	 'c43a3a834f646efc8f033f75eb80cc7e'
         '78a4f0934b105397d1f7b17d06e4717c')
