pkgname=mx-puppet-discord-git
pkgver=r276.3c82530
pkgrel=1
# strip the -git suffix from name
_dirname="${pkgname%-git}"
_basename="${pkgname%-git}"
pkgdesc='This is a Matrix bridge for Discord'
arch=('x86_64' 'armv7h' 'aarch64')
url='https://gitlab.com/mx-puppet/discord/mx-puppet-discord.git'
license=('apache')
depends=('nodejs' 'cairo' 'pango' 'libjpeg-turbo')
source=("git+${url}" "${_basename}.tmpfiles" "${_basename}.sysusers" "${_basename}.service")
sha256sums=('SKIP'
            '52882939775b359aceb0b1f16f46d8c2063dab100d58bd2d3753bae66638490d'
            '34f11759a1202f9e4448dd493b2aad253bf2c7f233f70fcf95c33f5a2ab19984'
            '81c81f60a3db42f840e70d1ca55a84e2655227a0b0f5ff99b6beff582a9e6964')
backup=("etc/${_basename}/config.yaml")
install="${_basename}.install"
makedepends+=('git' 'npm')
# some users likely have issues from strip exausting machine resources
options=(!strip)
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
