pkgname=mx-puppet-discord-git
pkgver=r219.d9615ba
pkgrel=11
# strip the -git suffix from name
_dirname="${pkgname%-git}"
_basename="${pkgname%-git}"
pkgdesc='This is a Matrix bridge for Discord'
arch=('x86_64' 'armv7h')
url='https://github.com/matrix-discord/mx-puppet-discord'
license=('apache')
depends=('nodejs' 'cairo' 'pango')
source=("git+${url}" "${_basename}.tmpfiles" "${_basename}.sysusers" "${_basename}.service")
sha256sums=('SKIP'
            '6f66f51e85e9a222dc855a14fad8414e279f76cc7032b19f7821622bc72632cc'
            '9be3c27669b6d9fbca8b7da9d8b1227cbbacc3435424f2389581ee60f8ac8bd4'
            '5bef61fa580963970ba3d889c1085dfd370f13c72c77bbfa70c81535f1d0eb8d')
backup=("etc/${_basename}/config.yaml" "etc/${_basename}/registration.yaml" )
install="${pkgname}.install"
makedepends+=('git' 'npm')
# conflict/provide the same package as the non -git version
provides=("${_basename}")
conflicts=("${_basename}")

pkgver() {
	cd "${srcdir}/${_dirname}"
	( set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
	# 0.9.9.r27.g2b039da # if tags exist
	# r1581.2b039da      # else fallback
}

prepare() {
	cd "${srcdir}/${_dirname}"
	touch registration.yaml
}

build(){
	cd "${srcdir}/${_dirname}"
	npm install --cache "${srcdir}/npm-cache"
	npm run build --cache "${srcdir}/npm-cache"
}

package() {
	cd "${srcdir}/${_dirname}"

	npm install -g --cache "${srcdir}/npm-cache" --user root --prefix "${pkgdir}/usr"

	# adjust behaviour where npm links the installation instead of copying files
	find "${pkgdir}/usr/lib/node_modules/" -maxdepth 1 -type l -exec cp --no-preserve=ownership -H --recursive {} '{}-tempcopy' \; -exec rm {} \; -exec mv '{}-tempcopy' {} \;

	# delete the git files
	rm -r "${pkgdir}/usr/lib/node_modules/${_basename}/.git"
	rm "${pkgdir}/usr/lib/node_modules/${_basename}/.gitignore"

	install -Dm 644 "${srcdir}/${_basename}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${_basename}.conf"
	install -Dm 644 "${srcdir}/${_basename}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${_basename}.conf"
	install -Dm 644 "${srcdir}/${_basename}.service" "${pkgdir}/usr/lib/systemd/system/${_basename}.service"

	install -Dvm 640 sample.config.yaml "${pkgdir}/etc/${_basename}/config.yaml"
	install -Dvm 640 registration.yaml "${pkgdir}/etc/${_basename}/registration.yaml"
}
