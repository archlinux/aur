# Maintainer: @RubenKelevra <rubenkelevra@gmail.com>
# Contributor: Magnus Lång <magnus.lang@it.uu.se>

_pkgname='nidhugg'
pkgname="${_pkgname}-git"
pkgver=0.4.r118.ce12f523
pkgrel=1
pkgdesc='A bug-finding tool for concurrency and weak-memory bugs in C and C++ programs'
arch=('x86_64')
url="https://github.com/nidhugg/${_pkgname}"
license=('GPL-3.0-or-later')
depends=(
	'clang19'
	'hwloc'
	'libffi'
	'llvm19-libs'
	'python'
)
makedepends=(
	'boost'
	'git'
	'llvm19'
)
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=(
	"git+${url}.git"
	'llvm19-command-line.patch'
)
b2sums=(
	'SKIP'
	'09ffb83cdcfba933ec5de7ff60529c6e12c8416d71e5c9e5d518d124f21dfa09bf0cf1215a9100bd94aad29836d4c50939fd8c356c50e14180a1c479f701860a'
)

pkgver() {
	cd -- "${_pkgname}" || return 1
	local version_commit
	local version

	version_commit="$(git blame --porcelain configure.ac | sed -n '1s/ .*//p')"
	[[ -n "${version_commit}" ]] || return 1
	version="$(sed -n '1s/^AC_INIT(\[Nidhugg\], \[\([^]]*\)\].*/\1/p' configure.ac)"
	[[ -n "${version}" ]] || return 1

	printf '%s.r%s.%s' \
		"${version}" \
		"$(git rev-list --count "${version_commit}"..HEAD)" \
		"$(git rev-parse --short HEAD)"
}

prepare() {
	cd -- "${_pkgname}" || return 1
	patch -Np1 -i "${srcdir}/llvm19-command-line.patch"
	autoreconf -fi
}

build() {
	cd -- "${_pkgname}" || return 1
	./configure \
		--prefix=/usr \
		--disable-popcnt \
		--with-llvm=/usr/lib/llvm19 \
		--with-clang=/usr/lib/llvm19/bin/clang \
		--with-clangxx=/usr/lib/llvm19/bin/clang++
	make
}

check() {
	cd -- "${_pkgname}" || return 1
	PATH="${PWD}/src:${PATH}" make test
}

package() {
	cd -- "${_pkgname}" || return 1
	make DESTDIR="${pkgdir}" install
}
