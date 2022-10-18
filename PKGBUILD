# Maintainer: AtticFinder65536 <atticfinder -AT- rocklabs -DOT- xyz>

pkgname=('discordchatexporter-cli')
pkgver=2.36.2
pkgrel=1
pkgdesc="Exports Discord chat logs to a file"
url="https://github.com/Tyrrrz/DiscordChatExporter"
license=('GPL')
source=("${pkgname}-${pkgver}".tar.gz::https://github.com/Tyrrrz/DiscordChatExporter/archive/refs/tags/${pkgver}.tar.gz
	'discordchatexporter-cli'
	'netversion.patch')
b2sums=('51245214661e05791f7b529e2e5e2e45a9b7b4988b0f006c160308a00c121c759f133ff7921ce13f267176a908976487a856f16c63ce23ceb837b71f7bd439eb'
	'763d7ac60315aa945557096ccaea9ded7050e75aa183860d6f5749bbcd3c2fe565aad9dec7e320673725a4213f00915c5f1c3ce1c48626fde612e765b7d1dd80'
	'186c274fcdc22e6796fbd8aec8a3f10ec31d6f2117b7f8476adebd170e9114506d701fc730866706521aacbb847f018c1451fd31b984ef3578ee6ba4915400f5')
arch=('any')
depends=('dotnet-runtime-6.0')
makedepends=('dotnet-sdk-6.0')
options=('!strip')

prepare(){
	cd DiscordChatExporter-"${pkgver}"
	# 6.0.9 is set as the required version upstream, Arch repos have 6.0.10. Fails to build otherwise.
	patch --forward --strip=0 --input="${srcdir}/netversion.patch"
}

build(){
	cd DiscordChatExporter-"${pkgver}"
	dotnet publish 'DiscordChatExporter.Cli' --configuration 'Release'
}

package(){
	cd DiscordChatExporter-"${pkgver}"

	# Install launcher
	install -Dm755 "${srcdir}"/discordchatexporter-cli "${pkgdir}"/usr/bin/discordchatexporter-cli

	# Install application
	cd DiscordChatExporter.Cli/bin/Release/net6.0/publish
	find . -type f -exec install -Dm644 "{}" "${pkgdir}"/usr/lib/${pkgname}"/{}" \;
}
