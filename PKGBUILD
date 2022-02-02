# Original: Maxime Poulin <maxpoulin64@gmail.com>
# Maintainer: Trevor Bergeron <aur@sec.gd>

# Build options (yes/no/default)
_large_network=default
_pcre=default
_perl=default
_contrib=default
_cracklib=default
_ldap=default

_pkgname=atheme-services
pkgname=atheme
_pkgver="7.2.12"
pkgrel=1
pkgver="${_pkgver//-/_}"
pkgdesc="IRC services"
arch=("i686" "x86_64")
url="https://atheme.org/atheme.html"
license=('custom:ISC')
# qrencode seems to be optional at build time but with no easy way to disable
# it aside from uninstalling qrencode
depends=('qrencode')
conflicts=('libmowgli' 'xtheme' 'atheme-git')
optdepends=(
    'pcre: for pcre support'
    'perl: for Perl support'
    'cracklib: cracklib support in NickServ'
    'libldap: LDAP support'
)
backup=(
    'etc/atheme/atheme.conf'
    'etc/atheme/atheme.motd'
)
install=atheme.install
source=("https://github.com/atheme/atheme/releases/download/v${_pkgver}/${_pkgname}-v${_pkgver}.tar.xz"
        "atheme.service"
)
sha256sums=('600d5ba0e25d80307818021fd9b85e49b07f245932b3c8e04e16fe312dd60fba'
            'ee9ad7658434451184872c21c7fd38196d22d1dfb6b1f37bcfaf8c363d50296f')

build() {
    cd "$srcdir/$_pkgname-v$_pkgver"

    _configure="./configure --prefix=/usr --enable-fhs-paths"
    _configure+=" --sysconfdir=/etc/atheme --localstatedir=/var"

    # By default, if you have libmowgli-2.so, it doesn't bother to build it.
    # So it finds the version installed by atheme, doesn't build it, then when
    # you install the new build, it's gone and atheme doesn't start.
    # It's then absent from the system for the next build, so it's included.
    # I can never get my saturday morning back.
    _configure+=" --with-libmowgli=no"

    [[ $_large_network = yes ]] && _configure+=" --enable-large-net"
    [[ $_contrib = yes ]]       && _configure+=" --enable-contrib"

    [[ $_pcre = yes ]] && _configure+=" --with-pcre"
    [[ $_pcre = no ]]  && _configure+=" --without-pcre"

    eval $_configure
    make
}

package() {
    cd "$srcdir/$_pkgname-v$_pkgver"

    make DESTDIR="$pkgdir/" install
    install -Dm0644 "$srcdir/atheme.service" "$pkgdir/usr/lib/systemd/system/atheme.service"

    cd "$pkgdir"
    rm -r var
    install -dm755 -o142 -g142 var/lib/atheme/

    install -d usr/share/licenses/atheme/
    mv usr/share/doc/atheme/LICENSE usr/share/licenses/atheme/LICENSE

    chmod 0755 etc/atheme/
    chmod 0644 etc/atheme/*
    install -dm755 usr/share/doc/atheme/config/
    mv etc/atheme/atheme.conf.example etc/atheme/atheme.conf
    mv etc/atheme/atheme.conf.operserv-example usr/share/doc/atheme/config/
    mv etc/atheme/atheme.conf.userserv-example usr/share/doc/atheme/config/
    mv etc/atheme/atheme.motd.example etc/atheme/atheme.motd
    rm etc/atheme/atheme.cron.example
}
