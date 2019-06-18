# Maintainer:  Andrzej Giniewicz <gginiu@gmail.com>

pkgbase=domjudge
pkgname=('domjudge-domserver' 'domjudge-docs' 'domjudge-judgehost' 'domjudge-submit')
pkgver=7.0.2
pkgrel=1
pkgdesc="an automated judge system to run programming contests"
arch=("$CARCH")
url="http://www.domjudge.org/"
license=('GPL')
makedepends=('boost' 'composer' 'inetutils' 'libcgroup' 'git' 'jsoncpp')
optdepends=(
        'mysql: to run database on current host'
        'phpmyadmin: to access database in an emergency'
        'ntp: to keep judgehosts clocks in sync'
        'beep: for notification of errors')
source=(
        "https://www.domjudge.org/releases/domjudge-$pkgver.tar.gz"
        domjudge-domserver.conf
        domjudge-judgehost.conf
        domjudge-judgehostd.service
        domjudge-judgehostd@.service
        domjudge-cgroup.service)
sha256sums=('0c311c18dc505fd5cbc231bc7740842058e7d1c2e8eb400995a55420b3740a57'
            'c0dfd31c0d19856df324057ffb4f81d50fe765c48026d419ceaea71864663532'
            '06faeeea3e3abda5a53a9ae150c6289cd49062c9a22129436640d11a9948eed5'
            '9ed301acc46bcc4de0ac38fc7fa9abe13912deb64ff549dd68ada54b9158f680'
            '2b88ea6555d1887f4e27a863be151326955a2687c6388e81512517a56d009334'
            'd0a921ca8f81b3550acc8fa27713624ca39540090c943293242dcc9cd85b8049')

build() {
    cd "$srcdir/domjudge-$pkgver"
    domserver_lib="/usr/lib/domserver"
    judgehost_lib="/usr/lib/judgehost"
    domserver_var="/var/lib/domserver"
    judgehost_var="/var/lib/judgehost"
    ./configure --enable-fhs --prefix=/usr\
        --bindir=/usr/bin\
        --sbindir=/usr/bin\
        --libexecdir=/usr/libexec\
        --sysconfdir=/etc\
        --sharedstatedir=/var\
        --localstatedir=/var\
        --libdir=/usr/lib\
        --includedir=/usr/include\
        --datarootdir=/var/lib\
        --with-domserver_etcdir=/etc/domserver\
        --with-domserver_webappdir=$domserver_var/webapp\
        --with-domserver_sqldir=$domserver_var/sql\
        --with-domserver_libdir=$domserver_lib\
        --with-domserver_libvendordir=$domserver_lib/vendor\
        --with-domserver_libsubmitdir=$domserver_lib/submit\
        --with-domserver_rundir=$domserver_var/run\
        --with-domserver_logdir=/var/log/domserver\
        --with-domserver_submitdir=$domserver_var/submissions\
        --with-judgehost_etcdir=/etc/judgehost\
        --with-judgehost_libdir=$judgehost_lib\
        --with-judgehost_libvendordir=$judgehost_lib/vendor\
        --with-judgehost_libjudgedir=$judgehost_lib/judge\
        --with-judgehost_logdir=/var/log/judgehost\
        --with-judgehost_rundir=$judgehost_var/run\
        --with-judgehost_judgedir=$judgehost_var/judgings\
        --with-domjudge-user=512 --with-webserver-group=http\
        --with-runuser=domjudge-run --with-rungroup=domjudge-run
    make all
}

package_domjudge-submit() {
    arch=("$CARCH")
    depends=('curl' 'jsoncpp' 'file')
    install -Dm 755 "$srcdir/domjudge-$pkgver/submit/submit" "$pkgdir/usr/bin/submit"
}

package_domjudge-domserver() {
    arch=('any')
    depends=('curl' 'php' 'php-gd' 'php-intl' 'unzip' 'zip' 'apache')
    backup=('etc/domserver/apache.conf' 'etc/domserver/common-config.php' 'etc/domserver/dbpasswords.secret' 'etc/domserver/domjudge-fpm.conf' 'etc/domserver/domserver-config.php' 'etc/domserver/domserver-static.php' 'etc/domserver/import-forwardfeed.yaml' 'etc/domserver/initial_admin_password.secret' 'etc/domserver/nginx-conf' 'etc/domserver/nginx-conf-inner' 'etc/domserver/restapi.secret' 'etc/domserver/verdicts.php' 'var/lib/domserver/webapp/app/config/parameters.yml')
    install=domjudge-domserver.install
    cd "$srcdir/domjudge-$pkgver"
    make install-domserver DESTDIR="$pkgdir"/
    # clear the password, we will run genadminpassword, genrestapicredentials, gendbpasswords when post_install
    echo "" > "$pkgdir/etc/domserver/initial_admin_password.secret"
    echo "" > "$pkgdir/etc/domserver/restapi.secret"
    echo "" > "$pkgdir/etc/domserver/dbpasswords.secret"
    # install the password generating util for the php config
    install -Dm 755 "$srcdir/domjudge-$pkgver/etc/gensymfonyparams" "$pkgdir/etc/domserver/gensymfonyparams"
    install -Dm 644 "$srcdir/domjudge-domserver.conf" "$pkgdir/usr/lib/sysusers.d/domjudge-domserver.conf"
}

package_domjudge-docs() {
    arch=('any')
    depends=('php')
    cd "$srcdir/domjudge-$pkgver"
    make install-docs DESTDIR="$pkgdir"/
}

package_domjudge-judgehost() {
    arch=("$CARCH")
    depends=('libcgroup' 'curl' 'php' 'unzip' 'zip' 'lsof')
    backup=('etc/judgehost/common-config.php' 'etc/judgehost/judgehost-config.php' 'etc/judgehost/judgehost-static.php' 'etc/judgehost/restapi.secret' 'etc/judgehost/sudoers-domjudge' 'etc/judgehost/verdicts.php' 'usr/lib/judgehost/judge/chroot-startstop.sh')
    install=domjudge-judgehost.install
    cd "$srcdir/domjudge-$pkgver"
    make install-judgehost DESTDIR="$pkgdir"/
    # clear the password, we will run genrestapicredentials when post_install
    echo "" > "$pkgdir/etc/judgehost/restapi.secret"
    install -Dm 755 "$srcdir/domjudge-$pkgver/etc/genrestapicredentials" "$pkgdir/etc/judgehost/genrestapicredentials"
    install -Dm 644 "$srcdir/domjudge-judgehostd.service" "$pkgdir/usr/lib/systemd/system/domjudge-judgehostd.service"
    install -Dm 644 "$srcdir/domjudge-judgehostd@.service" "$pkgdir/usr/lib/systemd/system/domjudge-judgehostd@.service"
    install -Dm 644 "$srcdir/domjudge-cgroup.service" "$pkgdir/usr/lib/systemd/system/domjudge-cgroup.service"
    install -Dm 644 "$srcdir/domjudge-judgehost.conf" "$pkgdir/usr/lib/sysusers.d/domjudge-judgehost.conf"
    sed -i 's/512/domjudge/g' "$pkgdir/etc/judgehost/sudoers-domjudge"
    mkdir -p "$pkgdir/etc/sudoers.d"
    chmod 750 "$pkgdir/etc/sudoers.d"
    ln -s "/etc/judgehost/sudoers-domjudge" "$pkgdir/etc/sudoers.d/domjudge"
}
