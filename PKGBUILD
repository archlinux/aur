# Maintainer: Térence Clastres <t.clastres@gmail.com>

pkgname=snd_hda_intel-amd-hd-audio-fix-dkms
_pkgbase=${pkgname%-dkms}
_basekernel=5.2
_sub=5
_k_pkgver=${_basekernel}.${_sub}
pkgver=1
pkgrel=1
pkgdesc="The snd_hda_intel kernel driver, patched to remove crackling on AMD HD-audio controller"
arch=('x86_64')
url="https://bugzilla.kernel.org/show_bug.cgi?id=195303"
license=('GPL2')
depends=('dkms')
conflicts=(snd_hda_intel-alc1220-dkms)
replaces=(snd_hda_intel-alc1220-dkms)
source=("https://www.kernel.org/pub/linux/kernel/v5.x/linux-${_basekernel}.tar.xz"
	"https://www.kernel.org/pub/linux/kernel/v5.x/patch-${_k_pkgver}.xz"
	"hda_intel.diff"
	"hdac_stream.diff"
        'dkms.conf'
        'Makefile')
md5sums=('ddf994de00d7b18395886dd9b30b9262'
         '0bfed20acab24d45232983b54339a3c9'
         '867d3d27fb1716290c76d90ffb739343'
         'b5f5cf9b9a7e0c5852d290992eb73b68'
         '20495ab7a2c425ba786c44d53d458909'
         '4cf63656de83b4321d6261289735d1e1')

prepare() {
  mkdir -p "${srcdir}/${_pkgbase}" && cd "${srcdir}/${_pkgbase}"

  cp ../dkms.conf ../hda*.diff ../Makefile .

  cd "${srcdir}/linux-${_basekernel}"
  # add upstream patch
  patch -p1 -i ../patch-"${_k_pkgver}"

  mkdir -p "${srcdir}"/hda-src/{hdacore,include/dkms/{sound,uapi/sound}}
  cp -r sound/hda/* "${srcdir}/hda-src/hdacore"
  cp sound/pci/hda/* "${srcdir}/hda-src"
  cp -r include/{sound/hda*,sound/tlv.h} "${srcdir}/hda-src/include/dkms/sound"
  cp include/uapi/sound/* "${srcdir}/hda-src/include/dkms/uapi/sound" || true

  cd "${srcdir}/hda-src"
  patch  -Np4 < ../hda_intel.diff
  patch  -Np1 < ../hdac_stream.diff

}

package() {
  # Copy dkms.conf
  install -Dm644 dkms.conf "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/dkms.conf"

  # Set name and version
  sed -e "s/@_PKGBASE@/${_pkgbase}/" \
      -e "s/@PKGVER@/${pkgver}/" \
      -i "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/dkms.conf"

#  readlink -f .
#  exit
  # Copy sources (including Makefile)
  cp -r "${srcdir}"/{hda*,Makefile} "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/"
}
