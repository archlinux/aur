# Maintainer: Nitroretro <nitroretro@protonmail.com>

# Based on the `minecraft-server` AUR package by:
## Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>
## Contributor: Philip Abernethy <chais.z3r0@gmail.com>
## Contributor: sowieso <sowieso@dukun.de>

[ -z "$FORGE_SRV_PKGVER" ] && FORGE_SRV_PKGVER="1.14.4_28.1.0-8"
[ -z "$FORGE_SRV_MCVER_LATEST" ] && FORGE_SRV_MCVER_LATEST="1.14.4"

IFS="-" read -ra _ver_temp <<< "$FORGE_SRV_PKGVER"
IFS="_" read -ra _pkgver_temp <<< "${_ver_temp[0]}"
IFS="." read -ra _minecraft_ver_temp <<< "${_pkgver_temp[0]}"

_minecraft_ver=${_pkgver_temp[0]}
_minecraft_ver_major=${_minecraft_ver_temp[0]:-0}
_minecraft_ver_minor=${_minecraft_ver_temp[1]:-0}
_minecraft_ver_patch=${_minecraft_ver_temp[2]:-0}
_forge_ver=${_pkgver_temp[1]}

_pkgver="${_minecraft_ver}-${_forge_ver}"

[ "$_minecraft_ver" = "$FORGE_SRV_MCVER_LATEST" ] && pkgname="forge-server" || pkgname="forge-server-${_minecraft_ver}"
pkgver=${_pkgver//-/_}
pkgrel=${_ver_temp[1]}
pkgdesc="Minecraft Forge server unit files, script and jar"
arch=("any")
url="https://minecraftforge.net"
license=("custom")
depends=("java-runtime-headless=8" "screen" "sudo" "bash" "awk" "sed")
optdepends=("tar: needed in order to create world backups"
	"netcat: required in order to suspend an idle server")
provides=("forge-server=${pkgver}")
conflicts=("forge-server")
backup=("etc/conf.d/forge")
[ "$FORGE_SRV_PKGVER" = "1.14.4_28.1.0-8" ] && install="forge-server.install" || install="forge-server-custom.install"
source=("forged-backup.service"
	"forged-backup.timer"
	"forged.service"
	"forged.conf"
	"forged.sh")
noextract=("forge-${_pkgver}.jar")
sha512sums=('e9a391a330320a7aea127a3e8ad399d8d6e3c926eac2c0df7a4e550ba61cc13fec737f7e984bd98b9e1f9f9d5a654ee241eeef6a2e433ec845e300ef29405f62'
            'a47b5a9e2262877008a5dcae3a833fe99f911631d6fdbe97b95e0451e1dd2b5a26b6f7b843dd6a8ccd4f663cf5c3bca53a89a1d3aabb363281ab6c6fb19e41a4'
            'd6bde61a7aa479b85e35b4a3eccb9b3237a6c97f8919b3d704434f1df15672b74c7ae9ca9473eea6a0593e6e80892a2510782115185c1b7fe332720ccb78a7bd'
            '6c82f776e337d8c5eca11fea87ce6f6cfe4a5e881db947336d9c8605bd36a4ce0b7b8811e11d79285dd855cd2bdc3f65526b7aaa8d47cb14a7b8cf452462329c'
            '2a9a911e9290573718d7cf00a834e4dc0211c63a2de4d132c0b6c418d2616084dee68b934ae6e6554a0f6a037e35620d2df8b8d736acbd2fe8f71e0656c3ea46'
            '2890b40882c6b91a96024ba7ace6feef85530be74bfde4441fd55ca5244b5a739ccfd8d2d99b47e6fb97b1acc3ee5aa5a648d637f8afa2f353abdb1986d4dcb9'
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
	[ "$_minecraft_ver_minor" = 5 ] && unzip fml_libs15.zip -d lib
	java -jar "forge-${_pkgver}-installer.jar" --installServer
}

package() {
	# Install forged
	install -Dm644 "forged-backup.service" "${pkgdir}/usr/lib/systemd/system/forged-backup.service"
	install -Dm644 "forged-backup.timer" "${pkgdir}/usr/lib/systemd/system/forged-backup.timer"
	install -Dm644 "forged.service" "${pkgdir}/usr/lib/systemd/system/forged.service"
	install -Dm644 "forged.conf" "${pkgdir}/etc/conf.d/forge"
	install -Dm755 "forged.sh" "${pkgdir}/usr/bin/forged"

	# Install Forge
	_forge_jar="forge-${_pkgver}.jar"
	[ "$_minecraft_ver_minor" -le 12 ] && _forge_jar="forge-${_pkgver}-universal.jar"
	[ "$_minecraft_ver_minor" = 7 ] && _forge_jar="forge-${_pkgver}-${_minecraft_ver}-universal.jar"
	[ "$_minecraft_ver_minor" -le 6 ] && _forge_jar="minecraftforge-universal-${_pkgver}.jar"

	install -Dm644 "$_forge_jar" "${pkgdir}/srv/forge/$_forge_jar"
	ln -s "$_forge_jar" "${pkgdir}/srv/forge/forge.jar"
	find libraries -type f -print0 | xargs -0 -i@ install -Dm644 "@" "${pkgdir}/srv/forge/@"
	[ "$_minecraft_ver_minor" = 5 ] && find lib -type f -print0 | xargs -0 -i@ install -Dm644 "@" "${pkgdir}/srv/forge/@"

	# Install Minecraft Server (for 1.12.2 or lower)
	if [ "$_minecraft_ver_minor" = 5 ]; then
		install -Dm644 "minecraft_server.${_minecraft_ver}.jar" "${pkgdir}/srv/forge/minecraft_server.jar"
	elif [ "$_minecraft_ver_minor" -le 12 ]; then
		install -Dm644 "minecraft_server.${_minecraft_ver}.jar" "${pkgdir}/srv/forge/minecraft_server.${_minecraft_ver}.jar"
	fi

	# Link log files
	mkdir -p "${pkgdir}/var/log/"
	install -dm2755 "${pkgdir}/srv/forge/logs"
	ln -s "/srv/forge/logs" "${pkgdir}/var/log/forge"

	# Install licenses
	for _license in "${_licenses[@]}"; do
		_filename="$(basename "$_license" "$_license_suffix").txt"
		_filename="${_filename//\%20/ }"
		install -Dm644 "$_license" "${pkgdir}/usr/share/licenses/${pkgname}/$_filename"
	done

	chmod g+ws "${pkgdir}/srv/forge"
}
