pkgname=mx-puppet-discord-git
pkgver=v0.1.1.r5.gfd44022
pkgrel=1
# strip the -git suffix from name
_dirname="${pkgname%-git}"
_basename="${pkgname%-git}"
pkgdesc='This is a Matrix bridge for Discord'
arch=('x86_64' 'armv7h' 'aarch64')
url='https://gitlab.com/mx-puppet/discord/mx-puppet-discord.git'
license=('apache')
depends=('nodejs' 'cairo' 'pango' 'libjpeg-turbo' 'sqlite')
source=("git+${url}" "${_basename}.tmpfiles" "${_basename}.sysusers" "${_basename}.service")
sha256sums=('SKIP'
            '52882939775b359aceb0b1f16f46d8c2063dab100d58bd2d3753bae66638490d'
            '34f11759a1202f9e4448dd493b2aad253bf2c7f233f70fcf95c33f5a2ab19984'
            '81c81f60a3db42f840e70d1ca55a84e2655227a0b0f5ff99b6beff582a9e6964')
backup=("etc/${_basename}/config.yaml")
install="${_basename}.install"
# npm is strangely necessary during better-sqlite build or it'll fail
makedepends+=('git' 'yarn' 'npm')
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

prepare() {
	cd "${srcdir}/${_dirname}"
	yarn install --mode skip-build
}


build(){
	cd "${srcdir}/${_dirname}"
	yarn install
	yarn build
	rm -r 'node_modules/.bin'
}

package() {
	cd "${srcdir}/${_dirname}"

	install -Dvm 644 "${srcdir}/${_basename}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${_basename}.conf"
	install -Dvm 644 "${srcdir}/${_basename}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${_basename}.conf"
	install -Dvm 644 "${srcdir}/${_basename}.service" "${pkgdir}/usr/lib/systemd/system/${_basename}.service"

	install -Dvm 640 sample.config.yaml "${pkgdir}/etc/${_basename}/config.yaml"

	find 'build' -exec install -D {} "${pkgdir}/usr/lib/node_modules/${_basename}/{}" \;

	find 'node_modules' -exec install -D {} "${pkgdir}/usr/lib/node_modules/${_basename}/{}" \;
}
