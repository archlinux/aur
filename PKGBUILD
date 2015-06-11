# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=cerberus
pkgver=1428445301
pkgrel=1
pkgdesc="A compile-time configurable minimal login program that uses libpassphrase"
url="https://github.com/GNU-Pony/cerberus"
arch=(i686 x86_64)
license=(GPL3)
depends=(glibc 'libpassphrase>=1400850322' linux)
makedepends=(make coreutils gcc texinfo) # pam
install=cerberus.install
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=(d091f96e3ef95a0501a8ab4370f322b8fa8d1307097855ca5530757923cb0937)

# The dependency on `linux` can be removed if both `OWN_VCS` and `OWN_VCSA` is removed.
# The dependency on `pam` can removed if `auth` is change to not be `pam`.
# See `info cerberus configuring` for details on how to configure `cerberus`.
# Works on armv6h (tested on Raspberry Pi) unless `auth=pam`.


_conf=()

prepare() {
	auth=crypt # can also be set to `crypt` or `none` # pam
	cpp_defs=(OWN_VCS OWN_VCSA USE_TTY_GROUP)
	path_user=/usr/local/bin:/usr/bin
	path_root=/usr/local/sbin:/usr/local/bin:/usr/bin
	
	cpp_flags=()
	for def in "${cpp_defs[@]}"; do
	    cpp_flags+=( -D"${def}" )
	done
	cpp_flags="EXTRA_CPP_FLAGS=${cpp_flags[*]}"
	
	_conf+=( AUTH="${auth}" PATH="${path_user}" PATH_ROOT="${path_root}" "${cpp_flags}" )
}

build() {
	cd "${srcdir}/cerberus-${pkgver}"
	
	make PKGNAME="${pkgname}" INSTALL_BIN=/bin "${_conf[@]}"
}

package() {
	cd "${srcdir}/cerberus-${pkgver}"
	
	_conf=()
	prepare
	make PKGNAME="${pkgname}" INSTALL_BIN=/bin DESTDIR="${pkgdir}" "${_conf[@]}" install
	
	_dir="${pkgdir}/usr/share/licenses/${pkgname}"
	ln -sf -- "/usr/share/licenses/common/GPL3" "${_dir}/LICENSE"
}

