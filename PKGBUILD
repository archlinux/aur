# Maintainer: Darjan Krijan [https://disc-kuraudo.eu]
# Manual download of 'AMDuProf_Linux_x64_${pkgver}.tar.bz2' required from upstream

_pkgname=AMDuProf_Linux_x64
pkgname=amduprof
pkgver=4.1.424
pkgrel=1
pkgdesc="AMD uProf performance analysis tool."
arch=('x86_64')
license=('custom')
url="https://developer.amd.com/amd-uprof/"
source=(
	"local://AMDuProf_Linux_x64_${pkgver}.tar.bz2"
	"modulefile"
)
options=('staticlibs' '!strip' 'libtool')
optdepends=('env-modules')
depends=(dkms)
install=amduprof.install
md5sums=(
	"1ec35feb80b7141e0e06eba847ed71f8"
	"SKIP"
)

amduprof_prefix=/opt/${pkgname}

package() {
	prefix=${pkgdir}/${amduprof_prefix}
	mkdir -p ${prefix}
	cp -dr ${srcdir}/AMDuProf_Linux_x64_${pkgver}/* ${prefix}

	# symlinks
	mkdir -p "${pkgdir}/usr/"{bin,share/man/man1}
	ln -s "${amduprof_prefix}"/bin/{AMDRemoteAgent,AMDuProf,AMDuProfCLI} "${pkgdir}/usr/bin"
	ln -s "${amduprof_prefix}"/bin/Help/man1/{AMDRemoteAgent.1.gz,AMDuProfCLI-collect.1.gz,AMDuProfCLI-info.1.gz,AMDuProfCLI-report.1.gz,AMDuProfCLI-timechart.1.gz} \
		"${pkgdir}/usr/share/man/man1"

	# kernel module
	cd "${srcdir}/${_pkgname}_${pkgver}"
	local _modname=AMDPowerProfiler
	local _modver=$(cat bin/AMDPowerProfilerVersion)
	tar zxf bin/AMDPowerProfilerDriverSource.tar.gz -C "${srcdir}"
	cd "${srcdir}"/${_modname}-${_modver}
	mkdir -p "${pkgdir}"/usr/src/${_modname}-${_modver}
	cp -dr --no-preserve=ownership {inc/,src/,AMDPowerProfilerVersion,dkms.conf,Makefile} \
		"${pkgdir}"/usr/src/${_modname}-${_modver}
	echo $_modname | install -Dm 644 /dev/stdin "$pkgdir"/etc/modules-load.d/$pkgname.conf
	# TODO: The following tmpfile won't work. Instead add a systemd service file running
	# `/bin/mknod /dev/AMDPowerProfiler -m 666 c $(/bin/cat /proc/AMDPowerProfiler/device) 0` after the kernel module has been loaded.
	#echo "c /dev/$_modname 666 root root - 234:0" |
	#  install -Dm 644 /dev/stdin "$pkgdir"/usr/lib/tmpfiles.d/$pkgname.conf

	# env-modules (optional)
	cp ${srcdir}/modulefile ${prefix}
	mkdir -p ${pkgdir}/etc/modules/modulefiles/
	ln -s ${amduprof_prefix}/modulefile ${pkgdir}/etc/modules/modulefiles/${pkgname}
}
