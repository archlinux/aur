# Maintainer: Chris Severance aur.severach AatT spamgourmet.com
# Contributor: fnord0 <fnord0 AT riseup DOT net>

set -u
pkgname='sbd'
pkgver='1.36'
pkgrel='2'
pkgdesc='Netcat-clone, portable, offers strong encryption - features AES-128-CBC + HMAC-SHA1 encryption, program execution (-e), choosing source port, continuous reconnection with delay + more'
url='https://packetstormsecurity.com/UNIX/netcat/'
arch=('i686' 'x86_64')
license=('GPL')
source=("https://dl.packetstormsecurity.net/UNIX/netcat/${pkgname}-${pkgver}.tar.gz")
sha256sums=('a15ce468e7e04cc12fe2686e0a44e1201d7c67986681d51e255cba9362ab0676')
DLAGENTS=('https::/usr/bin/curl -kfLC - --retry 3 --retry-delay 3 -o %o %u') # from /etc/makepkg.conf, https://bbs.archlinux.org/viewtopic.php?id=143333

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make -s unix
}

package() {
  set -u
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/${pkgname}/doc"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dpm755 "${srcdir}/${pkgname}-${pkgver}/${pkgname}" -t "${pkgdir}/usr/share/${pkgname}/"
  # We don't want the Windows binaries
  #install -Dpm755 "${srcdir}/${pkgname}-${pkgver}/binaries/${pkgname}.exe" -t "${pkgdir}/usr/share/${pkgname}/"
  #install -Dpm755 "${srcdir}/${pkgname}-${pkgver}/binaries/${pkgname}bg.exe" -t "${pkgdir}/usr/share/${pkgname}/"
  install -Dpm644 "README" -t "${pkgdir}/usr/share/${pkgname}/doc/"
  install -Dpm644 "CHANGES" -t "${pkgdir}/usr/share/${pkgname}/doc/"
  install -Dpm644 "COPYING" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  ln -sf "/usr/share/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  #ln -sf "/usr/share/${pkgname}/${pkgname}.exe" "${pkgdir}/usr/bin/${pkgname}.exe"
  #ln -sf "/usr/share/${pkgname}/${pkgname}bg.exe" "${pkgdir}/usr/bin/${pkgname}bg.exe"

  # Ensure there are no forbidden paths (git-aurcheck)
  ! grep -alqr "/sbin" "${pkgdir}" || echo "${}"
  ! grep -alqr "/usr/tmp" "${pkgdir}" || echo "${}"
  ! test -d "${pkgdir}/usr/sbin" || echo "${}"
  set +u
}
set +u
