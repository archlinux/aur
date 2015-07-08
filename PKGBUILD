# Maintainer: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>
# Contributor: Alan Orth <alan.orth[at]gmail[dot]com >
# Submitter: Fredrik Tegenfeldt <fredrik.tegenfeldt@unige.ch>

pkgname=slurm-llnl-dev
pkgver=15.08.0_0pre6
# Hyphens (-) are prohibited however they are used by the package author
# therefore it is necessary to invoke ${pkgver} like ${pkgver//_/-}
# this will substituet any udnerscores (_) with hyphens
pkgrel=1
pkgdesc="Simple Linux Utility for Resource Management (development version)"
arch=('i686' 'x86_64')
url="http://www.schedmd.com"
license=('GPL')
depends=('munge')
optdepends=("hwloc: enables the task/cgroup plugin"
            "lua: the lua API will be available in various plugins"
            "libmariadbclient: support for accounting"
            "postgresql-libs: support for PostgreSQL"
            "hdf5: support for acct_gather_profile/hdf5 job profiling"
            "blcr: support for the checkpoint/blcr plugin"
            "openssl: support for the crypto/openssl CryptoType plugin"
            "pam: PAM support"
            "readline: Readline support in scontrol and sacctmgr's interactive modes"
            "libibmad: support for the acct_gather_infiniband/ofed InfiniBand accounting plugin"
            "libibumad: support for the acct_gather_infiniband/ofed InfiniBand accounting plugin"
            "man2html: HTML versions of the man pages will be generated"
            "rrdtool: support for the ext_sensors/rrd plugin"
            "numactl: NUMA support in the task/affinity plugin"
            "ncurses: adds the smap command "
            "gtk2: enables the sview command, a simple graphical frontend")
makedepends=('python')
provides=('slurm-llnl')
conflicts=('slurm-llnl' 'slurm-llnl-git')
install=${pkgname}.install
source=("slurm-tmpfiles.conf"
        "slurm-llnl-default-conf"
        "slurmctld.service"
        "slurmd.service"
        "slurmdbd.service"
        "http://www.schedmd.com/download/total/slurm-${pkgver//_/-}.tar.bz2")
md5sums=('51e4ae2c51edf7c145d1b87bec4c344e'
         'cae664b8ef44d01783dade9088e25b53'
         '31899d7a4caaa7bdb8b987afae191b56'
         '72a4cddcef47bdc989d49d02ee698e55'
         'cd89bfa37d6b3108fc17c531a27183a0'
         '6dad6044d5f9377838eee9289532e41d')

build() {
  cd "${srcdir}/slurm-${pkgver//_/-}"

  # If required libraries or header files are in non-standard locations,
  # set CFLAGS and LDFLAGS environment variables accordingly.
  # Optional Slurm plugins will be built automatically when the configure script
  # detects that the required build requirements are present.
  #
  # Read http://slurm.schedmd.com/quickstart_admin.html for more information

  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin  \
    --sysconfdir=/etc/slurm-llnl  \
    --localstatedir=/var

  make
}

package() {
  cd "${srcdir}/slurm-${pkgver//_/-}"

  make DESTDIR="${pkgdir}" install

  # slurm configs and license
  install -D -m644 etc/slurm.conf.example    "${pkgdir}/etc/slurm-llnl/slurm.conf.example"
  install -D -m644 etc/slurmdbd.conf.example "${pkgdir}/etc/slurm-llnl/slurmdbd.conf.example"
  install -D -m644 LICENSE.OpenSSL           "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.OpenSSL"
  install -D -m644 COPYING                   "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"

  install -D -m644 ../slurm-llnl-default-conf "${pkgdir}/etc/default/slurm-llnl"

  # init related install
  install -D -m755 etc/init.d.slurm    "${pkgdir}/etc/rc.d/slurm"
  install -D -m755 etc/init.d.slurmdbd "${pkgdir}/etc/rc.d/slurmdbd"

  # SystemD related install
  install -D -m644 ../slurmctld.service   "${pkgdir}/usr/lib/systemd/system/slurmctld.service"
  install -D -m644 ../slurmd.service      "${pkgdir}/usr/lib/systemd/system/slurmd.service"
  install -D -m644 ../slurmdbd.service    "${pkgdir}/usr/lib/systemd/system/slurmdbd.service"
  install -D -m644 ../slurm-tmpfiles.conf "${pkgdir}/etc/tmpfiles.d/slurm-tmpfiles.conf"

  # creating a log and a lib dir
  install -d -m755 "${pkgdir}/var/log/slurm-llnl"
  install -d -m755 "${pkgdir}/var/lib/slurm-llnl"
}
