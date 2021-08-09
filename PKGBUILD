# Maintainer: Tim Paik <timpaik@163.com>
_pkgname=nvs
pkgname=nvs-git
pkgver=v1.6.0.r15.g024dea3
pkgver() {
	cd ${_pkgname}
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
_nodever=12.22.2
pkgrel=1
pkgdesc="A cross-platform tool for switching between versions and forks of Node.js"
arch=('x86_64')
url="https://github.com/jasongin/nvs"
license=('MIT')
depends=('openssl' 'zlib')
makedepends=('git')
install=nvs.install
source=("https://nodejs.org/dist/v${_nodever}/node-v${_nodever}-linux-x64.tar.xz"
	"nvs.sh"
	"${_pkgname}::git+https://github.com/jasongin/nvs.git")
sha256sums=('c17f838cec2eb111048342543d23a74bcab7459a4374615ff4124940a717377a'
            '1603479565d3e85c3db26c6dcdecd73b31c702a606e5913368b8b1ae2979ddcb'
            'SKIP')
prepare() {
	install -pD ${srcdir}/node-v${_nodever}-linux-x64/bin/node ${srcdir}/${_pkgname}/cache/node
	sed -i 's/\/usr\/local\//\/opt\//g' ${srcdir}/${_pkgname}/lib/install.js
	# enable nvsudo link
}
package() {
	install -D ${srcdir}/${_pkgname}.sh ${pkgdir}/etc/profile.d/${_pkgname}.sh
	install -D ${srcdir}/${_pkgname}/LICENSE.txt ${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE
	install -d ${pkgdir}/opt/${_pkgname}/
	cp -r ${srcdir}/${_pkgname}/* ${pkgdir}/opt/${_pkgname}/
}
