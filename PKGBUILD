# Maintainer: Arthur Vuillard <arthur@hashbang.fr>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Julien "Adyxax" Dessaux <judessaux@gmail.com>

pkgname=shinken
pkgver=2.4.1
pkgrel=1
pkgdesc="An open source Nagios like tool, redesigned and rewritten from scratch. Its main goal is to meet today's system monitoring requirements while still following compatibility to Nagios"
arch=('any')
url='http://www.shinken-monitoring.org/'
license=('GPL3')
depends=('python2-pycurl')
makedepends=('python2-setuptools' 'python2-sphinx')
optdepends=(
    'monitoring-plugins: various monitoring checks'
    'python2-cherrypy: faster launching'
)
install='shinken.install'
backup=(
    'etc/shinken/notificationways/sms-android.cfg'
    'etc/shinken/notificationways/detailled-email.cfg'
    'etc/shinken/notificationways/email.cfg'
    'etc/shinken/pollers/poller-master.cfg'
    'etc/shinken/timeperiods/us-holidays.cfg'
    'etc/shinken/timeperiods/workhours.cfg'
    'etc/shinken/timeperiods/none.cfg'
    'etc/shinken/timeperiods/24x7.cfg'
    'etc/shinken/escalations/sample.cfg'
    'etc/shinken/shinken.cfg'
    'etc/shinken/templates/time_templates.cfg'
    'etc/shinken/templates/generic-contact.cfg'
    'etc/shinken/templates/generic-service.cfg'
    'etc/shinken/templates/generic-host.cfg'
    'etc/shinken/templates/srv-pnp.cfg'
    'etc/shinken/contactgroups/users.cfg'
    'etc/shinken/contactgroups/admins.cfg'
    'etc/shinken/reactionners/reactionner-android-sms.cfg'
    'etc/shinken/reactionners/reactionner-master.cfg'
    'etc/shinken/realms/all.cfg'
    'etc/shinken/discovery/discovery.cfg'
    'etc/shinken/discovery/discovery_runs.cfg'
    'etc/shinken/discovery/discovery_rules.cfg'
    'etc/shinken/hostgroups/linux.cfg'
    'etc/shinken/resource.d/snmp.cfg'
    'etc/shinken/resource.d/active-directory.cfg'
    'etc/shinken/resource.d/nmap.cfg'
    'etc/shinken/resource.d/paths.cfg'
    'etc/shinken/servicegroups/sample.cfg'
    'etc/shinken/contacts/guest.cfg'
    'etc/shinken/contacts/admin.cfg'
    'etc/shinken/modules/sample.cfg'
    'etc/shinken/services/services.cfg'
    'etc/shinken/hosts/localhost.cfg'
    'etc/shinken/dependencies/sample.cfg'
    'etc/shinken/arbiters/arbiter-master.cfg'
    'etc/shinken/daemons/receiverd.ini'
    'etc/shinken/daemons/brokerd.ini'
    'etc/shinken/daemons/pollerd.ini'
    'etc/shinken/daemons/reactionnerd.ini'
    'etc/shinken/daemons/schedulerd.ini'
    'etc/shinken/packs/readme.cfg'
    'etc/shinken/schedulers/scheduler-master.cfg'
    'etc/shinken/brokers/broker-master.cfg'
    'etc/shinken/commands/check_nrpe_args.cfg'
    'etc/shinken/commands/reload-shinken.cfg'
    'etc/shinken/commands/notify-service-by-android-sms.cfg'
    'etc/shinken/commands/check_snmp_time.cfg'
    'etc/shinken/commands/restart-shinken.cfg'
    'etc/shinken/commands/configuration-check.cfg'
    'etc/shinken/commands/check_dig.cfg'
    'etc/shinken/commands/check_ping.cfg'
    'etc/shinken/commands/notify-host-by-android-sms.cfg'
    'etc/shinken/commands/check_tcp.cfg'
    'etc/shinken/commands/check_nrpe.cfg'
    'etc/shinken/commands/notify-host-by-email.cfg'
    'etc/shinken/commands/detailled-service-by-email.cfg'
    'etc/shinken/commands/check_host_alive.cfg'
    'etc/shinken/commands/detailled-host-by-email.cfg'
    'etc/shinken/commands/notify-service-by-email.cfg'
    'etc/shinken/commands/check_snmp_service.cfg'
    'etc/shinken/commands/check_snmp_storage.cfg'
    'etc/shinken/commands/notify-host-by-xmpp.cfg'
    'etc/shinken/commands/notify-service-by-xmpp.cfg'
    'etc/shinken/receivers/receiver-master.cfg'
    'etc/default/shinken'
    'etc/logrotate.d/shinken'
)
source=(
    "https://github.com/naparuba/${pkgname}/archive/${pkgver}.tar.gz"
    "shinken-arbiter.service"
    "shinken-broker.service"
    "shinken.install"
    "shinken.logrotate"
    "shinken-poller.service"
    "shinken-reactionner.service"
    "shinken-receiver.service"
    "shinken-scheduler.service"
    "shinken.tmpfiles"
    "default"
)

