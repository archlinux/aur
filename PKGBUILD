# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgbase=schily-tools
pkgname=(schily-tools-{sdd,star})
pkgdesc='Set of tools maintained by Jorg Schilling'
pkgver=2021.09.18
pkgrel=1
url=http://schilytools.sourceforge.net/
arch=(x86_64)
license=(custom:CDDL)
depends=(libcap)
_version=${pkgver//./-}
source=("https://sourceforge.net/projects/schilytools/files/schily-${_version}.tar.bz2")
b2sums=('b9dba48d64aa4924517b75dfba4231ac367e60121d03b47e093d82dfb69a70a5b80788c535206305ec094686e2210d254a1aa19abc8774f6d6afbc11d8ab1407')

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

SMAKE="${startdir}/src/schily-${_version}/psmake/smake"

build () {
	cd "schily-${_version}"
	
	if [[ ! -x $SMAKE ]]; then
		msg2 'Bootstrapping smake...'
		cd psmake
		sh ./MAKE-sh
		cd ..
	fi

	for i in "${_deps[@]}" "${_tools[@]}"; do
		msg2 "Building $i..."
		"$SMAKE" -r -C "$i" INS_BASE=/usr \
			CFLAGS="${CFLAGS}" LDOPTX="${LDFLAGS}" CC="${CC}"
	done
}

_installone () {
	local subdir=$1
	pkgdesc=$2
	shift 2
	depends+=("$@")

	cd "schily-${_version}"
	"$SMAKE" -r -C "${subdir}" INS_BASE=/usr DESTDIR="${pkgdir}" install

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
