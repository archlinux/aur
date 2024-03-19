# Maintainer: Fabian Maurer <dark.shadow4@web.de>
# Contributor: Jens Staal <staal1978@gmail.com>
# Contributor : ackalker
pkgname=openwatcom-v2
pkgver=2.0_2024_03_01
pkgrel=1
pkgdesc="The Open Watcom Fortran/C/C++ compiler, binary distribution -V2 fork"
arch=('x86_64')
#url="http://www.openwatcom.org"
url="https://github.com/open-watcom"
license=('custom:OWPL-1')
source=(
'https://github.com/open-watcom/open-watcom-v2/releases/download/2024-03-01-Build/ow-snapshot.tar.xz'
'owsetenv.sh'
)
noextract=('ow-snapshot.tar.gz')
md5sums=('bfd38da3e929655048fc8c0dd5077aae'
         '2abd462742068d76a5cf1753b128ac94')
options=(!strip)

build() {
	ls 
}

package() {
	mkdir -p "${pkgdir}/opt/watcom"
	bsdtar -xf "${srcdir}/ow-snapshot.tar.xz" -C "${pkgdir}/opt/watcom"
	rm -rf "${pkgdir}/opt/watcom/binw"
	rm -rf "${pkgdir}/opt/watcom/binnt"
	rm -rf "${pkgdir}/opt/watcom/binp"
	rm -rf "${pkgdir}/opt/watcom/binnt64"
	install -d "${pkgdir}/usr/share/licenses/watcom"
	install -Dm644 "$pkgdir/opt/watcom/license.txt" "$pkgdir/usr/share/licenses/watcom/license.txt"

	cp "${srcdir}/owsetenv.sh" ${pkgdir}/opt/watcom/

	msg "correct permissions for header directories"
	chmod -R 755 $pkgdir/opt/watcom/{h,lh}
	
	msg "adding some fake binaries to make life easier"
	cd $pkgdir/opt/watcom/binl
	ln -s /usr/bin/true ranlib
	ln -s wlib ar

    # fix ownership
     chown -R root:root $pkgdir/opt/watcom/
} 
