# Maintainer: Roddy Rappaport <roddy.rappaport@gmail.com>

pkgname=gdb-static
pkgver=18.1
pkgrel=1

pkgdesc="Statically linked versions of GDB, together with python."
# The source can be cross-compiled to other archs (Such as arm and mips) but we only support
# compiling from x64 and this package is distributed as a source.
arch=('x86_64')
url="https://github.com/guyush1/gdb-static"
license=('GPL-3.0-or-later')

options=(!debug !strip)

makedepends=('make' 'docker' 'bash' 'git')
checkdepends=('make' 'python-pytest')

source=("gdb-static::git+https://github.com/guyush1/gdb-static.git#tag=v${pkgver}-static")
sha256sums=('SKIP')

prepare() {
	git -C "${srcdir}/${pkgname}" submodule update --init --recursive --depth 1
}

build() {
	make -C "${srcdir}/${pkgname}" build-x86_64-full

	# The compilation docker is large and is not required to use and retrieve the compiled data.
	make -C "${srcdir}/${pkgname}" clean-docker
}

check() {
	make -C "${pkgname}" test-x86_64-full
}

package() {
	local artifacts_dir="${srcdir}/${pkgname}/build/artifacts/x86_64_full/"

	local out_bin_dir="${pkgdir}/usr/bin/"
	mkdir -p "${out_bin_dir}"

	local out_licenses_dir="${pkgdir}/usr/share/licenses/${pkgname}"
	mkdir -p "${out_licenses_dir}"

	cp "${srcdir}/${pkgname}/NOTICES" "${out_licenses_dir}/"

	# Manually add a custom "-static" suffix so the binaries won't conflice with gdb. Additionally
	# only take gdb and gdb-server (There are some binaries that aren't really related to gdb, so
	# taking all of them seems wasteful. If anybody want them they can be added later).
	for filename in "gdb" "gdbserver"; do
		cp "${artifacts_dir}/${filename}" "${out_bin_dir}/${filename}-static"
	done
}
