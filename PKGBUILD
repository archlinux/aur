# Maintainer: Dominik Opyd <d.opyd@oad.earth>
# Contributor: thisischrys <thisischrys+aur@gmail.com>
# Contributor: Nitroretro <nitroretro@protonmail.com>

# Based on the `minecraft-server` AUR package by:
## Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>
## Contributor: Philip Abernethy <chais.z3r0@gmail.com>
## Contributor: sowieso <sowieso@dukun.de>

minver=1.19
srvpath=/srv/forge

pkgver=41.1.0
pkgrel=2
pkgname=forge-server
pkgdesc="Forge is a free, open-source modding API all of your favourite mods use!"
url="https://minecraftforge.net"
arch=('any')
license=("custom")
depends=("jdk-openjdk" "tmux" "forge-hooks")
makedepends=("jdk-openjdk")
optdepends=("tar: needed in order to create world backups"
						"netcat: required in order to suspend an idle server")
provides=("forge-server=${pkgver}")
backup=("etc/conf.d/forge")
install=forge-server.install
source=(git+https://github.com/Edenhofer/minecraft-server
				https://raw.githubusercontent.com/MinecraftForge/MinecraftForge/${minver}.x/LICENSE.txt
				https://maven.minecraftforge.net/net/minecraftforge/forge/1.19-41.1.0/forge-1.19-41.1.0-installer.jar)
noextract=(forge-${minver}-${pkgver}-installer.jar)
sha512sums=('SKIP'
            '3da10d63a5edee4bc8bcd3d5c2730771062f7fa58626a8c51635fbe96bfbceca3ff6937cfaad3e17f16a94ef95137f7c78cc6dac1c846a6b9a8f18d3c6355973'
            'f3a383a994d72edf047a3dfc3391f635b412c34ea1641a9af41f26682839acacf2d4cf6cb9700dc9b46df887912db211adb9ed6b0cbd6548728227aeca63db2b')

frgpath=${srvpath}/libraries/net/minecraftforge/forge/${minver}-${pkgver}

prepare() {
	mkdir -p forge-server && cd forge-server

	java -jar ../forge-${minver}-${pkgver}-installer.jar --installServer
}

build() {
	cd minecraft-server

	make \
		GAME=forge \
		INAME=forged \
		SERVER_ROOT=${srvpath} \
		SERVER_START_CMD="java @${frgpath}/user_jvm_args.txt @${frgpath}/unix_args.txt" \
		MAIN_EXECUTABLE=forge-${minver}-${pkgver}-server.jar \
	all
}

package() {
	cd minecraft-server

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
	install -Dm 644 $srcdir/LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

	mkdir -p $pkgdir/var/log/

	install -dm2755 $pkgdir$srvpath/logs
	install -dm2755 $pkgdir$srvpath/mods

	ln -s ${srvpath}/logs $pkgdir/var/log/forge

	chmod g+ws $pkgdir$srvpath
}
