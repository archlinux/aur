# Maintainer: Tomasz Maciej Nowak <com[dot]gmail[at]tmn505>
# based on package v4l-dvb-git by Olaf Bauer <obauer@freenet.de>

# All my PKGBUILDs are managed at https://github.com/tmn505/AUR

_kernver="$(uname -r)"
_packernver="$(sed -e 's/-.*//' -e 's/\.0//' <<< "${_kernver}")"
_extramodules="extramodules-$(sed 's/\.[0-9]*-[0-9]*-/-/' <<< "${_kernver}")"
pkgname=v4l-dvb-crazycat-git
pkgver=4.16rc4_r943.7ae4d8a8273b
pkgrel=1
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/crazycat69/linux_media"
license=('GPL2')
pkgdesc="V4L-DVB device drivers also with out-of-tree and staging ones (thanks to crazycat and ljalves)"
makedepends=('bc' 'git' 'linux-headers' 'patchutils' 'perl-proc-processtable' 'wget')
depends=('kmod' "linux=${_packernver}")
conflicts=('v4l-dvb-git' 'tbs-dvb-drivers')
options=('!strip')
install=v4l-dvb-crazycat.install
source=("git+https://bitbucket.org/CrazyCat/media_build.git"
        "git+${url}.git")
sha256sums=('SKIP'
            'SKIP')

prepare() {
	cd ${srcdir}/media_build/linux
	make tar DIR="${srcdir}/linux_media"
	cd ..
	make untar
}

pkgver() {
	cd ${srcdir}/linux_media
	printf "%s_r%s.%s" \
		"$(make kernelversion | sed 's/\.0-//')" \
		"$(git rev-list --no-merges --count `git log --pretty=format:%H --author="Linus Torvalds" --grep="Linux ." -n 1 -- Makefile`..HEAD)" \
		"$(git rev-parse --short HEAD)"
}

build() {
	cd ${srcdir}/media_build
	make VER="${_kernver}" KERNELRELEASE="${_kernver}" stagingconfig
	make VER="${_kernver}" KERNELRELEASE="${_kernver}"
}

package() {
	# set correct depmod command for install
	cp -f "${startdir}/${install}" "${startdir}/${install}.pkg"
	true && install=${install}.pkg
	sed \
		-e "s/KERNEL_VERSION=.*/KERNEL_VERSION=${_kernver}/" \
		-i "${startdir}/${install}"
	# package modules
	cd ${srcdir}/media_build
	sed -i '/^[^#].*depmod/s/^/#/' v4l/Makefile.media
	make \
		KERNELRELEASE="${_kernver}" \
		DESTDIR="${pkgdir}" \
		KDIR26="/usr/lib/modules/${_extramodules}/crazycat" \
		FW_DIR="/dev/null" \
		install
	find ${pkgdir} -name '*.ko' -exec gzip -9 {} \;
}
