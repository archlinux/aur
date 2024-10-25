# Maintainer: Cody Lee Cochran <cody.l.cochran@gmail.com>

# Notes from the maintainer team:
#
# Minecraft Bedrock clients available for Windows, XBox and other consoles will typically update 
# before this package does. If your client begins reporting an out of date server,
# find the new version and hashsum of the source zip file, and submit a patch and/or comment to the
# AUR page for this package:
# https://aur.archlinux.org/packages/minecraft-bedrock-server
# A maintainer will update the package shortly with the new hash and version.

pkgname=minecraft-bedrock-server

# This package version number can be found on the official Minecraft Bedrock server download page.
# https://www.minecraft.net/en-us/download/server/bedrock
# Mouseover the "DOWNLOAD" button under the section for the stable/non-preview "Ubuntu (Linux)" version.
pkgver=1.21.42.01
pkgrel=1
pkgdesc="Minecraft Bedrock Server compatible with Windows and XBox Minecraft clients"
arch=('x86_64')
url="https://www.minecraft.net/en-us/download/server/bedrock"
license=('custom')
noextract=('bedrock-server-${pkgver}.zip')
backup=(opt/minecraft-bedrock-server/{server.properties,permissions.json,whitelist.json,allowlist.json})
makedepends=('unzip')

# The first file in this sources list is located on the official Minecraft Bedrock download page.
# https://www.minecraft.net/en-us/download/server/bedrock
# Mousing over the download button for the stable/non-preview "Ubuntu (Linux)" version will provide the full URL.
source=("https://minecraft.net/bedrockdedicatedserver/bin-linux/bedrock-server-${pkgver}.zip"
        'minecraft-bedrock-server.service'
	'minecraft-bedrock-server.sysusers'
	'minecraft-bedrock-server.tmpfiles')

# This sha256 hashsum can be determined by manually downloading the file from the official download page.
# https://www.minecraft.net/en-us/download/server/bedrock
# Click the "DOWNLOAD" button under the section for the stable/non-preview "Ubuntu (Linux)" version.
# To get the sha256 hashsum, run the following on the downloaded file:
# sha256sum <bedrock-server-vX.YY.Z>.zip
sha256sums=('6d352cb588e6cfeacba5c272e3b4acb669526029fb8afb35f0861e6afb274776'
            'cc08effe04701f1ca16a1edd153d12a94ed498e9a3e68a004b74189eef9edb81'
            'a7070301958b58f804bb8dee8b66ef23ad7460403f7ba2cfffb549e29ad834d5'
            '829ff9e583408fcc1d0436a6896ecbd3128f893dcbc2b0147130219a13586ae3')

# Without the appropriate user-agent string, the automated download will hang and eventually timeout.
# If this happens, please help by figuring out the appropriate one and submit a patch to this array value.
# More information about why this is sometimes needed can be found here on the Arch wiki:
# https://wiki.archlinux.org/title/Nonfree_applications_package_guidelines#Custom_DLAGENTS
DLAGENTS=( "https::/usr/bin/curl -A 'Mozilla' -fLC - --retry 3 --retry-delay 3 -o %o %u" )

build() {
	unzip -q bedrock-server-${pkgver}.zip -d tmp
	rm bedrock-server-${pkgver}.zip
}

package() {
	install -d "$pkgdir"/opt/minecraft-bedrock-server
	cp -r -fHip "$srcdir"/tmp/* "$pkgdir"/opt/minecraft-bedrock-server
	install -Dm 644 minecraft-bedrock-server.service -t "$pkgdir"/usr/lib/systemd/system/
	install -Dm 644 minecraft-bedrock-server.sysusers "$pkgdir"/usr/lib/sysusers.d/minecraft-bedrock-server.conf
	install -Dm 644 minecraft-bedrock-server.tmpfiles "$pkgdir"/usr/lib/tmpfiles.d/minecraft-bedrock-server.conf
}
