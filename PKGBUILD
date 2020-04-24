# Maintainer: Samuel FORESTIER <dev+archey@samuel.domains>


##################### How to package latest release ? #####################
#### Install required dependencies...
##
## $ pacman -S base-devel pacman-contrib
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
## $ pacman -U ./archey4-*-any.pkg.tar.xz
## $ archey
## $ makepkg --printsrcinfo > .SRCINFO
## $ git commit -a
## $ git push
###########################################################################


pkgname=archey4
pkgver=v4.7.1
pkgrel=1
pkgdesc="A simple system information tool written in Python"
arch=('any')
url="https://github.com/HorlogeSkynet/archey4.git"
license=('GPLv3')
group=('utils')
depends=('procps-ng' 'python>=3.4' 'python-distro' 'python-netifaces')
makedepends=('python-setuptools')
optdepends=('bind-tools: WAN_IP would be detected faster'
            'lm_sensors: Temperature would be more accurate'
            'pciutils: GPU wouldn'"'"'t be detected without it'
            'wmctrl: WindowManager would be more accurate'
            'virt-what: Model would contain details about the hypervisor'
            'btrfs-progs: Disk would support BTRFS in usage computations')
provides=('archey')
conflicts=('archey-git' 'archey2' 'archey3-git' 'pyarchey')
install="${pkgname}.install"
backup=("etc/${pkgname}/config.json")
source=("https://github.com/HorlogeSkynet/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('ceb144368ac7f10557cdf540f60fe319')
sha1sums=('c2148ae6aa8472919fd38d6282817de007addb38')


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

	# Temporary workaround for `d559edc52d839654989f1b39e6b0d3159bb71497` upstream.
	# Rationale : Arch Linux actually CONTAINED an os-release(5) `ANSI_COLOR`.
	rm archey/test/test_archey_output.py

	python3 -m unittest
}
