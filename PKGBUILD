# Maintainer: Samuel Forestier <dev+archey@samuel.domains>


##################### How to package latest release ? #####################
#### Install required dependencies...
##
## $ pacman -S base-devel pacman-contrib namcap
## $ pacman -S python-setuptools python-distro python-netifaces
##
#### Clone this very repository...
##
## $ git clone https://aur.archlinux.org/archey4.git
## $ cd archey4/
##
#### Edit PKGBUILD as needed...
##
## $ updpkgsums
## $ makepkg
## $ namcap PKGBUILD
## $ pacman -U ./archey4-*-any.pkg.tar.zst
## $ archey
## $ makepkg --printsrcinfo > .SRCINFO
## $ git commit -a
## $ git push
###########################################################################


pkgname=archey4
pkgver=v4.10.0
pkgrel=1
pkgdesc="A simple system information tool written in Python"
arch=('any')
url="https://github.com/HorlogeSkynet/archey4.git"
license=('GPLv3')
groups=('utils')
depends=('procps-ng' 'python>=3.5' 'python-distro' 'python-netifaces')
makedepends=('python-setuptools')
optdepends=('bind-tools: WAN_IP would be detected faster'
            'lm_sensors: Temperature would be more accurate'
            'pciutils: GPU wouldn'"'"'t be detected without it'
            'wmctrl: WindowManager would be more accurate'
            'virt-what: Model would contain details about the hypervisor')
provides=('archey')
conflicts=('archey-git' 'archey2' 'archey3-git' 'pyarchey')
install="${pkgname}.install"
backup=("etc/${pkgname}/config.json")
source=("${pkgname}_${pkgver}-${pkgrel}.tar.gz::https://github.com/HorlogeSkynet/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('eeed20dc870dbf94b89e185d87c643f1')
sha1sums=('cc42e7a372169ca94c6f630c5d46420fe8a38d6f')


build() {
	cd "${srcdir}/${pkgname}-${pkgver:1}"

	# Prepare and compress the manual page.
	sed -e "s/\${DATE}/$(date +'%B %Y')/1" archey.1 | \
		sed -e "s/\${VERSION}/${pkgver:1}/1" | \
			gzip -c --best - > dist/archey.1.gz

	python3 setup.py build
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver:1}"

	python3 setup.py -q install \
		--root="$pkgdir" \
		--optimize=1 \
		--skip-build

	# Configuration file.
	install -D -m0644 config.json "${pkgdir}/etc/${pkgname}/config.json"

	# Manual page.
	install -D -m0644 dist/archey.1.gz "${pkgdir}/usr/share/man/man1/archey.1.gz"

	# Meta-data files.
	install -D -m0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -D -m0644 README.md "${pkgdir}/usr/share/${pkgname}/README.md"
	install -D -m0644 COPYRIGHT.md "${pkgdir}/usr/share/${pkgname}/COPYRIGHT.md"
}

check() {
	cd "${srcdir}/${pkgname}-${pkgver:1}"

	python3 -m unittest
}
