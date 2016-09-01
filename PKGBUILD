# $Id: PKGBUILD 135424 2015-06-15 15:29:00Z spupykin $
# Maintainer: Guillaume Horel <thrasibule@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Jeff 'codemac' Mickey <jeff@archlinux.org>
# Contributor: Alexander Rødseth <rodseth@gmail.com>

#
# cd deps ; ls -1 | while read g; do (test -d $g && cd $g && sh ../t.sh); done >qwe
#
# U=`grep 'url =' .git/config | cut -f2 -d= | tr -d ' '`
# C=`git rev-parse HEAD`
# N=`basename $(pwd)`
# echo -e "\t\"$N::$U#commit=$C\""
#

pkgname=ejabberd-git
pkgver=16.08.5.gb62aa3d
pkgrel=1
pkgdesc="Jabber server written in Erlang"
arch=('x86_64' 'i686')
url="http://www.ejabberd.im/"
license=("GPL")
depends=('expat' 'elixir' 'openssl' 'zlib' 'erlang-nox' 'pam' 'iproute2' 'erlang-unixodbc'
	 'libyaml' 'sqlite')
makedepends=('git' 'rebar')
provides=('ejabberd')
conflicts=('ejabberd')
backup=('etc/ejabberd/ejabberd.yml'
	'etc/ejabberd/ejabberdctl.cfg'
	'etc/logrotate.d/ejabberd')
install=${pkgname%%-git}.install
options=(emptydirs)
source=("${pkgname}::git+https://github.com/processone/ejabberd#branch=master"
	"cache_tab::git+https://github.com/processone/cache_tab"
	"eredis::git+https://github.com/wooga/eredis"
	"esip::git+https://github.com/processone/esip"
	"ezlib::git+https://github.com/processone/ezlib"
	"fast_tls::git+https://github.com/processone/fast_tls"
	"fast_xml::git+https://github.com/processone/fast_xml"
	"fast_yaml::git+https://github.com/processone/fast_yaml"
	"goldrush::git+https://github.com/DeadZen/goldrush.git"
	"hamcrest::git+https://github.com/basho/hamcrest-erlang"
	"iconv::git+https://github.com/processone/iconv"
	"jiffy::git+https://github.com/davisp/jiffy"
	"lager::git+https://github.com/basho/lager"
	"luerl::git+https://github.com/rvirding/luerl"
	"meck::git+https://github.com/eproxus/meck"
	"moka::git+https://github.com/processone/moka.git"
	"p1_mysql::git+https://github.com/processone/p1_mysql"
	"p1_oauth2::git+https://github.com/processone/p1_oauth2"
	"p1_pam::git+https://github.com/processone/epam"
	"p1_pgsql::git+https://github.com/processone/p1_pgsql"
	"p1_utils::git+https://github.com/processone/p1_utils"
	"p1_xmlrpc::git+https://github.com/processone/p1_xmlrpc"
	"protobuffs::git+https://github.com/basho/erlang_protobuffs"
	"rebar_elixir_plugin::git+https://github.com/processone/rebar_elixir_plugin"
	"riakc::git+https://github.com/basho/riak-erlang-client"
	"riak_pb::git+https://github.com/basho/riak_pb"
	"samerlib::git+https://github.com/processone/samerlib"
	"sqlite3::git+https://github.com/processone/erlang-sqlite3"
	"stringprep::git+https://github.com/processone/stringprep"
	"stun::git+https://github.com/processone/stun"
	"${pkgname%%-git}.logrotate"
	"ejabberd.service"
	"sysuser.conf"
	"rebar.config.patch")
md5sums=('SKIP'
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
         'f97c8a96160f30e0aecc9526c12e6606'
         '2253e277a6b3fae5124219c0aafa1089'
         'be2fa3c15c92a9c2b9b6b7a3957d5c3a'
         '7cb3e95debcdac90b3ebcec950835706')

pkgver() {
  cd "${srcdir}/${pkgname}"
  #printf "%s" "$(git describe --long --tags | sed 's/v//; s/-/./g')"
  git describe --long --tags | sed 's/^v//; s/-/./g'
}

prepare() {
  cd "$srcdir/${pkgname}"

  mkdir -p "$srcdir/${pkgname}/deps"
  for i in eredis esip goldrush jiffy lager meck p1_oauth2 cache_tab \
	iconv ezlib fast_tls fast_xml fast_yaml hamcrest luerl moka p1_mysql \
	p1_pam p1_pgsql p1_utils p1_xmlrpc protobuffs rebar_elixir_plugin \
	riakc riak_pb sqlite3 samerlib stringprep stun; do
    rm -rf "$srcdir/${pkgname}/deps/$i"
    mv $srcdir/$i "$srcdir/${pkgname}/deps"
  done
  rm -rf "$srcdir/${pkgname}/deps/elixir"
  patch -p1 < ../rebar.config.patch
  #sed -i "s|git describe --tags 2>/dev/null|echo $pkgver|" configure.ac
}

build() {
  [ -h "$srcdir/${pkgname%%-git}-$pkgver" ] || ln -s "$srcdir/${pkgname}" "$srcdir/${pkgname%%-git}-$pkgver"
  cd "$srcdir/${pkgname%%-git}-$pkgver"
  [ -x configure ] || ./autogen.sh
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --sbindir=/usr/bin \
    --localstatedir=/var \
    --enable-all
  make
}

package() {
  cd "$srcdir/${pkgname%%-git}-$pkgver"
  make DESTDIR="$pkgdir" install

  install -Dm04750 deps/p1_pam/priv/bin/epam "$pkgdir/usr/lib/${pkgname%%-git}-${pkgver%.*}/priv/bin/epam"
  install -D -m0644 "$srcdir/${pkgname%%-git}.logrotate" "$pkgdir/etc/logrotate.d/${pkgname%%-git}"
  chmod ug+r "$pkgdir/etc/${pkgname%%-git}/"*
  chmod a+rx "$pkgdir/usr/bin/ejabberdctl" \
    "$pkgdir/usr/lib/${pkgname%%-git}-${pkgver%.*}/priv/bin/captcha.sh"
  rm -rf "$pkgdir/var/lock"
  install -Dm0644 $srcdir/ejabberd.service $pkgdir/usr/lib/systemd/system/ejabberd.service
  install -Dm644 $srcdir/sysuser.conf "$pkgdir"/usr/lib/sysusers.d/ejabberd.conf
  install -Dm0644 $srcdir/$pkgname/tools/ejabberdctl.bc "${pkgdir}/$(pkg-config --variable=completionsdir bash-completion)/ejabberdctl"

  # workaround
  rm -f $pkgdir/usr/bin/{elixir,iex,mix}

  # permissions
  chown -R 17:17 $pkgdir/var/{lib,log}/ejabberd
  chown root:17 \
    $pkgdir/etc/ejabberd/ejabberd.yml \
    $pkgdir/etc/ejabberd/ejabberdctl.cfg \
    $pkgdir/etc/ejabberd \
    $pkgdir/usr/lib/ejabberd-${pkgver%.*}/priv/bin/epam
}

# vim:set ts=2 sw=2 et:
