# Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>
# Contributor: Alan Orth <alan.orth[at]gmail[dot]com >
# Submitter: Fredrik Tegenfeldt <fredrik.tegenfeldt@unige.ch>

pkgname=slurm-llnl
pkgver=22.05.1.1
# Hyphens (-) are prohibited however they are used by the package author
# therefore it is necessary to invoke ${pkgver} like ${pkgver//./-}
# this will substitute any full stops (.) with hyphens
pkgrel=1
pkgdesc="Simple Linux Utility for Resource Management"
arch=('i686' 'x86_64' 'armv7h')
url="https://www.schedmd.com"
license=('GPL')
depends=('munge')
optdepends=("hwloc: enables the task/cgroup plugin"
	"lua: the lua API will be available in various plugins"
	"libmariadbclient: support for accounting"
	"postgresql-libs: support for PostgreSQL"
	"hdf5: support for acct_gather_profile/hdf5 job profiling"
	"openssl: support for the crypto/openssl CryptoType plugin"
	"pam: PAM support"
	"readline: Readline support in scontrol and sacctmgr's interactive modes"
	"libibmad: support for the acct_gather_infiniband/ofed InfiniBand accounting plugin"
	"libibumad: support for the acct_gather_infiniband/ofed InfiniBand accounting plugin"
	"man2html: HTML versions of the man pages will be generated"
	"rrdtool: support for the ext_sensors/rrd plugin"
	"numactl: NUMA support in the task/affinity plugin"
	"ncurses: adds the smap command "
	"gtk2: enables the sview command, a simple graphical frontend"
	"pmix: support Open MPI applications using PMIx")
makedepends=('python' 'gtk2' 'hwloc' 'rrdtool' 'hdf5')
backup=('etc/sysconfig/slurmd' 'etc/sysconfig/slurmctld' 'etc/sysconfig/slurmdbd')
source=("slurm-llnl.sysusers"
	"slurm-llnl.tmpfiles"
	"https://github.com/SchedMD/slurm/archive/slurm-${pkgver//./-}.tar.gz")
sha512sums=('8373ef791d68a7e0b2114f5ce670da1936bd8d96fd51fa7319d4feb85f16a673f89abcb823a114455d32d8fd9eee3e121c313a0aa986542540f120e6d35686e6'
            '4f7d1e36abc2ca5aa38b40403292b68f769238766ecdd44ea5d29f8106bd9b7c3e0d2236208f92e00818e37dd24c9520b6e9fe06e01b6e552ac485a1df682edd'
            'c37c25438df660f8fa087240a0dbb40dc609b8248168239ecac9fd43b8085efce52ee25e2d6a0d8feed23ce50e7a34e0209fb98ce810b915407878662da74a12')


build() {
	cd "${srcdir}/slurm-slurm-${pkgver//./-}"

	# If required libraries or header files are in non-standard locations,
	# set CFLAGS and LDFLAGS environment variables accordingly.
	# Optional Slurm plugins will be built automatically when the configure script
	# detects that the required build requirements are present.
	#
	# Read https://slurm.schedmd.com/quickstart_admin.html for more information

	# Slurm requires a relaxed build environment, see https://bugs.schedmd.com/show_bug.cgi?id=2443
	export CFLAGS="${CFLAGS//-z,now/-z,lazy}"
	export CFLAGS="${CFLAGS//-fno-plt/}"
	export LDFLAGS="${LDFLAGS//-z,now/-z,lazy}"

	autoreconf
	./configure \
		--disable-developer \
		--disable-debug \
		--enable-optimizations \
		--prefix=/usr \
		--sbindir=/usr/bin \
		--sysconfdir=/etc/slurm-llnl \
		--localstatedir=/var \
		--enable-pam \
		--with-hdf5 \
		--with-hwloc \
		--with-rrdtool \
		--with-munge

	make
}

package() {
	cd "${srcdir}/slurm-slurm-${pkgver//./-}"

	make DESTDIR="${pkgdir}" install

	# Install slurm's configs and license
	install -D -m644 etc/slurm.conf.example    "${pkgdir}/etc/slurm-llnl/slurm.conf.example"
	install -D -m644 etc/slurmdbd.conf.example "${pkgdir}/etc/slurm-llnl/slurmdbd.conf.example"
	install -D -m644 LICENSE.OpenSSL           "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.OpenSSL"
	install -D -m644 COPYING                   "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"

	install -d -m755 "${pkgdir}/etc/sysconfig"
	echo '#SLURMD_OPTIONS=""' > "${pkgdir}/etc/sysconfig/slurmd"
	echo '#SLURMCTLD_OPTIONS=""' > "${pkgdir}/etc/sysconfig/slurmctld"
	echo '#SLURMDBD_OPTIONS=""' > "${pkgdir}/etc/sysconfig/slurmdbd"
	chmod 644 "${pkgdir}/etc/sysconfig/"{slurmd,slurmctld,slurmdbd}

	# Install init related files
	install -D -m755 etc/init.d.slurm      "${pkgdir}/etc/rc.d/slurm"
	install -D -m755 etc/init.d.slurmdbd   "${pkgdir}/etc/rc.d/slurmdbd"
	install -D -m644 etc/slurmctld.service "${pkgdir}/usr/lib/systemd/system/slurmctld.service"
	install -D -m644 etc/slurmd.service    "${pkgdir}/usr/lib/systemd/system/slurmd.service"
	install -D -m644 etc/slurmdbd.service  "${pkgdir}/usr/lib/systemd/system/slurmdbd.service"

	# Install SystemD related files
	install -D -m644 ../slurm-llnl.sysusers "${pkgdir}/usr/lib/sysusers.d/slurm-llnl.conf"
	install -D -m644 ../slurm-llnl.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/slurm-llnl.conf"

	# Create a log and a lib dir
	install -d -m755 "${pkgdir}/var/log/slurm-llnl"
	install -d -m755 "${pkgdir}/var/lib/slurm-llnl"
}
