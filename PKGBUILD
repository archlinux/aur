# Maintainer: M0Rf30 <morfeo89 [at] hotmail [dot] it>
# Contributor: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=leap-motion-driver
_major=2.2.7
_build=30199
pkgver=${_major}
pkgrel=1
pkgdesc="The Leap Motion Driver"
arch=('i686' 'x86_64')
url="https://developer.leapmotion.com/downloads"
depends=('mesa' 'libxxf86vm')
makedeps=('xz' 'tar')
license=('custom')
source=(https://dl.dropboxusercontent.com/u/7226803/Leap_Motion_SDK_Linux_$_major.tgz
	LICENSE
	leapd.service
	leap-sdk.install)
install=leap-sdk.install

package() {
  cd ${srcdir}/LeapDeveloperKit_${_major}+${_build}_linux

  if [ "$CARCH" == 'x86_64' ]; then
    bsdtar xf Leap-${_major}+${_build}-x64.deb
  else
    bsdtar xf Leap-${_major}+${_build}-x86.deb
  fi

  xz -d data.tar.xz 
  tar xvf data.tar

  # Copy binaries, headers, examples & libraries
  cp -r usr ${pkgdir}
  mv ${pkgdir}/usr/sbin/leapd ${pkgdir}/usr/bin
  rm -r ${pkgdir}/usr/sbin
  cp -r lib ${pkgdir}/usr/

  # Install systemd service
  install -Dm644 "${srcdir}/leapd.service" "${pkgdir}/usr/lib/systemd/system/leapd.service"

  # Copy license
  install -D -m644 "${srcdir}"/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

md5sums=('cc9ffe540a913facc34138b9a87908be'
         '78a4f0934b105397d1f7b17d06e4717c'
         '07287e65a3c2a4e2a956b7ba9038d816'
         '7dcbd917193007746310130fb76e53eb')
