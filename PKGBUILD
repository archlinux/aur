# Maintainer: Térence Clastres <t.clastres@gmail.com>

pkgname=snd_hda_intel-amd-hd-audio-fix-dkms
_pkgbase=${pkgname%-dkms}
_basekernel=5.2
_sub=5
_k_pkgver=${_basekernel}.${_sub}
pkgver=1
pkgrel=4
pkgdesc="The snd_hda_intel kernel driver, patched to remove crackling on AMD HD-audio controller"
arch=('x86_64')
url="https://bugzilla.kernel.org/show_bug.cgi?id=195303"
license=('GPL2')
depends=('dkms')
conflicts=(snd_hda_intel-alc1220-dkms)
replaces=(snd_hda_intel-alc1220-dkms)
source=("https://www.kernel.org/pub/linux/kernel/v5.x/linux-${_basekernel}.tar.xz"
	"https://www.kernel.org/pub/linux/kernel/v5.x/patch-${_k_pkgver}.xz"
	"patch-7.diff::https://bugzilla.kernel.org/attachment.cgi?id=284221"
        'dkms.conf'
        'Makefile'
	'Makefile.diff')
md5sums=('ddf994de00d7b18395886dd9b30b9262'
         '0bfed20acab24d45232983b54339a3c9'
         'e0d0c2c46caaff7039d74b6c54360af9'
         '8239975d93c5b07c11b092386ba9aa86'
         '7168339cf224bcd7927614fd608435a6'
         'eac7fd423191fe0f5fe841fb06999815')

prepare() {
  cd "${srcdir}/linux-${_basekernel}"
  # add upstream patch
  patch -p1 -i ../patch-"${_k_pkgver}"

  mkdir -p "${srcdir}"/hda-src
  cp sound/pci/hda/hda_{auto_parser.{c,h},beep.{c,h},bind.c,codec.c,controller{.c,.h,_trace.h},hwdep.c,intel{.c,.h,_trace.h},jack.{c,h},local.h,proc.c,sysfs.c} "${srcdir}"/hda-src
  cp sound/pci/hda/Makefile "${srcdir}"/hda-src

  cd "${srcdir}/hda-src"
  patch -Np1 < ../Makefile.diff Makefile
  patch  -Np4 < ../patch-7.diff
}

package() {
  # Copy dkms.conf
  install -Dm644 dkms.conf "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/dkms.conf"

  # Set name and version
  sed -e "s/@_PKGBASE@/${_pkgbase}/" \
      -e "s/@PKGVER@/${pkgver}/" \
      -i "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/dkms.conf"

  # Copy sources (including Makefile)
  cp -r "${srcdir}"/{hda*,Makefile} "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/"
}
