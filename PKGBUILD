# Maintainer: lgm <lgm dot aur at outlook dot com>
# Contributor: Ndoskrnl <lollipop.studio.cn@gmail.com>

# Based on the 'forge-server' AUR package by:
# Maintainer: Nitroretro <nitroretro@protonmail.com>

# Based on the `minecraft-server` AUR package by:
## Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>
## Contributor: Philip Abernethy <chais.z3r0@gmail.com>
## Contributor: sowieso <sowieso@dukun.de>

_ver="1.17.1_0.9.0-1"
_minecraft_ver_latest="1.17.1"

IFS="-" read -ra _ver_temp <<< "$_ver"
IFS="_" read -ra _pkgver_temp <<< "${_ver_temp[0]}"

_minecraft_ver=${_pkgver_temp[0]}
_fabric_ver=${_pkgver_temp[1]}

_pkgver=${_ver_temp[0]//_/-}

if [ "$_minecraft_ver" = "$_minecraft_ver_latest" ]; then
	pkgname="fabric-server"
	_fabric_name="fabric"
else
	pkgname="fabric-server-${_minecraft_ver}"
	_fabric_name="fabric-${_minecraft_ver}"
fi
pkgver=${_ver_temp[0]}
pkgrel=${_ver_temp[1]}
pkgdesc="Minecraft Fabric server unit files, script and jar"
arch=("any")
url="https://fabricmc.net"
license=("Apache")
depends=("java-runtime-headless>=16" "screen" "sudo" "bash" "awk" "sed")
optdepends=("tar: needed in order to create world backups"
	"netcat: required in order to suspend an idle server")
provides=("fabric-server=${pkgver}")
backup=("etc/conf.d/${_fabric_name}")
install="fabric-server.install"
source=("fabricd-backup.service"
	"fabricd-backup.timer"
	"fabricd.service"
	"fabricd.conf"
	"fabricd.sh")
noextract=("fabric-${_pkgver}.jar")
sha512sums=('38642e2cbd218221a93996b86cdb1bf1b1d3c78a377ea22b32c597ce5e4a2e6cb2b4541179d9b4dff6e4c463e60f4bdee101538c58bf455aeb85c73838b6ed2c'
            '755d3f532913f999c3abde1eae8a713f5bee8e758314fdeef0a70f81d4411b91b4c88d30824cdf5b0f8f5dae76ceffc10d2b1e5db6161a1daf02a50399b718d3'
            '78e688805d448be6a0d05cc4aa7bf728c5b662a1f8c335e5a1bab3a5af42de186585761d2b52cf77c97b474780b410fd8f8539052532235285242f71d295abfc'
            '9f25102cfd345d8364debc62e622126a67fd69f3945a7aa28e46c1fb9cb36698e2f389c066fccb183f5e6bb8714e7f87091114d1752fe85bda746bef2697da8b'
            '63179dc31b3460f57fab2ab8661c9257b3bd8f966224782e9940751f39998532efedc14129cfe536f18b5f2b4578894940ea32b68f4eb75c325e58a1ea04df77'
            '80b5e7c571676e3489185df140d638bd8d12eebfcddedccd2dc469f6ee0522a0992354ac3411b2356a93d6b2f10ec706209d862d85ae84a02faf8e8761f6846b')

# -- Fabric Installer -- #
source+=("fabric-installer-${_fabric_ver}.jar"::"https://maven.fabricmc.net/net/fabricmc/fabric-installer/${_fabric_ver}/fabric-installer-${_fabric_ver}.jar")
# -- /Fabric Installer -- #

prepare() {
	java -Duser.home="${srcdir}" -jar "fabric-installer-${_fabric_ver}.jar" server -mcversion ${_minecraft_ver} -downloadMinecraft
}

package() {
	_server_root="${pkgdir}/srv/${_fabric_name}"

	# Install fabricd
	install -Dm644 "fabricd-backup.service" "${pkgdir}/usr/lib/systemd/system/${_fabric_name}d-backup.service"
	install -Dm644 "fabricd-backup.timer" "${pkgdir}/usr/lib/systemd/system/${_fabric_name}d-backup.timer"
	install -Dm644 "fabricd.service" "${pkgdir}/usr/lib/systemd/system/${_fabric_name}d.service"
	install -Dm644 "fabricd.conf" "${pkgdir}/etc/conf.d/${_fabric_name}"
	install -Dm755 "fabricd.sh" "${pkgdir}/usr/bin/${_fabric_name}d"

	# Install Fabric
	install -Dm644 "fabric-server-launch.jar" "${_server_root}/fabric-server-launch.jar"

	# Install Minecraft Server
	install -Dm644 "server.jar" "${_server_root}/server.jar"

	# Link log files
	mkdir -p "${pkgdir}/var/log/"
	install -dm2755 "${_server_root}/logs"
	ln -s "/srv/${_fabric_name}/logs" "${pkgdir}/var/log/${_fabric_name}"

	chmod g+ws "${_server_root}"
}
