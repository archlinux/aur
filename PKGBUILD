# Maintainer: Dominik Opyd <d.opyd@oad.earth>
# Contributor: thisischrys <thisischrys+aur@gmail.com>
# Contributor: Nitroretro <nitroretro@protonmail.com>

# Based on the `minecraft-server` AUR package by:
## Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>
## Contributor: Philip Abernethy <chais.z3r0@gmail.com>
## Contributor: sowieso <sowieso@dukun.de>

minver=1.19
srvpath=/srv/forge

pkgver=41.0.109
pkgrel=1
pkgname=forge-server
pkgdesc="Forge is a free, open-source modding API all of your favourite mods use!"
url="https://minecraftforge.net"
arch=('any')
license=("custom")
depends=("jdk-openjdk" "tmux")
makedepends=("jdk-openjdk")
optdepends=("tar: needed in order to create world backups"
						"netcat: required in order to suspend an idle server")
provides=("forge-server=${pkgver}")
backup=("etc/conf.d/forge")
install="forge-server.install"
source=(https://maven.minecraftforge.net/net/minecraftforge/forge/${minver}-${pkgver}/forge-${minver}-${pkgver}-installer.jar
				forge-scripts::git+https://github.com/Edenhofer/minecraft-server
				https://raw.githubusercontent.com/MinecraftForge/MinecraftForge/${minver}.x/LICENSE.txt)
noextract=(forge-${minver}-${pkgver}-installer.jar)
sha512sums=('78b7ea6c255d20c60f6cccbe835c93fd27c6638a5e98fefa1d5c4c5e324808a640366262f1f29725f207b1c2f7bd4c35422f21a798f89886dc68adf5b558a5e9'
            'SKIP'
            '3da10d63a5edee4bc8bcd3d5c2730771062f7fa58626a8c51635fbe96bfbceca3ff6937cfaad3e17f16a94ef95137f7c78cc6dac1c846a6b9a8f18d3c6355973')

frgpath=${srvpath}/libraries/net/minecraftforge/forge/${minver}-${pkgver}

prepare() {
	mkdir -p forge-server && cd forge-server

	java -jar ../forge-${minver}-${pkgver}-installer.jar --installServer
}

build() {
	cd forge-scripts

	make \
		GAME=forge \
		INAME=forged \
		SERVER_ROOT=${srvpath} \
		SERVER_START_CMD="java @${frgpath}/user_jvm_args.txt @${frgpath}/unix_args.txt" \
		MAIN_EXECUTABLE=forge-${minver}-${pkgver}-server.jar \
	all
}

package() {
	cd forge-scripts

	make \
		GAME=forge \
		INAME=forged \
		DESTDIR=$pkgdir \
	install
	
	cd ../forge-server

	rm *.log *.bat

	rm libraries/net/minecraftforge/forge/${minver}-${pkgver}/win_args.txt

	find libraries -type f -print0 | xargs -0 -i@ install -Dm644 "@" "${pkgdir}${srvpath}/@"

	install -Dm 644 user_jvm_args.txt ${pkgdir}${frgpath}/user_jvm_args.txt
	install -Dm 644 ../LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
