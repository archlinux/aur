# Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>
# Contributor: Alan Orth <alan.orth[at]gmail[dot]com >
# Submitter: Fredrik Tegenfeldt <fredrik.tegenfeldt@unige.ch>

pkgname=slurm-llnl
pkgver=20.11.2.1
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
	"slurmctld.service"
	"slurmd.service"
	"slurmdbd.service"
	"https://github.com/SchedMD/slurm/archive/slurm-${pkgver//./-}.tar.gz")
sha512sums=('40aa91b02d8839ee94ae106de1ea675b0a79ba533f218afc87e909b5bbd38ce1135f54716094bf9384edc51409bfaeb0b7904cb387cbcbc8ad16befdafb8a5ab'
            '0f1c477be4a06fd6050afd7e4fd7d3524ce4dc9bec4e3f9bbfb0087660a29f76442139b659bc906029757646ac107e521a6b2ba120b5b2db49bc815f501fb581'
            'f74dacaaffa35fa11a62bb9efa492bb4ef9b197748f28c15210f362382da27ec1dd88a57a48fc6807029c93c9033c82e11545ea36622c683ae7bd09970ef8710'
            'a1c2478a049dc1c024d773a73f363da6c9106d9533137f919394e8213376cb9167c8fcca7b038d1c45c441a1adce4524ccb68b6dd269a1000aba11b84b5352d5'
            'ae2d0275bc9e0aac15d0d1dd4913b70ed4d4032e76c9c6ffdeae345c55834219f6495429d1d1c9129779221d6d08bada1228ccdb1c671b05d4a92ed6088bf55c'
            '56459e20d7f2624a8e8dd2982693b257e65df22c3609d991afdc1b2f79adaefc0586a76fd5fdd7dc2bdd39b3af0c91f38ddc4b1139081968903450bc28aca304'
            '669dfb2fc1ecd134e96f6de6c9d71fa99cffc5dfad64767d4b2535c66bddb9e672399c53d8a0a066c10bf45541f4e81421894f6d24857b3ed69b45eb1e976bae')


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
	install -D -m755 etc/init.d.slurm    "${pkgdir}/etc/rc.d/slurm"
	install -D -m755 etc/init.d.slurmdbd "${pkgdir}/etc/rc.d/slurmdbd"

	# Install SystemD related files
	install -D -m644 ../slurmctld.service   "${pkgdir}/usr/lib/systemd/system/slurmctld.service"
	install -D -m644 ../slurmd.service      "${pkgdir}/usr/lib/systemd/system/slurmd.service"
	install -D -m644 ../slurmdbd.service    "${pkgdir}/usr/lib/systemd/system/slurmdbd.service"
	install -D -m644 ../slurm-llnl.sysusers "${pkgdir}/usr/lib/sysusers.d/slurm-llnl.conf"
	install -D -m644 ../slurm-llnl.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/slurm-llnl.conf"

	# Create a log and a lib dir
	install -d -m755 "${pkgdir}/var/log/slurm-llnl"
	install -d -m755 "${pkgdir}/var/lib/slurm-llnl"
}
