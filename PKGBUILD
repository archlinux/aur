# Maintainer: Markus Kitsinger (SwooshyCueb) <root@swooshalicio.us>

pkgname='rr-zen-workaround-dkms-git'
_pkgname_nogit="${pkgname%-git}"
_pkgname_nodkms="${_pkgname_nogit%-dkms}"
_modname="${_pkgname_nodkms//-/_}"
pkgver=0.20200921_235022.r6.g2f430f0
pkgrel=1
pkgdesc="Kernel module for disabling hw SpecLockMap optimization on AMD Zen CPUs (for rr)"
arch=('any')
url='https://gist.github.com/glandium/01d54cefdb70561b5f6675e08f2990f2'
license=('GPL2')
depends=('dkms')
makedepends=('git')
provides=('rr-zen-workaround-dkms')
conflicts=('rr-zen-workaround-dkms')
options=('!strip' '!debug')
source=("${_pkgname_nodkms}::git+https://gist.github.com/01d54cefdb70561b5f6675e08f2990f2.git"
        "dkms.conf.in"
        "Makefile.dkms")
sha384sums=('SKIP'
            '621446b40aa7bbbb0fa04bc6aacd676c487dd7f805222e930006ab8cd5602671745deb39b4424156029310986ca44d4f'
            '9429f2a19e06d22a61f02c09d95e82ceadafd09cfad879096bb67e48151b4006b7eab4c027937873231073958a98d91e')

pkgver() {
	# We have no version number, and no git tags, so make a version number
	# using the latest commit date, the number of commits in the branch, and
	# the hash of HEAD

	cd "${srcdir}/${_pkgname_nodkms}"

	# Get the latest commit date:
	_timestamp="$(git log --date=unix --full-history --date-order --format='%ct%n%at' | sort -nr | head -1)"
	_datestr="$(date -d @"${_timestamp}" -u +'%Y%m%d_%H%M%S')"

	# Get commit count:
	_commit_qty="$(git rev-list --count HEAD)"

	# Get commit hash:
	_commit_hash="$(git rev-parse --short HEAD)"

	echo "0.${_datestr}.r${_commit_qty}.g${_commit_hash}"
}

build() {
	# pkgver is not updated until after prepare, so this needs to be in build()
    sed -e "s/@PACKAGE_VERSION@/${pkgver}/g" "${srcdir}/dkms.conf.in" > "${srcdir}/dkms.conf"
}

package() {
	# module src dir
	_pkgmoddir="${pkgdir}/usr/src/${_pkgname_nodkms}-${pkgver}"
	# create module src dir
	install -dm755 "${_pkgmoddir}"
	# install module source files
	cp -r "${srcdir}/${_pkgname_nodkms}"/* "${_pkgmoddir}"
	# install dkms.conf
	install -Tm644 "${srcdir}/dkms.conf" "${_pkgmoddir}/dkms.conf"
	# install our Makefile
	rm -f "${_pkgmoddir}/Makefile"
	install -Tm644 "${srcdir}/Makefile.dkms" "${_pkgmoddir}/Makefile"
}
