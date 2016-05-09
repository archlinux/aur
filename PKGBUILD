# Maintainer: Dan Collins <collins.dan.openlava@badbytes.net>

pkgname=openlava
pkgver=3.2
pkgvershort=3.2
pkgrel=1
pkgdesc="A open source cluster scheduler"
conflicts=("openlava")
depends=("autoconf")
provides=("openlava=${pkgver}")
arch=('i686' 'x86_64')
url="http://www.openlava.org/"
license=("GPL2")
install=${pkgname}.install
backup=("opt/openlava-3.2/conf/lsf.conf"
    )
source=("https://github.com/openlava/openlava/archive/${pkgver}.tar.gz")
#{,.sig}
#	'openlava.service')

_genfiles() {
  > "${srcdir}/${pkgbase}.service" cat <<-EOF
	#
	# ${pkgbase^} Director Daemon service
	#

	[Unit]
	Description=${pkgbase^} Director
	Requires=network.target
	After=network.target remote-fs.target syslog.target
	# Dependency about the database
	# We let administrators decide if they need it (if local db instance)
	#Wants=sqlite3.service
	# Check if working dir exist and is a directory
	ConditionPathIsDirectory=${_workdir}

	[Service]
	Type=forking
	Restart=always
	#PIDFile=/run/${pkgbase}.pid
	# EnvironmentFile=-/etc/sysconfig/${pkgbase}-dir
	ExecStart=/opt/${pkgbase}/etc/openlava start
    #User=openlava

	[Install]
	WantedBy=multi-user.target
	EOF
	}
_geninstallscript() {
	echo 'Running post install script'
  > "${pkgbase}.install" cat <<-EOF
	#
	# ${pkgbase^} install script
	#
	post_install(){
	cd config;cp lsb.hosts lsb.params lsb.queues lsb.users \
	lsf.cluster.openlava lsf.conf lsf.shared lsf.tasks openlava.* \
	/opt/openlava/etc
	useradd -r openlava
	chown -R openlava:openlava /opt/openlava
	}
	
	EOF
	}
prepare() {
	_genfiles
	_geninstallscript
}
build() {
	cd openlava-${pkgver}/

    ./bootstrap.sh
	./configure \
		--prefix=/opt/openlava/ \
		--with-systemd=/usr/lib/systemd/system/ \

    make clean
	make


}

package() {
	cd openlava-${pkgver}/

	make DESTDIR=${pkgdir} install

	install -D -m0644 ${srcdir}/openlava.service ${pkgdir}/usr/lib/systemd/system/openlava.service
}




sha256sums=('f985d117a7405ebdfc11646e549d2a8869b521ce02c630c2e6e413cf57c2a2e0')
