# Maintainer: Anton Hvornum <anton.feeds+AUR@gmail.com>
# makepkg --printsrcinfo > .SRCINFO
# TODO: lower case all variables, just so we don't mess something up and poke people in the eye.
_owner=Torxed
_name=archiso-offline-releng
pkgname=$_name
pkgver=0.0.1.r1
pkgrel=1
pkgdesc="A simple, offline-installable modification on archiso/releng"
arch=('x86_64')
url="https://github.com/Torxed"
license=('custom:BSD' 'cc-by-nc-sa-3.0')
depends=('archiso' 'pacman' 'wget' 'tar' 'ed')
provides=('archiso-offline-releng')
source=("https://aur.archlinux.org/cgit/aur.git/snapshot/archiso-offline-releng.tar.gz")
sha256sums=('SKIP')

# Target function is the function we'll be looking for to prepend our offline functions
# (function won't get replaced, just moved down a little bit to make space for our own)
#
# target function chain is where in the build process to inject our own chain right before.
TARGET_FUNCTION="make_iso()"
TARGET_FUNCTION_CHAIN="make_customize_airootfs"
OFFLINE_MIRROR_PATH="${script_path}/${work_dir}/x86_64/airootfs/srv/http/arch_offline"

prepare() {
    mkdir -p "$srcdir/usr/share/archiso/configs/offline_releng"
    cp -r /usr/share/archiso/configs/releng/* "$srcdir/usr/share/archiso/configs/offline_releng/"
}

build() {
    ## Instead of a patch file, which, requires more maintanance between upgrades..
	## We'll use these stringified functions and prepend these before a known function
	## in the standard build.sh script. That way it doesn't matter if functions get patched
	## and line numbers/content changes. As long as the overall work-flow of build.sh
	## stays intact, we'll have a greater success of injecting the offline functions.

	BUILD_FUNCTIONS=$(<$srcdir/${_name}/offline_functions.sh)

	CHAIN_INJECT="run_once make_aur_packages\n"
	CHAIN_INJECT+="run_once make_offline_mirror\n"
	CHAIN_INJECT+="run_once patch_in_local_mirror\n"
	CHAIN_INJECT+="run_once install_aur\n"
	CHAIN_INJECT+="run_once finalize_offline\n"

	# Patch in the functions right before $TARGET_FUNCTION and migrate over the OFFLINE_MIRROR_PATH.
	# TODO: use sed to replace a fancy variable in offline_function.sh and insert $TARGET_FUNCTION,
	#       since now it's hard coded and if we change in here, it won't work after this `ed` oneliner.
	printf '%s\n' "/${TARGET_FUNCTION}/r $srcdir/${_name}/offline_functions.sh" 1 "/${TARGET_FUNCTION}/d" w | ed "$srcdir/usr/share/archiso/configs/offline_releng/build.sh"
	sed -i "s;verbose=;offline_mirror_path=${OFFLINE_MIRROR_PATH}\n&;" "$srcdir/usr/share/archiso/configs/offline_releng/build.sh"

	# Patch in the function calls before $TARGET_FUNCTION_CHAIN
	sed -i "s/run_once ${TARGET_FUNCTION_CHAIN}/${CHAIN_INJECT}\n&/" "$srcdir/usr/share/archiso/configs/offline_releng/build.sh"
}

package() {
    cd ${srcdir}

    # Install the offline-modified releng
    install -dm 755 "$pkgdir/usr/share/archiso/configs"
    cp -r "$srcdir/usr/share/archiso/configs/offline_releng" "$pkgdir/usr/share/archiso/configs/"
}

