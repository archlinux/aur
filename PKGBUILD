# Maintainer: Jon Gjengset <jon@thesquareplanet.com>

pkgname=intel-vtune-amplifier-community
pkgrel=1
pkgver=2019.5.0.601413
options=(!strip libtool)
url="https://software.intel.com/en-us/vtune/choose-download#standalone"
arch=('x86_64')
license=('custom')
makedepends=('libarchive' 'lzop' 'cpio' 'gtk3' 'alsa-lib' 'libxss' 'nss')
pkgdesc="VTune Amplifier -- Performance profiler for serial and parallel performance analysis"
depends=('gtk3' 'alsa-lib' 'libxss' 'nss')
conflicts=('intel-parallel-studio-xe' 'intel-vtune-amplifier')

_year='2019'
_update='5'
_base="vtune_amplifier_${_year}_update${_update}"

source=(
  "http://registrationcenter-download.intel.com/akdlm/irc_nas/tec/15703/${_base}.tar.gz"
  'EULA.txt'
  'vtune-group.conf'
)

sha256sums=('7b2124123347bbb593d1b8f8cf858d88829a05605769cba5c39444b0aa545473'
            'e13bba8c55cf874988dbb541d8a72f53dd0942fca48f49bfbe9d82174bb73808'
            '6d57b60d701db9551c5bbcc7bf5bc528c928513dabb28a2c85cc45695438381b')

if [ -z "$FORCE_PKGEXT" ]; then
	PKGEXT='.pkg.tar.lzo'
	echo "Overriding the default PKGEXT with '${PKGEXT}' to save compression time"
	echo "(change PKGEXT in the PKGBUILD or use FORCE_PKGEXT on the command line"
	echo " to override PKGEXT set by the package)."
else
	echo "Overriding PKGEXT with FORCE_PKGEXT='${FORCE_PKGEXT}'"
	PKGEXT=$FORCE_PKGEXT
fi

if [ "$PKGEXT" = ".pkg.tar.xz" ]; then
	echo "--------------------------------------------------------------------"
	echo "This PKGBUILD may need several minutes when XZ compressor is used!"
	echo "  - Change PKGEXT in PKGBUILD or define FORCE_PKGEXT on the"
	echo "    command line to use a faster compressor, e.g. .pkg.tar.lzo"
	echo "--------------------------------------------------------------------"
fi

build_() {
	grep "Build Number:" "$srcdir/${_base}/support.txt" | awk '{print $3}'
}

pkgver() {
	echo "${_year}.${_update}.0.$(build_)"
}

prepare() {
	echo -e "-----------------------------------------------------------------------------------"
	echo -e "\e[1mIMPORTANT - READ BEFORE COPYING, INSTALLING, OR USING.\e[0m"
	echo -e ""
	echo -e "Do not copy, install, or use the \"Materials\" provided under this license agreement (\"Agreement\"), until you"
	echo -e "have carefully read the following terms and conditions."
	echo -e ""
	echo -e "By copying, installing, or otherwise using the Materials, you agree to be bound by the terms of this"
	echo -e "Agreement. If you do not agree to the terms of this Agreement, do not copy, install, or use the Materials."
	echo -e " - A copy of the EULA has been copied in the PKGBUILD directory; plase read carefully the terms and "
	echo -e " - conditions of the Intel license before installing the packages. "
	echo -e "-----------------------------------------------------------------------------------"
}

build() {
	cd "$srcdir/${_base}"

	cfg=$(mktemp /tmp/vtune-silent-XXXXXX.cfg)
	cat > "$cfg" <<EOF
ACCEPT_EULA=accept
CONTINUE_WITH_OPTIONAL_ERROR=yes
PSET_INSTALL_DIR=${srcdir}/build
CONTINUE_WITH_INSTALLDIR_OVERWRITE=yes
COMPONENTS=DEFAULTS
PSET_MODE=install
CLUSTER_INSTALL_AUTOMOUNT=no
SIGNING_ENABLED=yes
AMPLIFIER_SAMPLING_DRIVER_INSTALL_TYPE=build
AMPLIFIER_DRIVER_ACCESS_GROUP=vtune
AMPLIFIER_DRIVER_PERMISSIONS=660
AMPLIFIER_LOAD_DRIVER=no
AMPLIFIER_C_COMPILER=auto
AMPLIFIER_KERNEL_SRC_DIR=auto
AMPLIFIER_MAKE_COMMAND=auto
AMPLIFIER_INSTALL_BOOT_SCRIPT=no
AMPLIFIER_DRIVER_PER_USER_MODE=no
EOF
	# the intel installer is the worst -- it writes to files in the user's
	# home directory! this prevents building the package if you have built
	# it previously. let's fix that.
	tmphome=$(mktemp -d /tmp/vtune-install-home.XXXXXX)
	# also, make sure we do a clean install
	rm -rf "${srcdir}/build"
	# we get warnings about optional dependencies not being found
	# it's not clear why this happens sadly
	# see https://software.intel.com/en-us/forums/intel-fortran-compiler-for-linux-and-mac-os-x/topic/595029
	env "HOME=$tmphome" ./install.sh --cli-mode --silent "$cfg" --SHARED_INSTALL

	rm "$cfg"

}

package() {
	cd "$srcdir"

	# make sure vtune group exists
	install -Dm644 "vtune-group.conf" "$pkgdir/usr/lib/sysusers.d/vtune.conf"

	# get rid of references to build directory
	sed -i "s@${srcdir}/build@/opt/intel@g" "build"/vtune_amplifier_2019.5.0.601413/{amplxe-2019.5.0.601413,amplxe-vars.csh,amplxe-vars.sh}

	# massage files before installing
	dir="vtune_amplifier_${_year}.${_update}.0.$(build_)"
	rm -r "build/documentation_2019"
	rm -r "build"/performance_*
	rm -r "build"/samples_*
	rm -r "build/$dir/uninstall"

	# install what remains to /opt/intel
	mkdir -p "$pkgdir/opt/intel"
	cp -r "build/$dir" "$pkgdir/opt/intel/$dir"
	ln -sfn "/opt/intel/$dir" "$pkgdir/opt/intel/vtune_amplifier_${_year}"
	ln -sfn "/opt/intel/$dir" "$pkgdir/opt/intel/vtune_amplifier"

	# also make sure that /opt/intel is on the user's path
	mkdir -p "$pkgdir/etc/profile.d"
	cat > "$pkgdir/etc/profile.d/intel_vtune-amplifier.sh" <<EOF
export PKG_CONFIG_PATH='/opt/intel/$dir'/include/pkgconfig/lib64:$PKG_CONFIG_PATH
export PATH='/opt/intel/$dir'/bin64:$PATH
export VTUNE_AMPLIFIER_2019_DIR='/opt/intel/$dir'
EOF
}
