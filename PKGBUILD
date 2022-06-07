# Maintainer: Christopher KOBAYASHI <software+aur@disavowed.jp>
# Packager: Christopher KOBAYASHI <software+aur@disavowed.jp>
pkgname=scsi2sd-git
_gitname=SCSI2SD
pkgver=r171.026583b
pkgrel=1
pkgdesc="Utilities for SCSI2SD (v5.x hardware)"
url="http://www.codesrc.com/mediawiki/index.php?title=SCSI2SD"
arch=('i686' 'x86_64' 'aarch64')
license=('MIT')
makedepends=('git')
depends=('wxgtk3' 'hidapi' 'zlib' 'expat' 'webkit2gtk')
source=('git://www.codesrc.com/git/SCSI2SD'
	'SCSI2SD.diff'
	'https://www.codesrc.com/files/scsi2sd/latest/firmware/firmware_bundle-v4.8.04.scsi2sd'
	)
sha256sums=(	'SKIP'
		'SKIP'
		'504c106ebff5a2f2f7483cf6ccfb33521e3a39bd9e9986a523ce8f01759cf0ea'
	)

pkgver() {
  cd "$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$_gitname"
  local i; for i in "${source[@]}"; do
    case $i in
      *.diff)
        msg2 "Applying patch ${i}"
        patch -p1 -i "${srcdir}/${i}"
    esac
  done
}

build() {
  cd "$_gitname/software/scsi2sd-util"
  make USE_SYSTEM=Yes
}
 
package() {
  cd "$_gitname/software/scsi2sd-util"
  make install DESTDIR="${pkgdir}"
  for i in "${srcdir}"/*.scsi2sd; do
    install -D -m 644 "${i}" "${pkgdir}/usr/share/scsi2sd/$(basename ${i})"
  done
}
