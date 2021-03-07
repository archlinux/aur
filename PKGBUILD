# Maintainer: thisischrys <thisischrys+aur at gmail dot com>
# Maintainer: Nitroretro <nitroretro@protonmail.com>

# Based on the `minecraft-server` AUR package by:
## Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>
## Contributor: Philip Abernethy <chais.z3r0@gmail.com>
## Contributor: sowieso <sowieso@dukun.de>

_ver="1.7.10_10.13.4.1558-9"
_minecraft_ver_latest="1.15.2"

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
sha512sums=('5447b2e5f9abca97b86a5b6ba7e428aa5f5a7221d61de503566fb90f513a9ca7e785ef9ed065cb6b904ee1efc7b2338f85cfb5cbdb7ae4110e4991ffb72177ba'
            '1ac9622e47f8f184f6870ccf8533d3f4ccbf16cdca11d7b78eddbf6786a6b25a1b3ff35c57dc94252251b2c41b364b90dd057435c0185bbbb689ba41afcb246a'
            '6aac51e495725e78ddf2bd52fbca9bf20d0f9cdb6502441a8ab4e8a93d71ab5d943a094186e8fba801c9c561d25841f6afb54e3eb39f1570c88b3818f4fbc4a8'
            '1f14156ba35f6996d1a74801b75d4fa88fbdc02f9d02177c1f82c9f3d423de0d6f09d5515acd9b3a161ab2b8b64bdd7fe30e4621878e0ac1898d51921c6d37ab'
            '1d316b386e416ec650e4c5852020e36f7b4dfd5602677a2425a76bd4677eaa99e5019f2960d65c7c7c1278c598190beaefd9720d26a44bbd4405ab5fe3de2850'
            'e3c733d16e7977cf2914a929650c361b43bbaee3fd4c3329d473455657d0970a92e45f175c9109ea72ea0992d7d9171468714daf8deeb4ae63bd8aed8a0ba7cb'
            'dedd8e121e79bdd39c824a2d4acbc231ae6339cfd29894c4e7299359d23bc92423f4a865865372745be996b0bc14f5777e06baae8b1f4e5c302eadeac5aecf15'
            '7f158bed6957e5285ce45a480f6a222065af5427bd48481ef24eb770ff540aa67b2d1c1ed976d216db94323017f7c7ee1dfe16e3f222b14189f9823e0b49f0f3'
            '2c9bdefe7d022be139e7aec2e5f1cc1f83ea9d35d2c945e26422e140027b5107ce32c56f0b97e7dbf6b6edb282075df4a18c156a6ed6b064bcb10a3b4481a9aa'
            '07860198b7d40726e9597f9ac748904a8e27bdcf87151f0b1c8c2ade024ad16aa83d412b70f900a7de3f58773f325ee45eb6c30cb1395e45a4d8092a19b4f845')

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
