# Maintainer: Samuel FORESTIER <dev+archey@samuel.domains>


##################### How to package latest release ? #####################
## $ pacman -S base-devel python-setuptools python-distro python-netifaces
##
## $ git clone https://aur.archlinux.org/archey4.git
## $ cd archey4/
##
#### Edit PKGBUILD as needed...
##
## $ makepkg -g >> PKGBUILD
##
#### Please clean fingerprints in PKGBUILD...
##
## $ makepkg
## $ pacman -U ./archey4-*-any.pkg.tar.xz
## $ archey
## $ makepkg --printsrcinfo > .SRCINFO
## $ git commit -a
## $ git push
###########################################################################


pkgname=archey4
pkgver=v4.7.0
pkgrel=1
pkgdesc="A simple system information tool written in Python"
arch=('any')
url="https://github.com/HorlogeSkynet/archey4.git"
license=('GPLv3')
group=('utils')
depends=('procps' 'python' 'python-distro' 'python-netifaces')
makedepends=('python-setuptools')
optdepends=('bind-tools: WAN_IP would be detected faster'
            'lm-sensors: Temperature would be more accurate'
            'pciutils: GPU wouldn'"'"'t be detected without it'
            'wmctrl: WindowManager would be more accurate'
            'virt-what: Model would contain details about the hypervisor')
provides=('archey')
conflicts=('archey-git' 'archey2' 'archey3-git' 'pyarchey')
install="${pkgname}.install"
backup=("etc/${pkgname}/config.json")
source=("https://github.com/HorlogeSkynet/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('c67baab6853eda2bd9cfd8544c09b040')
sha1sums=('75ad2d86a4c7051fae5483ce4a87aec741505fa0')


build() {
	cd "${srcdir}/${pkgname}-${pkgver:1}"

	python3 setup.py build
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver:1}"

	python3 setup.py -q install \
		--root="$pkgdir" \
		--optimize=1 \
		--skip-build

	install -D -m0644 archey/config.json "${pkgdir}/etc/${pkgname}/config.json"

	install -D -m0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -D -m0644 README.md "${pkgdir}/usr/share/${pkgname}/README.md"
	install -D -m0644 COPYRIGHT.md "${pkgdir}/usr/share/${pkgname}/COPYRIGHT.md"
}

check() {
	cd "${srcdir}/${pkgname}-${pkgver:1}"

	python3 -m unittest
}
