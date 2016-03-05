# Maintainer: Sonic-Y3k <sonic.y3k@googlemail.com>

pkgname=mitmf-git
pkgdesc="Framework for Man-In-The-Middle attacks."
pkgver=r429.06ef1da
pkgrel=1
arch=('any')
url="https://github.com/byt3bl33d3r/MITMf"
license=('GNU')
provides=('mitmf')
makedepends=('git')
depends=('python2' 'libnetfilter_queue' 'libpcap' 'libjpeg-turbo' 'capstone' 'python2-pyinotify' 'python2-crypto' 'python2-pyasn1' 'python2-cryptography' 'python2-pillow' 'python2-netaddr' 'scapy' 'python2-dnslib' 'python2-twisted' 'python2-lxml' 'python2-pefile' 'python2-ipy' 'python2-user-agents' 'python2-pyopenssl' 'python2-service-identity' 'python2-configobj' 'python2-flask' 'python2-dnspython' 'python2-beautifulsoup4' 'python2-capstone' 'python2-magic' 'python2-msgpack' 'python2-requests' 'python2-pypcap' 'python2-chardet' 'python2-netfilterqueue-git' 'python2-ua-parser')
source=("${pkgname}::git+https://github.com/byt3bl33d3r/MITMf"
		"chdir.patch")
sha256sums=('SKIP'
			'fa44f049c26e3bf2f911def34d70c047679217ded4612eb2996c5444245c3939')
options=(!strip)

pkgver() {
	cd "${srcdir}/${pkgname}"
	( set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

prepare() {
	cd "${srcdir}/${pkgname}"
	git submodule init
	git submodule update --recursive
	patch -p0 < ../chdir.patch
}

package() {
	# create required directories
	install -d "${pkgdir}/opt"
	install -d "${pkgdir}/usr/bin"
	
	# copy required files
	cp -r "${srcdir}/${pkgname}" "${pkgdir}/opt/MITMf"
	chmod +x "${pkgdir}/opt/MITMf/mitmf.py"

	# install link
	ln -s "/opt/MITMf/mitmf.py" "${pkgdir}/usr/bin/mitmf"

}

