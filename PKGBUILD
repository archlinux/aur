# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgbase=schily-tools
pkgname=(schily-tools-{sdd,star})
pkgdesc='Set of tools maintained by Jorg Schilling'
pkgver=2023.01.12
pkgrel=1
url=https://codeberg.org/schilytools/schilytools
arch=(x86_64)
license=(custom:CDDL)
depends=(libcap)
_version=${pkgver//./-}
source=("https://mirrors.dotsrc.org/schilytools/schily-${_version}.tar.bz2")
b2sums=('9604f43858b71783378ca90cf6563f8ab0cdbe0b993fc0ae4cf3bc8a0674f5e30bf6de5d01a0084669fa0b52cc779716dab054158354f9c0b63e49592c85e0c7')

_tools=(
	sdd
	star
)
_deps=(
	libdeflt
	libfind
	libschily
	libmdigest
	librmt
)

build () {
	cd "schily-${_version}"
	
	for i in "${_deps[@]}" "${_tools[@]}"; do
		msg2 "Building $i..."
		make -C "$i" GMAKE_NOWARN=true INS_BASE=/usr \
			CFLAGS="${CFLAGS}" LDOPTX="${LDFLAGS}" CC="${CC}"
	done
}

_installone () {
	local subdir=$1
	pkgdesc=$2
	shift 2
	depends+=("$@")

	cd "schily-${_version}"
	make -C "${subdir}" GMAKE_NOWARN=true INS_BASE=/usr DESTDIR="${pkgdir}" install

	install -Dm644 CDDL.Schily.txt \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_schily-tools-sdd () {
	_installone sdd 'Replacement for "dd" included with schily-tools'
}

package_schily-tools-star () {
	_installone star \
		'Fast POSIX-compliant tape archiver included with schily-tools' \
		acl bash

	# Remove "tar" symlink to avoid conflicts with GNU tar.
	rm -f "${pkgdir}/usr/bin/tar"
}
