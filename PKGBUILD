# shellcheck disable=all
# Maintainer: Tom BH <tombh.co.uk>
# Package inspired by mx-puppet-discord

pkgname=mx-puppet-slack-git
pkgver=v24_05_2022
pkgrel=1
# strip the -git suffix from name
_dirname="${pkgname%-git}"
_basename="${pkgname%-git}"
pkgdesc='This is a Matrix bridge for Slack'
arch=('x86_64' 'armv7h' 'aarch64')
url='https://gitlab.com/mx-puppet/slack/mx-puppet-slack.git'
license=('apache')
depends=('nodejs' 'cairo' 'pango' 'libjpeg-turbo' 'giflib' 'librsvg')
source=("git+${url}" "${_basename}.tmpfiles" "${_basename}.sysusers" "${_basename}.service")
# `updpkgsums`
sha256sums=('SKIP'
            '15633379df2ee923b889a803a20250223f491f59ed9a1937b06f904fc386cb0d'
            '477b423952262ee447a792349e36e53519084ec54a38bb74fe2e03cf4a76b47f'
            'e9fecbb0e350b015bb81d9701e81c47454547847c4363f2974fdca955b844129')
backup=("etc/${_basename}/config.yaml")
install="${_basename}.install"
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
