# Maintainer: thisischrys <thisischrys+aur at gmail dot com>
# Maintainer: Nitroretro <nitroretro@protonmail.com>

# Based on the `minecraft-server` AUR package by:
## Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>
## Contributor: Philip Abernethy <chais.z3r0@gmail.com>
## Contributor: sowieso <sowieso@dukun.de>

_ver="1.16.5_36.1.0-1"
_minecraft_ver_latest="1.16.5"

IFS="-" read -ra _ver_temp <<< "$_ver"
IFS="_" read -ra _pkgver_temp <<< "${_ver_temp[0]}"
IFS="." read -ra _minecraft_ver_temp <<< "${_pkgver_temp[0]}"

_minecraft_ver=${_pkgver_temp[0]}
_minecraft_ver_major=${_minecraft_ver_temp[0]:-0}
_minecraft_ver_minor=${_minecraft_ver_temp[1]:-0}
_minecraft_ver_patch=${_minecraft_ver_temp[2]:-0}
_forge_ver=${_pkgver_temp[1]}

_pkgver=${_ver_temp[0]//_/-}

if [ "$_minecraft_ver" = "$_minecraft_ver_latest" ]; then
	pkgname="forge-server"
	_forge_name="forge"
else
	pkgname="forge-server-${_minecraft_ver}"
	_forge_name="forge-${_minecraft_ver}"
fi
pkgver=${_ver_temp[0]}
pkgrel=${_ver_temp[1]}
pkgdesc="Minecraft Forge server unit files, script and jar"
arch=("any")
url="https://minecraftforge.net"
license=("custom")
depends=("java-runtime-headless=8" "screen" "sudo" "bash" "awk" "sed")
optdepends=("tar: needed in order to create world backups"
	"netcat: required in order to suspend an idle server")
provides=("forge-server=${pkgver}")
backup=("etc/conf.d/${_forge_name}")
install="forge-server.install"
source=("forged-backup.service"
	"forged-backup.timer"
	"forged.service"
	"forged.conf"
	"forged.sh")
noextract=("forge-${_pkgver}.jar")
sha512sums=('cbc7a567cd254e48e80aa97b62b6f2439ec09cde957ca0643a8ab323bb6bbdcf34ff27a5949fd2f153e736daf09b29639c3a613a8ef4fa0df16070cd58135199'
            'a47b5a9e2262877008a5dcae3a833fe99f911631d6fdbe97b95e0451e1dd2b5a26b6f7b843dd6a8ccd4f663cf5c3bca53a89a1d3aabb363281ab6c6fb19e41a4'
            'd6bde61a7aa479b85e35b4a3eccb9b3237a6c97f8919b3d704434f1df15672b74c7ae9ca9473eea6a0593e6e80892a2510782115185c1b7fe332720ccb78a7bd'
            'a55c2fcc3718f58b723b459f67b3de32b3e40d352e48dda79a85862f30956c5759f8eba4af85946c83c8a878994c43b01803fb2de971e91122c32af013eb6764'
            '76f038abf51fe1ff503118611b3e2f931349b0be9d444a521703b82406d8602099851e4006887c88d24468b6ea72e5ba1b63e8846420fb45e5f68f14aa9378d4'
            '461392035ba0646763a9950e9bc037e6bdf56153ec5e33b5c99b284e60221c0415440219651860b337cdbcfc7959a790535070e1cc97cc5a2b5fba7f92f9f26f'
            '3da10d63a5edee4bc8bcd3d5c2730771062f7fa58626a8c51635fbe96bfbceca3ff6937cfaad3e17f16a94ef95137f7c78cc6dac1c846a6b9a8f18d3c6355973')

# -- Forge Installer -- #
if [ "$_minecraft_ver_minor" = 7 ]; then
	source+=("forge-${_pkgver}-installer.jar"::"https://files.minecraftforge.net/maven/net/minecraftforge/forge/${_pkgver}-${_minecraft_ver}/forge-${_pkgver}-${_minecraft_ver}-installer.jar")
else
	source+=("forge-${_pkgver}-installer.jar"::"https://files.minecraftforge.net/maven/net/minecraftforge/forge/${_pkgver}/forge-${_pkgver}-installer.jar")
fi

[ "$_minecraft_ver_minor" = 5 ] && source+=("https://files.minecraftforge.net/fmllibs/fml_libs15.zip") && noextract+=("fml_libs15.zip")
# -- /Forge Installer -- #

# -- Licenses -- #
_licenses=()
_license_suffix="-${pkgname}-${_pkgver}.txt"

if [ "$_minecraft_ver_minor" -ge 10 ]; then
	_branch="${_minecraft_ver_major}.${_minecraft_ver_minor}.x"
elif [ "$_minecraft_ver_minor" -ge 7 ]; then
	_branch="$_minecraft_ver"
elif [ "$_minecraft_ver_minor" = 6 ]; then
	_branch="1.6"
else
	_branch="v7.9"
fi

_add_license() {
	_path=$1
	_repo=${2:-MinecraftForge}
	_github_branch=${3:-"$_branch"}
	_filename="$(basename "$_path")${_license_suffix}"

	_licenses+=("$_filename")
	source+=("$_filename"::"https://raw.githubusercontent.com/MinecraftForge/${_repo}/${_github_branch}/${_path}.txt")
}

if [ "$_minecraft_ver_minor" -ge 13 ]; then
	_add_license "LICENSE"
elif [ "$_minecraft_ver_minor" = 12 ]; then
	_add_license "LICENSE-Paulscode%20IBXM%20Library"
	_add_license "LICENSE-Paulscode%20SoundSystem%20CodecIBXM"
	_add_license "LICENSE"
elif [ "$_minecraft_ver_minor" -ge 7 ]; then
	_add_license "MinecraftForge-License"
	_add_license "Paulscode%20IBXM%20Library%20License"
	_add_license "Paulscode%20SoundSystem%20CodecIBXM%20License"

	case "$_minecraft_ver_minor" in
		8) _add_license "LICENSE-fml";;
		7) _add_license "fml/LICENSE-fml";;
		*) _add_license "LICENSE-fml" && _add_license "LICENSE-new";;
	esac
