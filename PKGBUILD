# Maintainer: Nitroretro <nitroretro@protonmail.com>

# Based on the `minecraft-server` AUR package by:
## Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>
## Contributor: Philip Abernethy <chais.z3r0@gmail.com>
## Contributor: sowieso <sowieso@dukun.de>

_ver="1.12.2_14.23.5.2768-8"
_minecraft_ver_latest="1.14.4"

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
sha512sums=('40d7c1a3b904525ced4dc3b7f2db431d155d83af124b0dc5fddf62aec368c1f21e823e6cf1f80ab35e13b0e16feeeadeca78d7c6afe6ecce8ecfa37dcfe56d79'
            '50bb0c0bcb40243fa1ed10c4f7d1f24c3ae7073bd9a09eb31ab4b61d55e0cd1867298ab5cf5c0b0bbf549a194fc6502acec6386c6f9dec0b1a2e516734a35fbd'
            'e8dc99ee822bb401dbbae6d4bb768bc60e4a48b7b03b624ffd9efa8a49b9c5adaba2d3e28d78d4bdb740acc874aa13bbb9e99953ac6f7845e9616659e4269f93'
            '30a6910c3042d5cb15dbaf785e25e5c7f69745be03b60c8bf4c3562213d2fc61c0e5b72c0a3bafca33ab599e5bf2baac408fd4b9676f7fe4da50d77d8982d4a6'
            'afa657796cb57971cb3c6ae6147ed6756998bac1260631b26d7dd76a2b4474421ff056d4cf2683e7567de33771bfa88bcc50cd149708eca491cc95128b6fd910'
            'fefaabeccd17b98752cbef8bd01f4bce27e351106c256edf6aba92267e0fc4ded36fba089f9b7f5fc2d210e5f7b07bca38d8254a2f4732516720e45a249dc5c2'
            '7f158bed6957e5285ce45a480f6a222065af5427bd48481ef24eb770ff540aa67b2d1c1ed976d216db94323017f7c7ee1dfe16e3f222b14189f9823e0b49f0f3'
            '2c9bdefe7d022be139e7aec2e5f1cc1f83ea9d35d2c945e26422e140027b5107ce32c56f0b97e7dbf6b6edb282075df4a18c156a6ed6b064bcb10a3b4481a9aa'
            'c890315962cbc180897094b3558e19ef2452f5ad587bb759e2af1808a86be4c925e7ba767746b2f6b54b24b27d66437593000c7406db5d5dc2824b0fff9775bb')

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
	[ "$_minecraft_ver_minor" = 5 ] && unzip fml_libs15.zip -d lib
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
	[ "$_minecraft_ver_minor" -le 12 ] && _forge_jar="forge-${_pkgver}-universal.jar"
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
