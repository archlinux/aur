# Maintainer: Hikari <xec[at]domain:tuta.io>
# Complete rewrite and hardening.
# Parts taken and adapted from official PKGBUILD by:
# Sergej Pupykin, Jeff 'codemac' Mickey, and Alexander Rødseth

pkgname=ejabberd-git
pkgver=26.01.r2.gf417b9f7c
pkgrel=1
pkgdesc="Jabber server written in Erlang - git version"
arch=('x86_64')
url="https://www.ejabberd.im/"
license=("GPL-2.0-or-later")

depends=(
    'elixir' 'erlang' 'expat' 'gd' 'iproute2' 'libressl' 'libyaml' 'pam' 'sqlite' 'zlib'
    'erlang-core' 'erlang-mnesia' 'erlang-os_mon' 'erlang-odbc' 'erlang-syntax_tools' 'erlang-xmerl'
    )

makedepends=(
    'gcc' 'make' 'git' 'rebar3' 'hevea' 'texlive-bin' 'texlive-basic' 'texlive-latexextra'
    'erlang-compiler' 'erlang-asn1' 'erlang-public_key' 'erlang-ssl' 'erlang-parsetools'
    'erlang-erl_interface' 'erlang-eunit' 'erlang-eldap'
    )

optdepends=(
    'gsfonts: for captcha'
    'imagemagick: for captcha'
    'openssl: for extended SSL compatibility'
    )

provides=('ejabberd')
conflicts=('ejabberd')

backup=(
    'etc/ejabberd/ejabberd.yml'
    'etc/ejabberd/ejabberdctl.cfg'
    'etc/ejabberd/inetrc'
    )

options=(emptydirs)

source=(
    "git+https://github.com/processone/ejabberd.git"
    "base64url::git+https://github.com/dvv/base64url"
    "cache_tab::git+https://github.com/processone/cache_tab"
    "eimp::git+https://github.com/processone/eimp"
    "ejabberd-po::git+https://github.com/processone/ejabberd-po"
    "eredis2::git+https://github.com/wooga/eredis/"
    "eredis::git+https://github.com/Nordix/eredis/"
    "erlang-idna::git+https://github.com/benoitc/erlang-idna"
    "erlang-jose::git+https://github.com/potatosalad/erlang-jose"
    "erlang-sqlite3::git+https://github.com/processone/erlang-sqlite3"
    "esip::git+https://github.com/processone/esip"
    "ezlib::git+https://github.com/processone/ezlib"
    "fast_tls::git+https://github.com/processone/fast_tls"
    "fast_xml::git+https://github.com/processone/fast_xml"
    "fast_yaml::git+https://github.com/processone/fast_yaml"
    "jiffy::git+https://github.com/davisp/jiffy"
    "lager::git+https://github.com/erlang-lager/lager"
    "luerl::git+https://github.com/rvirding/luerl"
    "mqtree::git+https://github.com/processone/mqtree"
    "p1_acme::git+https://github.com/processone/p1_acme"
    "p1_mysql::git+https://github.com/processone/p1_mysql"
    "p1_oauth2::git+https://github.com/processone/p1_oauth2"
    "p1_pgsql::git+https://github.com/processone/p1_pgsql"
    "p1_utils::git+https://github.com/processone/p1_utils"
    "pkix::git+https://github.com/processone/pkix"
    "stringprep::git+https://github.com/processone/stringprep"
    "stun::git+https://github.com/processone/stun"
    "xmpp::git+https://github.com/processone/xmpp"
    "yconf::git+https://github.com/processone/yconf"
    #"epam::git+https://github.com/processone/epam"
    "ejabberd.logrotate"
    "ejabberd.patch"
    "ejabberd.service"
    "ejabberd.sysusers"
    )

b2sums=(
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    #'SKIP'
    '8b1e326694e02421351e95312f46b392ff2c57502b22623db9b61881a61274801f029a62db15019f4a4d309080432d0a990d056c7390d5a0b684ad629c293da2'
    '6e6f75d367a6e2860486e06ab53de0053f9897941675677bde80c13a474d8759d5cbd40242916a59bbc93ade5327cea57e96c1322b672b01f41504e3bdaa09a6'
    '9fd170438c7384299bdf4a6cad4ab00b8a4bdf63ddeabbc48e6f6f0f03837cdac112cd81ea5091f5383e9089eab68dc61c22c700377dd8d84ae21de4b20cb71f'
    '90d4fe71cecdb2bce52008958f3df05968ed1a7c7ce5df627761a85e546992bc3cd8c446ad230e0dfee41790c45c31a64f4e1f959edde2175997a2aebb01f028'
    )

pkgver() {
    cd ejabberd
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd ejabberd
    patch -p1 <../ejabberd.patch

    mkdir -p $srcdir/deps
    # add epam for PAM authentication
    for d in \
	base64url cache_tab eimp ejabberd-po eredis esip ezlib fast_tls fast_xml fast_yaml erlang-idna jiffy erlang-jose luerl mqtree p1_acme \
	p1_mysql p1_oauth2 p1_pgsql p1_utils pkix stringprep stun xmpp yconf
    do
	rm -rf "$srcdir/ejabberd/deps/$d"
	mv "$srcdir"/$d "$srcdir/ejabberd/deps"
    done

    export MIX_HOME="$srcdir/mix"
    export HEX_HOME="$srcdir/hex"
    mix local.hex --force
    mix local.rebar --force
    mix deps.get --only prod
}

build() {
  cd ejabberd
  [ -x configure ] || ./autogen.sh
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --sbindir=/usr/bin \
    --enable-all \
    --enable-user=jabber
    make
}

package() {
    cd ejabberd
    find "$pkgdir" -name "*.lock" -type f -delete
    make DESTDIR="$pkgdir" install
    install -Dm0644 "$srcdir/ejabberd.service" "$pkgdir/usr/lib/systemd/system/ejabberd.service"
    install -Dm0644 "$srcdir/ejabberd.sysusers" "$pkgdir/usr/lib/sysusers.d/ejabberd.conf"
    install -Dm0644 "$srcdir/ejabberd.logrotate" "$pkgdir/etc/logrotate.d/ejabberd"
    install -Dm0644 tools/ejabberdctl.bc $pkgdir"/usr/share/bash-completion/completions/ejabberdctl"
    install -dm0750 "$pkgdir/var/lib/ejabberd"
    install -dm0750 "$pkgdir/var/log/ejabberd"
    #install -Dm04750 epam/priv/bin/epam $pkgdir"/usr/lib/ejabberd-$pkgver/priv/bin/epam"

    cat <<EOF >>"$pkgdir/etc/ejabberd/ejabberdctl.cfg"
# home dir workaround
HOME=/var/lib/ejabberd
EOF

    chmod 440 $pkgdir"/etc/ejabberd/"*
    chmod 555 $pkgdir"/usr/bin/ejabberdctl"
    find "$pkgdir/usr/lib" -name "captcha.sh" -path "*/priv/bin/*" -exec chmod +x {} +
    chown -R 17:17 "$pkgdir"/var/{lib,log}/ejabberd
    chmod 111 "$pkgdir"/usr/lib/eimp-*/priv/bin/eimp
    chown root:17 \
    $pkgdir"/etc/ejabberd/ejabberd.yml" \
    $pkgdir"/etc/ejabberd/ejabberdctl.cfg" \
    $pkgdir"/etc/ejabberd"
}