elif [ "$_minecraft_ver_minor" = 6 ]; then
	_add_license "install/MinecraftForge-License"
	_add_license "install/Paulscode%20IBXM%20Library%20License"
	_add_license "install/Paulscode%20SoundSystem%20CodecIBXM%20License"
	_add_license "LICENSE-fml" "FML" "902772ed0cb6c22c4cd7ad9b0ec7a02961b5e016"
else
	_add_license "LICENSE-fml"
fi
# -- /Licenses -- #

prepare() {
	[ "$_minecraft_ver_minor" = 10 ] && mkdir mods
	[ "$_minecraft_ver_minor" = 5 ] && unzip -o fml_libs15.zip -d lib
	java -jar "forge-${_pkgver}-installer.jar" --installServer
}

package() {
	_server_root="${pkgdir}/srv/${_forge_name}"

	# Install forged
	install -Dm644 "forged-backup.service" "${pkgdir}/usr/lib/systemd/system/${_forge_name}d-backup.service"
	install -Dm644 "forged-backup.timer" "${pkgdir}/usr/lib/systemd/system/${_forge_name}d-backup.timer"
	install -Dm644 "forged.service" "${pkgdir}/usr/lib/systemd/system/${_forge_name}d.service"
	install -Dm644 "forged.conf" "${pkgdir}/etc/conf.d/${_forge_name}"
	install -Dm755 "forged.sh" "${pkgdir}/usr/bin/${_forge_name}d"

	# Install Forge
	_forge_jar="forge-${_pkgver}.jar"
	[ "$_minecraft_ver_minor" -le 11 ] && _forge_jar="forge-${_pkgver}-universal.jar"
	[ "$_minecraft_ver_minor" = 7 ] && _forge_jar="forge-${_pkgver}-${_minecraft_ver}-universal.jar"
	[ "$_minecraft_ver_minor" -le 6 ] && _forge_jar="minecraftforge-universal-${_pkgver}.jar"

	install -Dm644 "$_forge_jar" "${_server_root}/$_forge_jar"
	ln -s "$_forge_jar" "${_server_root}/forge.jar"
	find libraries -type f -print0 | xargs -0 -i@ install -Dm644 "@" "${_server_root}/@"
	[ "$_minecraft_ver_minor" = 5 ] && find lib -type f -print0 | xargs -0 -i@ install -Dm644 "@" "${_server_root}/@"

	# Install Minecraft Server (for 1.12.2 or lower)
	if [ "$_minecraft_ver_minor" = 5 ]; then
		install -Dm644 "minecraft_server.${_minecraft_ver}.jar" "${_server_root}/minecraft_server.jar"
	elif [ "$_minecraft_ver_minor" -le 12 ]; then
		install -Dm644 "minecraft_server.${_minecraft_ver}.jar" "${_server_root}/minecraft_server.${_minecraft_ver}.jar"
	fi

	# Link log files
	mkdir -p "${pkgdir}/var/log/"
	install -dm2755 "${_server_root}/logs"
	ln -s "/srv/${_forge_name}/logs" "${pkgdir}/var/log/${_forge_name}"

	# Install licenses
	for _license in "${_licenses[@]}"; do
		_filename="$(basename "$_license" "$_license_suffix").txt"
		_filename="${_filename//\%20/ }"
		install -Dm644 "$_license" "${pkgdir}/usr/share/licenses/${pkgname}/$_filename"
	done

	chmod g+ws "${_server_root}"
}
