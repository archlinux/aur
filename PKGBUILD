# Maintainer: AtticFinder65536 <atticfinder -AT- rocklabs -DOT- xyz>

pkgname=('discordchatexporter-cli')
pkgver=2.36.4
pkgrel=1
pkgdesc="Exports Discord chat logs to a file"
url="https://github.com/Tyrrrz/DiscordChatExporter"
license=('GPL')
source=("${pkgname}-${pkgver}".tar.gz::https://github.com/Tyrrrz/DiscordChatExporter/archive/refs/tags/${pkgver}.tar.gz
	'discordchatexporter-cli'
	'netversion.patch')
b2sums=('980f543bd3b997877095ec8d5b9402cde580fdd8ae725c4448b4c1235f117022f72d21a93edddd585209e60a43067ce7f77d296b4196d8ce49d40f9b7f5776e6'
	'763d7ac60315aa945557096ccaea9ded7050e75aa183860d6f5749bbcd3c2fe565aad9dec7e320673725a4213f00915c5f1c3ce1c48626fde612e765b7d1dd80'
	'44f316264dac6a294d4ecbab93759fd3767f7e40fda5b3a5f5f591a42710df3e156b3772b4c54a871d5dd3777f17d2cf5754bb01a6b36d083673619592893d42')
arch=('any')
depends=('dotnet-runtime-6.0')
makedepends=('dotnet-sdk-6.0')
options=('!strip')

prepare(){
	cd DiscordChatExporter-"${pkgver}"
	# 6.0.9 is set as the required version upstream, Arch repos have 6.0.12. Fails to build otherwise.
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
