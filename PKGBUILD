# Maintainer: Imperator Storm <ImperatorStorm11@protonmail.com>

# Based on the `fabric-server` AUR package by:
# Maintainer: lgm <lgm dot aur at outlook dot com>
# Contributor: Ndoskrnl <lollipop.studio.cn@gmail.com>
# Contributor: flying <flyinghat42@gmail.com>

# Based on the `forge-server` AUR package by:
# Contributor: Nitroretro <nitroretro@protonmail.com>

# Based on the `minecraft-server` AUR package by:
## Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>
## Contributor: Philip Abernethy <chais.z3r0@gmail.com>
## Contributor: sowieso <sowieso@dukun.de>

_ver="1.19.3_0.5.0_0.17.8-1" # <mcver_installerver_loaderver-pkgrelease>
# installer ver can be gotten at https://meta.quiltmc.org/v3/versions/installer
# loader ver can be gotten at https://meta.quiltmc.org/v3/versions/loader
# stay on stable loader+installer releases for the time being.
# unless things break.

IFS="-" read -ra _ver_temp <<< "$_ver"
IFS="_" read -ra _pkgver_temp <<< "${_ver_temp[0]}"

# the minecraft version
_minecraft_ver=${_pkgver_temp[0]}

# the version of the installer
_quilt_ver=${_pkgver_temp[1]}

# the version of the loader to install
_quilt_loader_ver=${_pkgver_temp[2]}

_mng_ver=1.0.2

_pkgver=${_ver_temp[0]//_/-}

pkgname="quilt-server"
_quilt_name="quilt"
pkgver=${_ver_temp[0]}
pkgrel=${_ver_temp[1]}
pkgdesc="Minecraft Quilt server unit files, script, and jar"
arch=("any")
url="https://quiltmc.org"
license=("Apache")
depends=("java-runtime-headless>=17" "tmux" "sudo" "bash" "awk" "sed" "tar")
optdepends=("netcat: required in order to suspend an idle server")
backup=("etc/conf.d/${_quilt_name}")
install="quilt-server.install"
options=(emptydirs)
source=("minecraft-server-${_mng_ver}.tar.gz"::"https://github.com/Edenhofer/minecraft-server/archive/refs/tags/v${_mng_ver}.tar.gz"
		"quilt-installer-${_quilt_ver}.jar"::"https://maven.quiltmc.org/repository/release/org/quiltmc/quilt-installer/${_quilt_ver}/quilt-installer-${_quilt_ver}.jar")
noextract=("quilt-${_pkgver}.jar")
sha256sums=('739d526568d440f5bca0706d6d03d64e44e4e942766d27a4f273a812341978df'
            'dbf8cf54e546259c7d1bdbc5a4445b0a4ba9c3fafcef9efb943897b6097a77b9')

prepare() {
	java -Duser.home="${srcdir}" -jar "quilt-installer-${_quilt_ver}.jar" install server ${_minecraft_ver} ${_quilt_loader_ver} --download-server
}

_game="quilt"
_server_root="${pkgdir}/srv/${_quilt_name}"
build() {
	make -C "${srcdir}/minecraft-server-${_mng_ver}" \
		GAME=${_game} \
		INAME=${_game}d \
		SERVER_ROOT=${_server_root} \
		BACKUP_PATHS="world world_nether world_the_end" \
		GAME_USER=${_game} \
		MAIN_EXECUTABLE=quilt-server-launch.jar \
		SERVER_START_CMD="java -Xms512M -Xmx1024M -jar './\$\${MAIN_EXECUTABLE}' --nogui" \
		clean
	make -C "${srcdir}/minecraft-server-${_mng_ver}" \
		GAME=${_game} \
		INAME=${_game}d \
		SERVER_ROOT=${_server_root} \
		BACKUP_PATHS="world world_nether world_the_end" \
		GAME_USER=${_game} \
		MAIN_EXECUTABLE=quilt-server-launch.jar \
		SERVER_START_CMD="java -Xms512M -Xmx1024M -jar './\$\${MAIN_EXECUTABLE}' --nogui" \
		all
}

package() {
	_server_root="${pkgdir}/srv/${_quilt_name}"

	make -C "${srcdir}/minecraft-server-${_mng_ver}" \
		DESTDIR="${pkgdir}" \
		GAME=${_game} \
		INAME=${_game}d \
		install

	# Install Quilt
	install -Dm644 "server/quilt-server-launch.jar" "${_server_root}/quilt-server-launch.jar"

	# Install Minecraft Server
	install -Dm644 "server/server.jar" "${_server_root}/server.jar"

	# install the libraries subfolder
	# 1 create the emptyfolder structure 
	install -dm755 "libraries" "${_server_root}/libraries"
	
	cp -r "server/libraries/" "./"
	for dir in $(find "libraries" -type d); do
		echo "${_server_root}/${dir}"
		install -d --mode 755 "$dir" "${_server_root}/${dir}"
	done
	# 2 install all files
	for file in $(find "libraries" -type f); do
	echo "${_server_root}/${file}"
		install -D --mode 755 "$file" "${_server_root}/${file}"
	done

	# Link log files
	mkdir -p "${pkgdir}/var/log/"
	install -dm2755 "${_server_root}/logs"
	ln -s "/srv/${_quilt_name}/logs" "${pkgdir}/var/log/${_quilt_name}"

	# Give the group write permissions and set user or group ID on execution
	chmod g+ws "${_server_root}"
}
