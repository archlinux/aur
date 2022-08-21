# Maintainer: Zapomnij

# Do optimizations?
# Set value to 'yes' or 'no'
# If you want to distribute created package, you should set it to 'no'
[ -z ${_optimize_c11fetch} ] && _optimize_c11fetch=yes

# Install all plugins?
# Set value to 'yes' or 'no'
# If you want to distribute created package, you should set it to 'yes'
[ -z ${_allplugins} ] && _allplugins=no

pkgname=c11fetch
pkgver=1.0.0
pkgrel=1
arch=('any')

pkgdesc='Very fast tool written in C99/C11 which displays information about currently running operating system'
url='https://github.com/zapomnij/cfetch'
license=('MIT')

makedepends=(
	'meson'
	'ninja'
	'gcc'
)
depends=(
	'glibc'
)

source=("https://github.com/zapomnij/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('5080eef7019b3facc6737773879fcc30399cdfbf51b74c725d6826b99ab218f1')

_whatOSDoIHave() {
	if [ -r /etc/os-release ]; then
		osidkey=$(grep '^ID=' /etc/os-release)
		os="${osidkey#*=}"
		echo "${os}"
	else
		echo "linux"
	fi
}

_distro="$(_whatOSDoIHave)"

prepare() {
	if [ "${_optimize_c11fetch}" = "no" ]; then
		meson_opts="${meson_opts} -Denable-lto=false -Dnative-optimization=false -Dthird-optlevel=false"
	fi
	if [ "${_allplugins}" = "no" ]; then
		meson_opts="${meson_opts} -Ddisable-c11fetch-default-plugins=true"
	fi

	cd "${srcdir}/${pkgname}-${pkgver}"
	meson build --buildtype=release --strip -Dprefix=/usr ${meson_opts}
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	ninja -C build

	if [ -r "./c11fetch/plugins/${_distro}.c" ] && [ "${_allplugins}" = "no" ]; then
		if [ "${_optimize_c11fetch}" = "yes" ]; then
			_cflags="-march=native -O3 -pipe -flto"
		fi
		
		echo "Compiling plugin '${_distro}'"
		gcc "./c11fetch/plugins/${_distro}.c" -o "./build/${_distro}.so" -shared -s -fPIC ${CFLAGS} ${_cflags} ${LDFLAGS} -DPREFIX=/usr
	fi
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	meson install -C build --destdir "${pkgdir}"

	if [ -x "./build/${_distro}.so" ] && [ "${_allplugins}" = "no" ]; then
		install -dm755 "${pkgdir}/usr/share/c11fetch/plugins"
		install -m755 "./build/${_distro}.so" "${pkgdir}/usr/share/c11fetch/plugins"
	fi

	install -dm755 "${pkgdir}/usr/share/licenses/c11fetch"
	install -m644 "LICENSE" "${pkgdir}/usr/share/licenses/c11fetch"
}
