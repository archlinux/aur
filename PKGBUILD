# $Id: PKGBUILD 135424 2015-06-15 15:29:00Z spupykin $
# Maintainer: Ido Rosen <ido@kernel.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Jeff 'codemac' Mickey <jeff@archlinux.org>
# Contributor: Alexander Rødseth <rodseth@gmail.com>

pkgname=ejabberd-git
pkgver=15.04
pkgrel=1
pkgdesc="Jabber server written in Erlang"
arch=('x86_64' 'i686')
url="http://www.ejabberd.im/"
license=("GPL")
depends=('expat' 'openssl' 'zlib' 'erlang-nox' 'pam' 'iproute2' 'erlang-unixodbc'
	 'libyaml' 'sqlite')
makedepends=('git' 'rebar' 'hevea' 'texlive-bin' 'texlive-core' 'texlive-latexextra')
backup=('etc/ejabberd/ejabberd.yml'
	'etc/ejabberd/ejabberdctl.cfg'
	'etc/logrotate.d/ejabberd')
install=${pkgname%%-git}.install
replaces=('ejabberd-mod_mysql' 'ejabberd-mod_mysql-svn'
	  'ejabberd-mod_pgsql' 'ejabberd-mod_pgsql-svn')
source=("${pkgname%%-git}-$pkgver::git+https://github.com/processone/ejabberd"
	"p1_cache_tab::git+https://github.com/processone/cache_tab"
	"p1_tls::git+https://github.com/processone/tls"
	"p1_stringprep::git+https://github.com/processone/stringprep"
	"p1_xml::git+https://github.com/processone/xml"
	"p1_yaml::git+https://github.com/processone/p1_yaml"
	"git+https://github.com/rds13/xmlrpc"
	"p1_pam::git+https://github.com/processone/epam"
	"p1_zlib::git+https://github.com/processone/zlib"
	"git+https://github.com/basho/lager"
	"p1_iconv::git+https://github.com/processone/eiconv"
	"git+https://github.com/DeadZen/goldrush.git"
	"p1_mysql::git+https://github.com/processone/mysql.git"
	"p1_pgsql::git+https://github.com/processone/pgsql.git"
	"p1_stun::git+https://github.com/processone/stun"
	"git+https://github.com/davisp/jiffy"
	"git+https://github.com/cmullaparthi/ibrowse"
	"git+https://github.com/esl/lhttpc"
	"git+https://github.com/eproxus/meck"
	"esip::git+https://github.com/processone/p1_sip"
	"git+https://github.com/basho/riak_pb"
	"riakc::git+https://github.com/basho/riak-erlang-client"
	"protobuffs::git+https://github.com/basho/erlang_protobuffs.git#tag=0.8"
	"git+https://github.com/processone/p1_utils"
	"ehyperloglog::git+https://github.com/vaxelfel/eHyperLogLog.git"
	"rebar_elixir_plugin::git+https://github.com/yrashk/rebar_elixir_plugin"
	"elixir::git+https://github.com/elixir-lang/elixir#branch=v1.0"
	"git+https://github.com/wooga/eredis"
	"sqlite3::git+https://github.com/alexeyr/erlang-sqlite3"
	"${pkgname%%-git}.logrotate"
	"ejabberd.service"
	"sysuser.conf")
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
         'f97c8a96160f30e0aecc9526c12e6606'
         'a437aff9d7d477fb036d527205617e18'
         '458fc41be4adb9554a53b8f9ae05fbee')

pkgver() {
  cd "${srcdir}/${pkgname%%-git}"
  #printf "%s" "$(git describe --long --tags | sed 's/v//; s/-/./g')"
  git describe --long --tags | sed 's/^v//; s/-/./g'
}

prepare() {
  cd "$srcdir/${pkgname%%-git}-$pkgver"

  mkdir -p "$srcdir/${pkgname%%-git}-$pkgver/deps"
  for i in goldrush lager p1_cache_tab p1_iconv p1_pam \
           p1_stringprep p1_tls p1_xml p1_yaml p1_zlib xmlrpc \
           p1_mysql p1_pgsql p1_stun jiffy ibrowse lhttpc \
           meck esip riak_pb riakc p1_utils protobuffs \
           ehyperloglog rebar_elixir_plugin elixir eredis \
           sqlite3; do
    rm -rf "$srcdir/${pkgname%%-git}-$pkgver/deps/$i"
    mv $srcdir/$i "$srcdir/${pkgname%%-git}-$pkgver/deps"
  done

  pushd deps/lhttpc/src/
  mv lhttpc.app.src lhttpc.app.src.bak
  cat lhttpc.app.src.bak | iconv -f utf8 -c >lhttpc.app.src
  popd
}

build() {
  cd "$srcdir/${pkgname%%-git}-$pkgver"
  [ -x configure ] || ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
    --enable-all
  make debug=true
  make -C doc
}

package() {
  cd "$srcdir/${pkgname%%-git}-$pkgver"

  # make install workaround
  rm -f deps/sqlite3/include/sqlite3.hrl

  make DESTDIR="$pkgdir" install

  install -Dm04750 deps/p1_pam/priv/bin/epam $pkgdir/usr/lib/ejabberd/priv/bin/epam
  install -d "$pkgdir/var/lib/${pkgname%%-git}"
  install -D -m0644 "$srcdir/${pkgname%%-git}.logrotate" "$pkgdir/etc/logrotate.d/${pkgname%%-git}"
  chmod ug+r "$pkgdir/etc/${pkgname%%-git}/"*
  mkdir -p $pkgdir/usr/bin
  mv $pkgdir/usr/sbin/ejabberdctl $pkgdir/usr/bin/ejabberdctl
  chmod a+rx "$pkgdir/usr/bin/ejabberdctl" "$pkgdir/usr/lib/ejabberd/priv/bin/captcha.sh"
  rm -rf "$pkgdir/var/lock" "$pkgdir/usr/sbin"
  install -Dm0644 $srcdir/ejabberd.service $pkgdir/usr/lib/systemd/system/ejabberd.service
  install -Dm644 $srcdir/sysuser.conf "$pkgdir"/usr/lib/sysusers.d/ejabberd.conf
  # workaround
  ln -s mod_configure.beam $pkgdir/usr/lib/ejabberd/ebin/configure.beam
  rm -f $pkgdir/usr/bin/{elixir,iex,mix}
}

# vim:set ts=2 sw=2 et:
