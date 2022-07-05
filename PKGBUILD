# Maintainer: Christopher KOBAYASHI <software+aur@disavowed.jp>
# Packager: Christopher KOBAYASHI <software+aur@disavowed.jp>

pkgname=scsi2sd-v6-git
_gitname=SCSI2SD-V6
pkgver=r279.bd80a3d2
pkgrel=1
pkgdesc="Utilities for SCSI2SD (v6 hardware)"
url="http://www.codesrc.com/mediawiki/index.php?title=SCSI2SD"
arch=('x86_64' 'aarch64')
license=('MIT')
makedepends=('git')
depends=('wxgtk3' 'hidapi' 'zlib' 'expat' 'dfu-util' 'webkit2gtk')
source=('git://www.codesrc.com/git/SCSI2SD-V6'
	'SCSI2SD-V6.diff'
	'https://www.codesrc.com/files/scsi2sd-v6/latest/firmware.V6.2020.dfu'
	'https://www.codesrc.com/files/scsi2sd-v6/latest/firmware.V6.2021-FS.dfu'
	'https://www.codesrc.com/files/scsi2sd-v6/latest/firmware.V6.2021.dfu'
	'https://www.codesrc.com/files/scsi2sd-v6/latest/firmware.V6.revF.dfu'
	)
sha256sums=(	'SKIP'
		'SKIP'
		'SKIP'
		'SKIP'
		'SKIP'
		'SKIP'
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
#  (cd "$_gitname/src/scsi2sd-util6/dfu-util"; ./autogen.sh )
  cd "$_gitname/src/scsi2sd-util6"
  make USE_SYSTEM=Yes "${PWD}"/build/linux/scsi2sd-util6 "${PWD}"/build/linux/scsi2sd-test
}
 
package() {
  cd "$_gitname/src/scsi2sd-util6"
  make install DESTDIR="${pkgdir}"
  for i in "${srcdir}"/*.dfu; do
    install -D -m 644 "${i}" "${pkgdir}/usr/share/scsi2sd-v6/$(basename ${i})"
  done
}
