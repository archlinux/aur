# Maintainer: Markus Kitsinger (SwooshyCueb) <root@swooshalicio.us>

pkgname=ovpn-dco-dkms-git
pkgver=0.20230327.r477.git961c60d
pkgrel=1
pkgdesc='Optional Data Channel Offload kernel module for OpenVPN 3'
arch=('any')
url='https://github.com/OpenVPN/ovpn-dco'
license=('GPL2')
depends=('dkms')
makedepends=('git')
provides=('ovpn-dco' 'ovpn-dco-dkms')
conflicts=('ovpn-dco' 'ovpn-dco-git' 'ovpn-dco-dkms')
source=('git+https://github.com/OpenVPN/ovpn-dco.git'
        dkms.conf.in)
b2sums=('SKIP'
        '4c4d9ef50500f76766861dd7037974b71f3d7183897095e78d91db7ec6416e7d43e2a6bbb9f2625143845b5762f1ebc12b559b909944948d27deb26bb9c96226')

pkgver() {
	# Debian packages are currently versioned like so:
	# 	0.YYYYMMDD~gitXXXXXXX
	# where:
	# 	YYYYMMDD is some date
	# 	XXXXXXX is the first 7 characters of the commit hash
	#
	# The date used is *probably* the day the package was built, as the date
	# for the package using commit 8f04ed8 was 2020-12-08, but this commit's
	# author date and committer date are 2020-12-04
	#
	# For our packages, we will use a somewhat similar method for generating
	# the version number:
	# 	0.YYYYMMDD.r$REVCT.gitXXXXXXX
	# where:
	# 	YYYYMMDD is the committer date (utc)
	# 	$REVCT is the number of commits in the log for HEAD
	# 	XXXXXXX is the first 7 characters of the commit hash
	#
	# We pick the committer date instead of the author date, as the commiter
	# date when the commit was last modified, including rebases, while the
	# author date is (typically) when the commit was first created. Any number
	# of things could happen during the development of a project that would
	# cause the author dates to not be sequential.
	#
	# We do not use tags, as currently the tags are named like so:
	# 	linux-client-vNN
	# where:
	# 	NN is the version number of the targeting openvpn3-linux client
	# Furthermore, it seems that the naming conventions for the tags is likely
	# to change.

	cd "${srcdir}/ovpn-dco"

	committerdate="$(git show -s --format="%ci")"
	datepart=$(date --date="$committerdate" -u "+%Y%m%d")
	revct=$(git rev-list --count HEAD)
	hash=$(git rev-parse --short HEAD)
	echo "0.${datepart}.r${revct}.git${hash}"
}

package() {
	cd "${srcdir}"

	install -dm755 "${pkgdir}/usr/src/ovpn-dco-${pkgver}"
	cp -r "${srcdir}/ovpn-dco"/* "${pkgdir}/usr/src/ovpn-dco-${pkgver}"

	sed -e "s/@PKGVER@/${pkgver}/" "${srcdir}/dkms.conf.in" > "${srcdir}/dkms.conf"
	install -Tm644 "${srcdir}/dkms.conf" "${pkgdir}/usr/src/ovpn-dco-${pkgver}/dkms.conf"
}
