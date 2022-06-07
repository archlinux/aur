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
depends=('wxgtk3' 'hidapi' 'zlib' 'expat')
source=('git://www.codesrc.com/git/SCSI2SD'
	'SCSI2SD.diff'
	'http://www.codesrc.com/files/scsi2sd/latest/firmware/firmware_bundle-v4.8.03.scsi2sd'
	)
sha256sums=(	'SKIP'
		'SKIP'
		'6ea2a98eefffa76a923ad1afa7cd08b45926c49742a489ce4452846b0feffb60'
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
  install -D -m 644 "${srcdir}/firmware_bundle-v4.8.03.scsi2sd" "${pkgdir}/usr/share/scsi2sd/firmware_bundle-v4.8.03.scsi2sd"
}
