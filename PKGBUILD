pkgname=mx-puppet-discord-git
pkgver=r248.c17384a
pkgrel=2
# strip the -git suffix from name
_dirname="${pkgname%-git}"
_basename="${pkgname%-git}"
pkgdesc='This is a Matrix bridge for Discord'
arch=('x86_64' 'armv7h')
url='https://github.com/matrix-discord/mx-puppet-discord'
license=('apache')
depends=('nodejs' 'cairo' 'pango' 'libjpeg-turbo')
source=("git+${url}" "${_basename}.tmpfiles" "${_basename}.sysusers" "${_basename}.service")
sha256sums=('SKIP'
            '6f66f51e85e9a222dc855a14fad8414e279f76cc7032b19f7821622bc72632cc'
            '34f11759a1202f9e4448dd493b2aad253bf2c7f233f70fcf95c33f5a2ab19984'
            'a5e258d99a900361e442dc4cedba35b521cbb8dd22ecd1f491a3b853a002b8b4')
backup=("etc/${_basename}/config.yaml")
install="${_basename}.install"
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

build(){
	cd "${srcdir}/${_dirname}"
	npm install --cache "${srcdir}/npm-cache"
	npm run build --cache "${srcdir}/npm-cache"
}

package() {
	cd "${srcdir}/${_dirname}"

	npm install -g --cache "${srcdir}/npm-cache" --prefix "${pkgdir}/usr"

	# remove references to srcdir
	find "${pkgdir}/usr/lib/node_modules/" -name package.json -exec sed -i '/_where/d' {} \;

	# adjust behaviour where npm links the installation instead of copying files
	find "${pkgdir}/usr/lib/node_modules/" -maxdepth 1 -type l -exec cp --no-preserve=ownership -H --recursive {} '{}-tempcopy' \; -exec rm {} \; -exec mv '{}-tempcopy' {} \;

	# npm seems to have dropped support for --user, back to manual chown
	chown -R root:root "${pkgdir}/usr"

	# delete the git files
	rm -r "${pkgdir}/usr/lib/node_modules/${_basename}/.git"
	rm "${pkgdir}/usr/lib/node_modules/${_basename}/.gitignore"

	install -Dm 644 "${srcdir}/${_basename}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${_basename}.conf"
	install -Dm 644 "${srcdir}/${_basename}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${_basename}.conf"
	install -Dm 644 "${srcdir}/${_basename}.service" "${pkgdir}/usr/lib/systemd/system/${_basename}.service"

	install -Dvm 640 sample.config.yaml "${pkgdir}/etc/${_basename}/config.yaml"
}
