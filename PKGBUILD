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
b2sums=('79cc13cd21ffb03e3cc8b5af311f8bc37ddfa09c731a64651583074dba06b5d14d36bfe2e457d2747962db2879cdb3d5bbbae4e272746bfc76667829231b77fd'
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
