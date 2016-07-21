# Maintainer: Dan Collins <collins.dan.openlava@badbytes.net>

pkgname=openlava
pkgver=4.0
pkgvershort=4.0
pkgrel=3
pkgdesc="A open source cluster scheduler"
conflicts=("openlava")
depends=("autoconf")
provides=("openlava=${pkgver}")
arch=('i686' 'x86_64')
url="http://www.openlava.org/"
license=("GPL2")
install=${pkgname}.install
bk="opt/openlava/conf/"
backup=(
#${bk}"lsf.conf"
#${bk}"lsf.task"
#${bk}"lsb.params"
#${bk}"lsb.queues"
#${bk}"lsb.users" 
#${bk}"lsf.cluster.openlava"
#${bk}"lsf.conf"
#${bk}"lsf.shared"
#${bk}"lsf.tasks"
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
	#EnvironmentFile=-/etc/sysconfig/${pkgbase}-dir
    #User=openlava
	ExecStart=/opt/${pkgbase}/etc/openlava start

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
	cd config \
    cp lsb.hosts lsb.params lsb.queues lsb.users \
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
    make clean
	make DESTDIR=${pkgdir} install
	install -D -m0644 ${srcdir}/openlava.service ${pkgdir}/usr/lib/systemd/system/openlava.service
    #install -D -m0644 ${srcdir}/openlava-${pkgver}/config/lsb.hosts ${pkgdir}/opt/openlava/etc/lsb.hosts
    #install -D -m0644 ${srcdir}/openlava-${pkgver}/config/lsb.params ${pkgdir}/opt/openlava/etc/lsb.params
    #install -D -m0644 ${srcdir}/openlava-${pkgver}/config/lsb.queues ${pkgdir}/opt/openlava/etc/lsb.queues
    #install -D -m0644 ${srcdir}/openlava-${pkgver}/config/lsb.users ${pkgdir}/opt/openlava/etc/lsb.users
    #install -D -m0644 ${srcdir}/openlava-${pkgver}/config/lsf.cluster.openlava ${pkgdir}/opt/openlava/etc/lsf.cluster.openlava
    #install -D -m0644 ${srcdir}/openlava-${pkgver}/config/lsf.conf ${pkgdir}/opt/openlava/etc/lsf.conf
    #install -D -m0644 ${srcdir}/openlava-${pkgver}/config/lsf.shared ${pkgdir}/opt/openlava/etc/lsf.shared
    #install -D -m0644 ${srcdir}/openlava-${pkgver}/config/lsf.task ${pkgdir}/opt/openlava/etc/lsf.task
    #install -D -m0644 ${srcdir}/openlava-${pkgver}/config/openlava ${pkgdir}/opt/openlava/etc/openlava
    #install -D -m0644 ${srcdir}/openlava-${pkgver}/config/openlava.sh ${pkgdir}/opt/openlava/etc/openlava.sh
    #install -D -m0644 ${srcdir}/openlava-${pkgver}/config/openlava.setup ${pkgdir}/opt/openlava/etc/openlava.setup
    #install -D -m0644 ${srcdir}/openlava-${pkgver}/config/openlava.csh ${pkgdir}/opt/openlava/etc/openlava.csh
    
    #lsb.params lsb.queues lsb.users \
    #lsf.cluster.openlava lsf.conf lsf.shared lsf.tasks openlava.* \
    #opt/openlava/etc
}

sha256sums=('0a694392786b4994973ff39e0aecfc92115f083666750810738e1d2baffad3df')