prepare() {
    cd "$srcdir/shinken-${pkgver}"
    find -name '*.py' -exec sed -i 's|^#!/usr/bin/env python2.6$|#!/usr/bin/env python2|' {} \;
    find -name '*.py' -exec sed -i 's|^#!/usr/bin/env python\s*$|#!/usr/bin/env python2|' {} \;
    find bin -type f -exec sed -i 's|^#!/usr/bin/env python\s*$|#!/usr/bin/env python2|' {} \;
    sed -i "s#/usr/lib/nagios/plugins#/usr/lib/monitoring-plugins#" etc/resource.d/paths.cfg
}

build() {
    cd "$srcdir/shinken-${pkgver}"
    python2 setup.py build

    msg2 "Building docs"
    cd doc
    sphinx-build2 -b man -d build/doctrees/ source/ build/man/
}

package() {
    cd "$srcdir/shinken-${pkgver}"

    mkdir -p $pkgdir/usr/lib/python2.7/site-packages/
    cp -r build/lib/shinken $pkgdir/usr/lib/python2.7/site-packages/

    mkdir -p $pkgdir/etc/default
    cp -r etc/ $pkgdir/etc/shinken/

    cp $srcdir/default $pkgdir/etc/default/shinken

    mkdir -p $pkgdir/usr/bin
    BINFILES=`ls bin/shinken* | grep -v "\.py$"`
    for binfile in $BINFILES ; do
        cp $binfile $pkgdir/usr/bin
    done

    install -dm0755 $pkgdir/var/lib/shinken/rw
    cp -r cli doc inventory modules share libexec $pkgdir/var/lib/shinken/

    mkdir -p $pkgdir/usr/share/man/man1/
    gzip -c doc/build/man/shinken.1 > $pkgdir/usr/share/man/man1/shinken.1.gz

    # logrotate
    install -Dm0644 $srcdir/shinken.logrotate "$pkgdir/etc/logrotate.d/shinken"
    # log dir
    install -dDm0750 $pkgdir/var/log/shinken

    # systemd
    install -Dm0644 $srcdir/shinken.tmpfiles $pkgdir/usr/lib/tmpfiles.d/shinken.conf
    for service in arbiter poller reactionner scheduler broker receiver; do
        install -Dm0644 $srcdir/shinken-${service}.service $pkgdir/usr/lib/systemd/system/shinken-${service}.service
    done

    # cleanup
    rm -r $pkgdir/etc/shinken/sample*
    rm $pkgdir/etc/shinken/dev.cfg
    rm -r $pkgdir/etc/shinken/certs/
}

sha256sums=('2968cc60ba201c690b10daf9424df4e07708a5077a6a60f0aa954ecb95073254'
            'efa31d6bac681f6e994f5a0544ecaa5ab044099057d5e75d2e6b41e9e69f361f'
            '845315a7eb1b1a3f7fca8051b1470d28b5e9950ce55cda17bf2d0a7bc4a1e644'
            '86dcb7112517110c6fc4f47070e8f217d45185ce2ceab1b9d69653f3870577c2'
            '2af98d2de44b7b1d587f10fb46c3c3dceb1d96083d6398596b2e49ca5b69053a'
            'd6c6cfe8c7cffd7f12eb905b1d740d1c1f599a2611e07ce975679071c2f19648'
            '8c2bdcc3af62f06a2f8168fb9eef74d65a931fba8be91a4947edc7d3e93666b1'
            'eaf9ca44e8d4a1589d694ea9341ad91c41306a6c0038d5fa7a41e36556cfafff'
            'b4d80c1b54dfa5890d4a9e68622e197444aa8c6132d003b7ddd12ae9b2a15615'
            '02bfb59fdfdbfd3f55ef8a32c2b7c70f340d4db604a8d3bf7b22825632f0584d'
            '3cfb0d927acc802cbaadd1031da215df7250784f8ace99e18c53ba36423b7411')

