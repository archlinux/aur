# Maintainer: Kamack38 <kamack38.biznes@gmail.com>
_pkgname='openasar'
pkgname="${_pkgname}-git"
pkgver=r823.4f59b83
pkgrel=1
pkgdesc="Open-source alternative of Discord desktop's app.asar"
arch=('i686' 'x86_64')
url="https://github.com/GooseMod/OpenAsar"
license=('MIT')
depends=('unzip')
makedepends=('git' 'asar' 'nodejs')
optdepends=('discord' 'discord-ptb' 'discord-canary' 'discord-development')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+${url}.git" "post-upgrade-discord" "openasar-git-discord-upgrade.hook" "openasar-git-discord-ptb-upgrade.hook" "openasar-git-discord-canary-upgrade.hook" "openasar-git-discord-development-upgrade.hook" "pre-remove-discord" "openasar-git-discord-remove.hook")
sha1sums=('SKIP'
          'ddf2a07206f275b7fb28a375ad710932098782a3'
          'bc184134bd132d14c8758e49e7e51ecec25c7347'
          '7444c2a0937e95e93c80b8647e1a5074c7ba3684'
          '4ad3c320455b7276bbf0d636160423ed68d4f907'
          '219ecd2ee201f6c73065415208717d1e2fd5e8ef'
          '6a2ff27290dd807a4727e1054ec52ba4815e887c'
          '8c0d5675af76b48575611b03c8e2f2a6a5ca8cde')
install="$pkgname.install"

pkgver() {
	cd "${srcdir}/OpenAsar"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	install -Dm755 "${srcdir}/post-upgrade-discord" -t "${pkgdir}/usr/share/libalpm/scripts/"
	install -Dm755 "${srcdir}/pre-remove-discord" -t "${pkgdir}/usr/share/libalpm/scripts/"
	install -Dm644 "${srcdir}/openasar-git-discord-remove.hook" -t "${pkgdir}/usr/share/libalpm/hooks/"
	install -Dm644 "${srcdir}/openasar-git-discord-upgrade.hook" -t "${pkgdir}/usr/share/libalpm/hooks/"
	install -Dm644 "${srcdir}/openasar-git-discord-ptb-upgrade.hook" -t "${pkgdir}/usr/share/libalpm/hooks/"
	install -Dm644 "${srcdir}/openasar-git-discord-canary-upgrade.hook" -t "${pkgdir}/usr/share/libalpm/hooks/"
	install -Dm644 "${srcdir}/openasar-git-discord-development-upgrade.hook" -t "${pkgdir}/usr/share/libalpm/hooks/"
	cd "${srcdir}/OpenAsar"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	sed -i -e "s/nightly/nightly-$(git rev-parse HEAD | cut -c 1-7)/" src/index.js
	node scripts/strip.js
	asar pack src app.asar
	install -Dm 644 app.asar "${pkgdir}/opt/${pkgname}/app.asar"
}
