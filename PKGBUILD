# Maintainer: M0Rf30 <morfeo89 [at] hotmail [dot] it>
# Contributor: Eric Engestrom <aur [at] engestrom [dot] ch>
# Contributor: Leslie Zhai <xiang.zhai [at] i-soft [dot] com [dot] cn>

pkgbase=leap-motion
pkgname=('leap-motion-driver' 'leap-motion-sdk')
_major=2.3.1
_build=31549
pkgver=${_major}
pkgrel=4
pkgdesc="The Leap Motion Developer SDK"
arch=('i686' 'x86_64')
url="https://developer.leapmotion.com/downloads"
license=('custom')
source=(Leap_Motion_SDK_Linux_${_major}.tgz.tgz::http://warehouse.leapmotion.com/apps/4185/download
	libleap.pc
	LICENSE
    	leapd.service
    	$pkgbase.desktop
    	$pkgbase.png)

package_leap-motion-sdk() {

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
  install -D -m644 "${pkgdir}/usr/lib/Leap/Leap.py" "${pkgdir}/usr/lib/python2.7/site-packages/Leap.py"
  install -D -m644 "${pkgdir}/usr/lib/Leap/LeapPython.so" "${pkgdir}/usr/lib/python2.7/site-packages/LeapPython.so"

  install -D -m644 "${srcdir}"/libleap.pc "${pkgdir}/usr/lib/pkgconfig/libleap.pc"
  # Copy license
  install -D -m644 "${srcdir}"/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_leap-motion-driver() {
	depends=('mesa' 'libxxf86vm')
	makedeps=('xz' 'tar')
	install=$pkgbase-driver.install

  cd ${srcdir}/LeapDeveloperKit_${_major}+${_build}_linux

  if [ "$CARCH" == 'x86_64' ]; then
    bsdtar xf Leap-${_major}+${_build}-x64.deb
  else
    bsdtar xf Leap-${_major}+${_build}-x86.deb
  fi

  tar xf data.tar.xz

# Use systemd's user ACL to manage device access
  sed -i -e 's/MODE="666", GROUP="plugdev"/TAG+="uaccess"/' lib/udev/rules.d/25-com-leapmotion-leap.rules

# Copy binaries, headers, examples & libraries
  cp -r usr ${pkgdir}
  mv ${pkgdir}/usr/sbin/leapd ${pkgdir}/usr/bin
  rm -r ${pkgdir}/usr/sbin
  cp -r lib ${pkgdir}/usr/

# move libs in /usr/bin/ to /usr/lib/Leap/
  mv ${pkgdir}/usr/bin/{libfreebl3.so,libnssdbm3.so,libnssutil3.so,libplc4.so,libplds4.so,libsoftokn3.so,libsqlite3.so,libnspr4.so} ${pkgdir}/usr/lib/Leap/

# Install systemd service
  install -Dm644 "${srcdir}/leapd.service" "${pkgdir}/usr/lib/systemd/system/leapd.service"

# Copy license
  install -D -m644 "${srcdir}"/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

# Install desktop file
	install -Dm644 "${srcdir}/$pkgbase.desktop" "${pkgdir}/usr/share/applications/$pkgbase.desktop"

	for i in 16x16 22x22 24x24 32x32 48x48 256x256; do
		install -Dm 0644 "$srcdir/$pkgbase.png" "$pkgdir/usr/share/icons/hicolor/$i/apps/$pkgbase.png"
	done
}

md5sums=('d9facdfed290823d3a5358ca5077e883'
         'c43a3a834f646efc8f033f75eb80cc7e'
         '78a4f0934b105397d1f7b17d06e4717c'
         '07287e65a3c2a4e2a956b7ba9038d816'
         '0261f47c2d5090681446f6917b1858ba'
         '5b85d03f4109203c5f7ecd610a33136d')
