# Maintainer: Amish <contact at via dot aur>

pkgname=usermin
pkgver=1.701
pkgrel=1
pkgdesc="A web-based interface for users"
arch=(i686 x86_64)
license=('custom:webmin')
url="http://www.webmin.com/"
depends=('perl' 'perl-net-ssleay' 'perl-authen-pam')
optdepends=('webmin: A web-based interface for system administration')
backup=('etc/usermin/miniserv.conf' 'etc/usermin/miniserv.users' \
'etc/usermin/config' 'etc/usermin/webmin.acl' 'etc/usermin/user.acl' \
'etc/usermin/at/config' \
'etc/usermin/changepass/config' \
'etc/usermin/chfn/config' \
'etc/usermin/commands/config' \
'etc/usermin/cron/config' \
'etc/usermin/cshrc/config' \
'etc/usermin/fetchmail/config' \
'etc/usermin/file/config' \
'etc/usermin/filemin/config' \
'etc/usermin/filter/config' \
'etc/usermin/forward/config' \
'etc/usermin/gnupg/config' \
'etc/usermin/htaccess/config' \
'etc/usermin/htaccess-htpasswd/config' \
'etc/usermin/language/config' \
'etc/usermin/mailbox/config' \
'etc/usermin/mailcap/config' \
'etc/usermin/man/config' \
'etc/usermin/mysql/config' \
'etc/usermin/plan/config' \
'etc/usermin/postgresql/config' \
'etc/usermin/proc/config' \
'etc/usermin/procmail/config' \
'etc/usermin/quota/config' \
'etc/usermin/schedule/config' \
'etc/usermin/shell/config' \
'etc/usermin/spam/config' \
'etc/usermin/ssh/config' \
'etc/usermin/telnet/config' \
'etc/usermin/theme/config' \
'etc/usermin/tunnel/config' \
'etc/usermin/updown/config' \
'etc/usermin/usermount/config' \
'etc/pam.d/usermin' )
source=(http://downloads.sourceforge.net/sourceforge/webadmin/$pkgname-$pkgver.tar.gz
        setup-pre.sh
        setup-post.sh
        usermin-config.tar.bz2
        usermin.pam
        usermin.service)
options=(!strip !zipman)

prepare() {
    cd "$srcdir"/$pkgname-$pkgver

    # remove modules that we do not support and stuff that is not needed
    rm -r caldera usermin-init usermin-daemon install-module.pl

    # remove config files for other distros, make Arch linux related additions
    find . ! -name 'config-generic-linux' ! -name 'config-\*-linux' ! -name 'config-lib.pl' -name 'config-*' -exec rm '{}' \+
    echo 'Archlinux	Any version	generic-linux	*	-d "/etc/pacman.d"' > os_list.txt
    cp -rp "$srcdir"/usermin-config/* "$srcdir"/$pkgname-$pkgver/

    # fix setup.sh
    sed -i -e 's:exit 13::g' "$srcdir"/$pkgname-$pkgver/setup.sh
}

package() {
    # create basic directories
    mkdir -p "$pkgdir"/{etc,opt,var/log}

    config_dir="$pkgdir"/etc/usermin
    var_dir="$pkgdir"/var/log/usermin
    perl=/usr/bin/perl
    autoos=1
    port=20000
    ssl=1
    atboot=0
    nostart=1
    nochown=1
    autothird=1
    nouninstall=1
    atbootyn=n
    tempdir="$pkgdir"/tmp
    pam=usermin
    export config_dir var_dir perl autoos port ssl atboot nostart nochown autothird nouninstall atbootyn tempdir pam
    cd "$srcdir"/$pkgname-$pkgver
    "$srcdir"/$pkgname-$pkgver/setup.sh "$pkgdir"/opt/usermin

    # more logging, other config changes and use pam
    sed -i -e 's:^theme=.*$:theme=authentic-theme:' "$pkgdir"/etc/usermin/config
    echo -e 'logfiles=1\nlogfullfiles=1\ngotoone=1\nnoremember=1\nshowlogin=1' >> "$pkgdir"/etc/usermin/config
    sed -i -e 's:^pidfile=.*$:pidfile=/run/usermin.pid:' -e 's:^preroot=.*$:preroot=authentic-theme:' "$pkgdir"/etc/usermin/miniserv.conf
    echo -e 'syslog=1\npam_only=1\npam_end=1\npam_conv=\nno_pam=0\nlogouttime=10\nuser_mapping_reverse=1' >> "$pkgdir"/etc/usermin/miniserv.conf

    # fix the config files to use their real locations
    find "$pkgdir"/etc/usermin -type f -exec sed -i -e "s:$pkgdir::g" {} \+

    # install sources
    install -D -m 644 "$srcdir"/usermin.service "$pkgdir"/usr/lib/systemd/system/usermin.service
    install -D -m 644 "$srcdir"/usermin.pam "$pkgdir"/etc/pam.d/usermin
    install -D -m 644 "$srcdir"/$pkgname-$pkgver/LICENCE "$pkgdir"/usr/share/licenses/usermin/LICENCE
    mv "$pkgdir"/opt/usermin/user.acl "$pkgdir"/etc/usermin/

    # delete temp dir
    rm -r "$pkgdir"/tmp
}


sha256sums=('93a1be3cee975dd3d4e64d27b09cf252750949eaad7b62f5d5bb88d4edb2da28'
            '366e0315307c89bb0ec10d76c22352de93b92ca556f7f7bb6e34eb1b17d26a9c'
            '17102b3583190f64fae039ca5270ae823cae90ed60fdb2dd49aba95496bff559'
            'a05c4d471977282736ac89f4d4d379a91b70678348b1a1b91ce23ebff3c8bfce'
            'a979e236681c6a06906937cf0f012e976347af5d6d7e7ae04a11acb01cc2689d'
            'ade1b28a8f65512c8878ecabf6c8bc5a2d8ce3fd88dc3bffc1a9e14f3fd1ec47')
