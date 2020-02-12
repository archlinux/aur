# Maintainer: Joan Figueras <ffigue at gmail dot com>
# Contributor: Luca Contini <jkd[dot]luca[at]gmail[dot]com>

branch=-loki # development branch
pkgname=asbru-cm${branch}-git
_pkgname=asbru
_fpkgname=asbru-cm
pkgver=6.0.3.r71.gedf1ea9
pkgrel=1
arch=('any')
license=('GPL3')
pkgdesc="A free and open-source connection manager. ${branch#-} development branch. GIT version"
url="https://github.com/asbru-cm/asbru-cm"
depends=('perl' 'vte3' 'cairo-perl' 'glib-perl' 'pango-perl' 'perl-socket6' 'perl-expect' 'perl-yaml' 'perl-crypt-cbc' 'perl-crypt-blowfish' 'perl-gtk3' 'perl-net-arp' 'uuid' 'openssh' 'inetutils' 'perl-crypt-rijndael' 'perl-xml-parser' 'libcanberra' 'perl-gtk3-simplelist' 'libwnck3' 'perl-io-stty' 'perl-io-tty')
optdepends=('uucp: Unix-to-Unix Copy' 'rdesktop: RDP connections' 'freerdp: RDP connections' 'openssh: SSH connections' 'mosh: Mobile shell' 'tigervnc: for VNC connections'
	    'perl-x11-guitest: To fit perfectly RDP tabs')
makedepends=('git')
#conflicts=()
source=("git+https://github.com/asbru-cm/asbru-cm.git#branch=${branch#-}")
sha256sums=('SKIP')

pkgver() {
  cd "${_fpkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
        cd "${_fpkgname}"
        sed -e "s/Exec=.*${_fpkgname}/&${branch}/g" -e "s/Name=Ásbrú.*/& (${branch#-})/g" -e "s/Icon=${_fpkgname}/&${branch}/g" -i res/${_fpkgname}.desktop
}

package() {
	cd "${_fpkgname}"
	mkdir -p $pkgdir/{opt/${_fpkgname}${branch},usr/share/pixmaps,usr/share/man/man1,usr/share/applications,usr/bin,etc/bash_completion.d}
	cp -rp res utils lib $pkgdir/opt/${_fpkgname}${branch}/
	cp -p res/${_pkgname}_bash_completion $pkgdir/etc/bash_completion.d/${_pkgname}${branch}_bash_completion
	cp res/${_pkgname}-logo-64.png $pkgdir/usr/share/pixmaps/${_fpkgname}${branch}.png
	cp res/${_fpkgname}.desktop $pkgdir/usr/share/applications/${_fpkgname}${branch}.desktop
	gzip -c res/${_fpkgname}.1 > $pkgdir/usr/share/man/man1/${_fpkgname}${branch}.1.gz
	cp -p ${_fpkgname} $pkgdir/opt/${_fpkgname}${branch}/${_fpkgname}${branch}
	chmod 755 $pkgdir/opt/${_fpkgname}${branch}/${_fpkgname}${branch}
	ln -sf /opt/${_fpkgname}${branch}/${_fpkgname}${branch} $pkgdir/usr/bin/${_fpkgname}${branch}
}


