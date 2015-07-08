# Maintainer: Troy Engel <troyengel+arch@gmail.com>
# Contributor: Adrian Perez de Castro <aperez@igalia.com>
pkgname='perf-tools-git'
pkgdesc='Performance analysis tools based on Linux perf_events (aka perf) and ftrace'
pkgver=r171.30ff475
pkgrel=1
arch=('any')
url='https://github.com/brendangregg/perf-tools'
source=("${pkgname}::git+${url}")
depends=('perf')
license=('GPL')
sha512sums=('SKIP')

pkgver () {
	cd "${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package () {
	cd "${pkgname}"

	local file
	for file in bin/*
	do
		if [[ -L ${file} ]] ; then
			file=$(readlink -f "${file}")
		fi
		local basename=${file##*/}
		install -Dm755 "${file}" "${pkgdir}/usr/bin/${basename}"
		if [[ -r man/man8/${basename}.8 ]]
		then
			install -Dm644 "man/man8/${basename}.8" \
				"${pkgdir}/usr/share/man/man8/${basename}.8"
		fi
	done

	install -m755 -d "${pkgdir}/usr/share/doc/${pkgname}"
	install -m644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
		README.md examples/*
}
