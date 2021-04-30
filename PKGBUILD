# Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>
# Contributor: Alan Orth <alan.orth[at]gmail[dot]com >
# Submitter: Fredrik Tegenfeldt <fredrik.tegenfeldt@unige.ch>

pkgname=slurm-llnl
pkgver=20.11.6.1
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
makedepends=('python' 'gtk2')
backup=('etc/default/slurm-llnl')
source=("slurm-llnl.sysusers"
	"slurm-llnl.tmpfiles"
	"slurm-llnl-default-conf"
	"https://github.com/SchedMD/slurm/archive/slurm-${pkgver//./-}.tar.gz")
sha512sums=('40aa91b02d8839ee94ae106de1ea675b0a79ba533f218afc87e909b5bbd38ce1135f54716094bf9384edc51409bfaeb0b7904cb387cbcbc8ad16befdafb8a5ab'
            '0f1c477be4a06fd6050afd7e4fd7d3524ce4dc9bec4e3f9bbfb0087660a29f76442139b659bc906029757646ac107e521a6b2ba120b5b2db49bc815f501fb581'
            'f74dacaaffa35fa11a62bb9efa492bb4ef9b197748f28c15210f362382da27ec1dd88a57a48fc6807029c93c9033c82e11545ea36622c683ae7bd09970ef8710'
            '5ab6e20e5e9048acb7a01a9bf44f8e8c2bca90eb864cc6a42c1d1bf4c78bb2f4ca2c6999d28d7e9801045e6a86be0a36fe0bd79123c7ff8f5823c1bc7b23be90')


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
		--with-pmix=/usr \
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

	install -D -m644 ../slurm-llnl-default-conf "${pkgdir}/etc/default/slurm-llnl"

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
