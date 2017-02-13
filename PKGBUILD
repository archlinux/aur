# Maintainer: brent s. <bts[at]square-r00t[dot]net>
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
pkgname=bdisk-git
pkgver=3.01
pkgrel=2
#_pkgver=${pkgver}
pkgdesc="An easy liveCD creator built in python. Supports hybrid ISOs/USB, iPXE, and UEFI"
arch=( 'i686' 'x86_64' )
url="https://bdisk.square-r00t.net"
license=( 'GPL3' )
depends=('dosfstools'
	'gcc-multilib'
	'gcc-libs-multilib'
	'git'
	'libisoburn'
	'dosfstools'
	'squashfs-tools'
	'python'
	'python-gitpython'
	'python-humanize'
	'python-jinja'
	'python-psutil'
	'python-patch'
	'python-pygpgme'
	'python-pyopenssl'
	'python-validators')
#makedepends=( 'python' )
makedepends=()
_pkgname=bdisk
conflicts=('bdisk')
provides=('bdisk')
install=
changelog=
noextract=()
optdepends=('rsync: for rsync syncing'
	'syslinux: for ipxe support')
source=("${_pkgname}::git+git://git.square-r00t.net/bdisk.git")
sha512sums=('SKIP')
pkgver() {
  cd "${srcdir}/${_pkgname}"
  # no tags, so number of revisions e.g. r1142.a17a017
  #printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  ## most recent annotated tag e.g. 2.0.r6.ga17a017
  #git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
  ## most recent un-annotated tag e.g. 0.71.r115.gd95ee07
  #git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
  ## or:
  git describe --tags | sed 's/^v//;s/-/./g ; s/[\.-]beta.*$//gI'
  ## project uses tags with prefix. e.g. v...
  #git describe --long | sed 's/^foo-//;s/\([^-]*-g\)/r\1/;s/-/./g'
  ## both with fallback, e.g. 0.9.9.r27.g2b039da with tags, else r1581.2b039da
  #( set -o pipefail
  #  git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
  #  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  #)
}
package() {

	install -d -m0750 ${pkgdir}/etc/${_pkgname}
	install -d -m0755 ${pkgdir}/usr/share/${_pkgname}
	install -d -m0755 ${pkgdir}/usr/share/doc/${_pkgname}
	install -d -m0755 ${pkgdir}/var/lib/${_pkgname}
	install -d -m0755 ${pkgdir}/usr/bin

	cp -af ${srcdir}/${_pkgname}/docs/* ${pkgdir}/usr/share/doc/${_pkgname}/.
	cp -af ${srcdir}/${_pkgname}/examples ${pkgdir}/usr/share/doc/${_pkgname}/.
	curl -s -o ${pkgdir}/usr/share/doc/${_pkgname}/README.html https://bdisk.square-r00t.net/
	cp -af ${srcdir}/${_pkgname}/overlay ${pkgdir}/var/lib/${_pkgname}/.
	cp -af ${srcdir}/${_pkgname}/extra ${pkgdir}/var/lib/${_pkgname}/.
	cp -af ${srcdir}/${_pkgname}/${_pkgname}/* ${pkgdir}/usr/share/${_pkgname}/.
	mv -f ${pkgdir}/var/lib/${_pkgname}/extra/pkg.build.ini ${pkgdir}/etc/${_pkgname}/dist.build.ini
	rm -f ${pkgdir}/var/lib/${_pkgname}/extra/dist.build.ini
	ln -sf /usr/share/bdisk/bdisk.py ${pkgdir}/usr/bin/${_pkgname}

}
