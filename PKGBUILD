# Maintainer: Martin Rys <https://rys.rs/contact>

pkgname=semaphore-git
pkgver=v2.9.53.beta.r62.3ba035ff
pkgrel=1
pkgdesc='Modern UI for Ansible'
arch=('aarch64' 'x86_64')
url='https://github.com/ansible-semaphore/semaphore'
license=('MIT')
depends=('ansible')
makedepends=('git' 'go' 'go-task' 'go-swagger' 'npm')
optdepends=('postgresql: Database')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(
	'semaphore'::'git+https://github.com/ansible-semaphore/semaphore.git'
)
sha256sums=('SKIP')

pkgver() {
	printf "%s" "$(git -C "${srcdir}/${pkgname%-git}" describe --tags --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	sed -i 's/CGO_ENABLED=0/CGO_ENABLED=1/g' "${srcdir}/semaphore/Taskfile.yml"

	mkdir -p github.com/ansible-semaphore
	mv "${pkgname%-git}" "github.com/ansible-semaphore/${pkgname%-git}"

#	# semaphore-git W: ELF file ('usr/bin/semaphore') lacks FULL RELRO, check LDFLAGS.
#	# semaphore-git W: ELF file ('usr/bin/semaphore') lacks PIE.
#	# https://wiki.archlinux.org/title/Go_package_guidelines#Flags_and_build_options
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -ldflags=-linkmode=external -mod=readonly -modcacherw -trimpath"
	go-task --dir "${srcdir}/github.com/ansible-semaphore/${pkgname%-git}" all
}

package() {
	cd "${srcdir}/github.com/ansible-semaphore/${pkgname%-git}"
	install -DT "bin/${pkgname%-git}" "${pkgdir}/usr/bin/${pkgname%-git}"
	install -d                        "${pkgdir}/usr/share/licenses/${pkgname}"
	install -D  "LICENSE"             "${pkgdir}/usr/share/licenses/${pkgname}"
}
