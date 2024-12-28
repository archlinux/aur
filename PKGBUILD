# Maintaner: Darkgeem <darkgeem at pyrokinesis dot fr>

pkgname=mangal5-git
_pkgname=mangal
pkgver=5.11.4.r0.g674ef51
pkgrel=1
pkgdesc='The most advanced cli manga downloader. (luevano fork / v5 branch)'
url='https://github.com/luevano/mangal'
makedepends=('git' 'go' 'just' 'npm')
license=('MIT')
arch=('any')
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')
provides=('mangal')
conflicts=('mangal' 'mangal-bin' 'mangal-git')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	# set version to [major].[minor].[patch].r[rel].g[commit]
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/${_pkgname}"
	just update
	# move to webui folder and install the dependencies
	cd web/ui
	npm i -D openapi-typescript
	npm audit fix || true
	# go back to main folder
	cd "${srcdir}/${_pkgname}"

	# enumer and oapi-codegen can't be found in aur nor repos...?
	# installing them in the build directory so they don't leave anything more
	# than mangal
	_go_path="${srcdir}/gobuild"
	_go_bin_path="${_go_path}/bin"

	# only download enumer if not already in the temp gopath
	if ! test -f "${_go_bin_path}/enumer"; then
		env GOPATH="${_go_path}" \
			go install "github.com/dmarkham/enumer@latest"
	fi

	# only download oapi-codegen if not already in the temp gopath
	if ! test -f "${_go_bin_path}/oapi-codegen"; then
		env GOPATH="${_go_path}" \
			go install "github.com/deepmap/oapi-codegen/cmd/oapi-codegen@latest"
	fi

	# this step requires the enumer and oapi-codegen binaries
	env PATH="${PATH}:${_go_bin_path}" just generate

	# builds the binary
	just build
}

package() {
	cd "${srcdir}/${_pkgname}"
	mkdir -p ${pkgdir}/usr/bin/
	mv mangal ${pkgdir}/usr/bin/
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
