# Maintainer: Runnytu < runnytu at gmail dot com >
# OldMaintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=nvidia-304xx-dkms
pkgver=304.125
pkgrel=3
pkgdesc='NVIDIA kernel module sources (DKMS)'
arch=('i686' 'x86_64')
[ "$CARCH" = "i686"   ] && _arch=x86 && _no32=
[ "$CARCH" = "x86_64" ] && _arch=x86_64 && _no32=-no-compat32
_pkg=NVIDIA-Linux-${_arch}-${pkgver}${_no32}
url='http://www.nvidia.com/'
license=('custom')
depends=('dkms' "nvidia-304xx-utils=${pkgver}")
optdepends=('linux-headers: Build the module for Arch kernel'
            'linux-lts-headers: Build the module for LTS Arch kernel')
provides=('nvidia' 'nvidia-dkms')
conflicts=('nvidia-304xx' 'nvidia-dkms')
install='nvidia-304xx-dkms.install'
source=("http://us.download.nvidia.com/XFree86/Linux-${_arch}/${pkgver}/${_pkg}.run"
	"nvidia-3.19.patch"
	"nv-pat.patch")
[ "$CARCH" = "i686"   ] && sha256sums=('aec5b3a792910e152d5af756ef6fd7224c448c564564c7c448ab8ec3fc78c4f7' '4d9fadd36b97937f178518974f650b96a299d9ec2d755d4e2937732356d283bf'
'4b74492f423bd144aae29fabf94f17af5af8e475ef76fb3bb289870c2387d261')
[ "$CARCH" = "x86_64" ] && sha256sums=('aa3c40a967b8d81cfb96efe3c9402e356901bdc76a697b15786edd636784e622' '4d9fadd36b97937f178518974f650b96a299d9ec2d755d4e2937732356d283bf' '4b74492f423bd144aae29fabf94f17af5af8e475ef76fb3bb289870c2387d261')

prepare() {
  if [[ -d ${_pkg} ]] ; then
    rm -rf ${_pkg}
  fi

  sh ${_pkg}.run --extract-only
  cd ${_pkg}
  patch -p1 -i $srcdir/nvidia-3.19.patch
  patch -p1 -i $srcdir/nv-pat.patch
}

package() {
  cd ${_pkg}

  install -dm 755 "${pkgdir}"/usr/{lib/modprobe.d,share/licenses,src}
  cp -dr --no-preserve='ownership' kernel "${pkgdir}"/usr/src/nvidia-${pkgver}

  echo 'blacklist nouveau' > "${pkgdir}"/usr/lib/modprobe.d/nvidia.conf

  ln -s nvidia-304xx "${pkgdir}"/usr/share/licenses/nvidia-304xx-dkms
}

