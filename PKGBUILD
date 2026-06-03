# Maintainer: buj <buj351@outlook.com>
pkgbase=erlang-28
pkgname=(
  erlang-28
  erlang-28-headless
  erlang-28-core
  erlang-28-asn1
  erlang-28-common_test
  erlang-28-debugger
  erlang-28-dialyzer
  erlang-28-diameter
  erlang-28-edoc
  erlang-28-eldap
  erlang-28-erl_interface
  erlang-28-et
  erlang-28-eunit
  erlang-28-ftp
  erlang-28-inets
  erlang-28-jinterface
  erlang-28-megaco
  erlang-28-mnesia
  erlang-28-observer
  erlang-28-odbc
  erlang-28-os_mon
  erlang-28-parsetools
  erlang-28-public_key
  erlang-28-reltool
  erlang-28-runtime_tools
  erlang-28-sasl
  erlang-28-snmp
  erlang-28-ssh
  erlang-28-ssl
  erlang-28-syntax_tools
  erlang-28-tftp
  erlang-28-tools
  erlang-28-wx
  erlang-28-xmerl
)
pkgver=28.5.0.1
pkgrel=1
pkgdesc='General-purpose concurrent functional programming language developed by Ericsson (version 28)'
arch=(x86_64)
url='https://erlang.org/'
license=(Apache-2.0)
makedepends=(
  git
  glib2
  glibc
  glu
  java-environment
  libglvnd
  libxslt
  lksctp-tools
  mesa
  ncurses
  openssl
  perl
  unixodbc
  webkit2gtk-4.1
  wxwidgets-common
  wxwidgets-gtk3
  zlib
)
options=(staticlibs)
source=(
  "git+https://github.com/erlang/otp#tag=OTP-$pkgver"
  epmd.conf
  epmd.service
  epmd.socket
)
b2sums=('SKIP'
        '1675ac9bf948ab19e8b63077d870ccf356fcdbce14de2777f00b3488aa1ce34a5e0a5cdc0428707f744dee5940b12653a44e0ded0554de95ebb31bce4676ff87'
        '1f765318bcd322ce697a48c064ccdb1bd107b4a84e164a87f62678391cb82a9ab17a397d679cf266e037a5a2d91772b85f7a97f9cc5478c0f18118743b30045f'
        'c37706f5f6e2d49100104fb442ebf15edd6ee0a1e8038d0364794cf34fd3f02a61b9ad2706228b3327b85b0cadcd11aac6087e7c98408eae2d307a09191b6553')

prepare() {
  cd otp
  sed -i 's/^LDFLAGS = /LDFLAGS += /g' \
    lib/megaco/src/flex/Makefile.in \
    lib/odbc/c_src/Makefile.in
  # Let the Java bindings support version 11 or later, ref:
  # https://gitlab.archlinux.org/archlinux/packaging/packages/erlang/-/issues/1
  sed -i 's/^JAVA_OPTIONS =/JAVA_OPTIONS = --release 11/g' \
    lib/jinterface/java_src/com/ericsson/otp/erlang/Makefile
}

build() {
  cd otp
  export CFLAGS+=' -ffat-lto-objects'
  ./configure \
    --enable-threads \
    --enable-shared-zlib \
    --enable-ssl=dynamic-ssl-lib \
    --with-ssl-rpath=/usr/lib \
    --prefix=/usr

  make all
  make DOC_TARGETS="chunks man" docs
}

_pick() {
  local dest="$1"
  shift
  for obj in "$@"; do
    mkdir -p "$dest/$(dirname "$obj")/"
    mv -v -t "$dest/$(dirname "$obj")/" "$obj"
  done
}

package_erlang-28() {
  depends=(
    erlang-28-asn1
    erlang-28-common_test
    erlang-28-core
    erlang-28-debugger
    erlang-28-dialyzer
    erlang-28-diameter
    erlang-28-edoc
    erlang-28-eldap
    erlang-28-erl_interface
    erlang-28-et
    erlang-28-eunit
    erlang-28-ftp
    erlang-28-inets
    erlang-28-jinterface
    erlang-28-megaco
    erlang-28-mnesia
    erlang-28-observer
    erlang-28-odbc
    erlang-28-os_mon
    erlang-28-parsetools
    erlang-28-public_key
    erlang-28-reltool
    erlang-28-runtime_tools
    erlang-28-sasl
    erlang-28-snmp
    erlang-28-ssh
    erlang-28-ssl
    erlang-28-syntax_tools
    erlang-28-tftp
    erlang-28-tools
    erlang-28-wx
    erlang-28-xmerl
  )
  conflicts=(erlang)
  provides=(erlang)
}

package_erlang-28-headless() {
  pkgdesc+=' (headless, replaces erlang-nox)'
  depends=(
    erlang-28-asn1
    erlang-28-common_test
    erlang-28-core
    erlang-28-dialyzer
    erlang-28-diameter
    erlang-28-edoc
    erlang-28-eldap
    erlang-28-erl_interface
    erlang-28-eunit
    erlang-28-ftp
    erlang-28-inets
    erlang-28-mnesia
    erlang-28-odbc
    erlang-28-os_mon
    erlang-28-parsetools
    erlang-28-public_key
    erlang-28-runtime_tools
    erlang-28-sasl
    erlang-28-snmp
    erlang-28-ssh
    erlang-28-ssl
    erlang-28-syntax_tools
    erlang-28-tftp
    erlang-28-tools
    erlang-28-xmerl
  )
  conflicts=(erlang-headless)
  provides=(erlang-headless)
  optdepends=('erlang-jinterface: for Java interop support')
}

package_erlang-28-core() {
  pkgdesc='Erlang core components (compiler, crypto, erts, kernel, stdlib)'
  depends=(
    glibc
    libgcc
    libstdc++
    lksctp-tools
    ncurses
    openssl
    zlib
  )
  conflicts=(
    erlang-core
    erlang-compiler
    erlang-crypto
    erlang-erts
    erlang-kernel
    erlang-stdlib
  )
  provides=(
    erlang-core
    erlang-compiler
    erlang-crypto
    erlang-erts
    erlang-kernel
    erlang-stdlib
    erlang-28-compiler
    erlang-28-crypto
    erlang-28-erts
    erlang-28-kernel
    erlang-28-stdlib
  )

  install -vDm644 -t "$pkgdir/usr/lib/systemd/system" epmd.service epmd.socket
  install -vDm644 epmd.conf "$pkgdir/etc/conf.d/epmd"

  cd otp
  make DESTDIR="$pkgdir" install install-docs \
    DOC_TARGETS="chunks man" \
    RELSYS_MANDIR="$pkgdir/usr/share/man"
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgbase" \
    AUTHORS CONTRIBUTING.md README.md

  # Remove unwanted files
  rm -v \
    "$pkgdir/usr/lib/erlang/Install" \
    "$pkgdir/usr/share/man/man1/.gitignore" \
    "$pkgdir/usr/lib/erlang/misc/format_man_pages" \
    "$pkgdir/usr/share/man/man1/erlsrv.1" \
    "$pkgdir/usr/share/man/man1/werl.1"

  # Remove man3 pages introduced in 28.3 to avoid conflicts, e.g.:
  # erlang-core: /usr/share/man/man3/zlib.3.gz exists in filesystem (owned by zlib)
  rm -rf "$pkgdir/usr/share/man/man3"

  cd "$pkgdir"
  _pick "$srcdir/erlang-asn1" usr/lib/erlang/lib/asn1-*
  _pick "$srcdir/erlang-common_test" \
    usr/bin/ct_run \
    usr/lib/erlang/bin/ct_run \
    usr/lib/erlang/erts-*/bin/ct_run \
    usr/lib/erlang/lib/common_test-* \
    usr/share/man/man1/ct_run.1
  _pick "$srcdir/erlang-debugger" usr/lib/erlang/lib/debugger-*
  _pick "$srcdir/erlang-diameter" \
    usr/lib/erlang/lib/diameter-* \
    usr/share/man/man1/diameterc.1
  _pick "$srcdir/erlang-dialyzer" \
    usr/bin/dialyzer \
    usr/bin/typer \
    usr/lib/erlang/bin/dialyzer \
    usr/lib/erlang/bin/typer \
    usr/lib/erlang/erts-*/bin/dialyzer \
    usr/lib/erlang/erts-*/bin/typer \
    usr/lib/erlang/lib/dialyzer-* \
    usr/share/man/man1/typer.1
  _pick "$srcdir/erlang-edoc" \
    usr/lib/erlang/lib/edoc-* \
    usr/share/man/man1/edoc.1
  _pick "$srcdir/erlang-eldap" usr/lib/erlang/lib/eldap-*
  _pick "$srcdir/erlang-erl_interface" \
    usr/lib/erlang/lib/erl_interface-* \
    usr/lib/erlang/bin/erl_call \
    usr/lib/erlang/erts-*/bin/erl_call \
    usr/share/man/man1/erl_call.1
  _pick "$srcdir/erlang-et" usr/lib/erlang/lib/et-*
  _pick "$srcdir/erlang-eunit" usr/lib/erlang/lib/eunit-*
  _pick "$srcdir/erlang-ftp" usr/lib/erlang/lib/ftp-*
  _pick "$srcdir/erlang-inets" usr/lib/erlang/lib/inets-*
  _pick "$srcdir/erlang-jinterface" usr/lib/erlang/lib/jinterface-*
  _pick "$srcdir/erlang-megaco" usr/lib/erlang/lib/megaco-*
  _pick "$srcdir/erlang-mnesia" usr/lib/erlang/lib/mnesia-*
  _pick "$srcdir/erlang-observer" \
    usr/lib/erlang/lib/observer-* \
    usr/share/man/man1/cdv.1
  _pick "$srcdir/erlang-odbc" usr/lib/erlang/lib/odbc-*
  _pick "$srcdir/erlang-os_mon" usr/lib/erlang/lib/os_mon-*
  _pick "$srcdir/erlang-parsetools" usr/lib/erlang/lib/parsetools-*
  _pick "$srcdir/erlang-public_key" usr/lib/erlang/lib/public_key-*
  _pick "$srcdir/erlang-reltool" usr/lib/erlang/lib/reltool-*
  _pick "$srcdir/erlang-runtime_tools" usr/lib/erlang/lib/runtime_tools-*
  _pick "$srcdir/erlang-sasl" usr/lib/erlang/lib/sasl-*
  _pick "$srcdir/erlang-snmp" \
    usr/lib/erlang/lib/snmp-* \
    usr/share/man/man1/snmpc.1
  _pick "$srcdir/erlang-ssh" usr/lib/erlang/lib/ssh-*
  _pick "$srcdir/erlang-ssl" usr/lib/erlang/lib/ssl-*
  _pick "$srcdir/erlang-syntax_tools" usr/lib/erlang/lib/syntax_tools-*
  _pick "$srcdir/erlang-tftp" usr/lib/erlang/lib/tftp-*
  _pick "$srcdir/erlang-tools" usr/lib/erlang/lib/tools-*
  _pick "$srcdir/erlang-wx" usr/lib/erlang/lib/wx-*
  _pick "$srcdir/erlang-xmerl" usr/lib/erlang/lib/xmerl-*
}

package_erlang-28-asn1() {
  pkgdesc='Provides support for Abstract Syntax Notation One'
  depends=(
    erlang-core
    glibc
  )
  provides=(erlang-asn1)
  conflicts=(erlang-asn1)
  cp -va -t "$pkgdir" "erlang-asn1/"*
}

package_erlang-28-common_test() {
  pkgdesc='A portable framework for automatic testing'
  depends=(
    erlang-28-core
    erlang-28-inets
    erlang-28-runtime_tools
    erlang-28-sasl
    erlang-28-snmp
    erlang-28-ssh
    erlang-28-syntax_tools
    erlang-28-tools
    erlang-28-xmerl
    glibc
  )
  provides=(erlang-common_test)
  conflicts=(erlang-common_test)
  optdepends=(
    'erlang-debugger: for ct:break/1 interactive debugging'
    'erlang-observer: for observer integration'
  )
  cp -va -t "$pkgdir" "erlang-common_test/"*
}

package_erlang-28-debugger() {
  pkgdesc='A debugger for debugging and testing of Erlang programs'
  depends=(
    erlang-28-core
    erlang-28-wx
  )
  provides=(erlang-debugger)
  conflicts=(erlang-debugger)
  cp -va -t "$pkgdir" "erlang-debugger/"*
}

package_erlang-28-dialyzer() {
  pkgdesc='A DIscrepancy AnaLYZer for ERlang programs'
  depends=(
    erlang-28-core
    erlang-28-syntax_tools
    glibc
  )
  provides=(erlang-dialyzer)
  conflicts=(erlang-dialyzer)
  cp -va -t "$pkgdir" "erlang-dialyzer/"*
}

package_erlang-28-diameter() {
  pkgdesc='Diameter (RFC 3588) library'
  depends=(
    erlang-28-core
    erlang-28-runtime_tools
    erlang-28-ssl
    erlang-28-syntax_tools
    glibc
  )
  provides=(erlang-diameter)
  conflicts=(erlang-diameter)
  cp -va -t "$pkgdir" "erlang-diameter/"*
}

package_erlang-28-edoc() {
  pkgdesc='A utility used to generate documentation out of tags in source files'
  depends=(
    erlang-28-core
    erlang-28-inets
    erlang-28-syntax_tools
    erlang-28-xmerl
  )
  provides=(erlang-edoc)
  conflicts=(erlang-edoc)
  cp -va -t "$pkgdir" "erlang-edoc/"*
}

package_erlang-28-eldap() {
  pkgdesc='Erlang LDAP library'
  depends=(
    erlang-28-asn1
    erlang-28-core
    erlang-28-ssl
  )
  provides=(erlang-eldap)
  conflicts=(erlang-eldap)
  cp -va -t "$pkgdir" "erlang-eldap/"*
}

package_erlang-28-erl_interface() {
  pkgdesc='Low level interface to C'
  depends=(
    erlang-28-core
    glibc
  )
  provides=(erlang-erl_interface)
  conflicts=(erlang-erl_interface)
  cp -va -t "$pkgdir" "erlang-erl_interface/"*
}

package_erlang-28-et() {
  pkgdesc='An event tracer for Erlang programs'
  depends=(
    erlang-28-core
    erlang-28-runtime_tools
    erlang-28-wx
  )
  provides=(erlang-et)
  conflicts=(erlang-et)
  cp -va -t "$pkgdir" "erlang-et/"*
}

package_erlang-28-eunit() {
  pkgdesc='Support for unit testing'
  depends=(erlang-28-core)
  provides=(erlang-eunit)
  conflicts=(erlang-eunit)
  cp -va -t "$pkgdir" "erlang-eunit/"*
}

package_erlang-28-ftp() {
  pkgdesc='FTP client'
  depends=(erlang-28-core)
  provides=(erlang-ftp)
  conflicts=(erlang-ftp)
  cp -va -t "$pkgdir" "erlang-ftp/"*
}

package_erlang-28-inets() {
  pkgdesc='A set of services such as a Web server and a HTTP client etc'
  depends=(
    erlang-28-core
    erlang-28-mnesia
    erlang-28-runtime_tools
    erlang-28-ssl
  )
  provides=(erlang-inets)
  conflicts=(erlang-inets)
  cp -va -t "$pkgdir" "erlang-inets/"*
}

package_erlang-28-jinterface() {
  pkgdesc='A library for accessing Java from Erlang'
  depends=(
    erlang-28-core
    java-runtime
  )
  provides=(erlang-jinterface)
  conflicts=(erlang-jinterface)
  cp -va -t "$pkgdir" "erlang-jinterface/"*
}

package_erlang-28-megaco() {
  pkgdesc='Megaco/H.248 support library'
  depends=(
    erlang-28-asn1
    erlang-28-core
    erlang-28-debugger
    erlang-28-et
    erlang-28-runtime_tools
    glibc
  )
  provides=(erlang-megaco)
  conflicts=(erlang-megaco)
  cp -va -t "$pkgdir" "erlang-megaco/"*
}

package_erlang-28-mnesia() {
  pkgdesc='A heavy duty real-time distributed database'
  depends=(erlang-28-core)
  provides=(erlang-mnesia)
  conflicts=(erlang-mnesia)
  cp -va -t "$pkgdir" "erlang-mnesia/"*
}

package_erlang-28-observer() {
  pkgdesc='A set of tools for tracing and investigation of distributed systems'
  depends=(
    erlang-28-core
    erlang-28-et
    erlang-28-inets
    erlang-28-runtime_tools
    erlang-28-wx
  )
  provides=(erlang-observer)
  conflicts=(erlang-observer)
  cp -va -t "$pkgdir" "erlang-observer/"*
}

package_erlang-28-odbc() {
  pkgdesc='A library for unixODBC support in Erlang'
  depends=(
    erlang-28-core
    glibc
    unixodbc
  )
  provides=(erlang-odbc)
  conflicts=(erlang-odbc)
  cp -va -t "$pkgdir" "erlang-odbc/"*
}

package_erlang-28-os_mon() {
  pkgdesc='A monitor which allows inspection of the underlying operating system'
  depends=(
    erlang-28-core
    erlang-28-mnesia
    erlang-28-sasl
    erlang-28-snmp
    glibc
  )
  provides=(erlang-os_mon)
  conflicts=(erlang-os_mon)
  cp -va -t "$pkgdir" "erlang-os_mon/"*
}

package_erlang-28-parsetools() {
  pkgdesc='A set of parsing and lexical analysis tools'
  depends=(erlang-28-core)
  provides=(erlang-parsetools)
  conflicts=(erlang-parsetools)
  cp -va -t "$pkgdir" "erlang-parsetools/"*
}

package_erlang-28-public_key() {
  pkgdesc='API to public key infrastructure'
  depends=(
    erlang-28-asn1
    erlang-28-core
  )
  provides=(erlang-public_key)
  conflicts=(erlang-public_key)
  cp -va -t "$pkgdir" "erlang-public_key/"*
}

package_erlang-28-reltool() {
  pkgdesc='A release management tool'
  depends=(
    erlang-28-core
    erlang-28-sasl
    erlang-28-tools
    erlang-28-wx
  )
  provides=(erlang-reltool)
  conflicts=(erlang-reltool)
  cp -va -t "$pkgdir" "erlang-reltool/"*
}

package_erlang-28-runtime_tools() {
  pkgdesc='A set of tools to include in a production system'
  depends=(
    erlang-28-core
    erlang-28-mnesia
    glibc
  )
  provides=(erlang-runtime_tools)
  conflicts=(erlang-runtime_tools)
  cp -va -t "$pkgdir" "erlang-runtime_tools/"*
}

package_erlang-28-sasl() {
  pkgdesc='The System Architecture Support Libraries'
  depends=(
    erlang-28-core
    erlang-28-tools
  )
  provides=(erlang-sasl)
  conflicts=(erlang-sasl)
  cp -va -t "$pkgdir" "erlang-sasl/"*
}

package_erlang-28-snmp() {
  pkgdesc='Simple Network Management Protocol (SNMP) support'
  depends=(
    erlang-28-core
    erlang-28-mnesia
    erlang-28-runtime_tools
  )
  provides=(erlang-snmp)
  conflicts=(erlang-snmp)
  cp -va -t "$pkgdir" "erlang-snmp/"*
}

package_erlang-28-ssh() {
  pkgdesc='Secure Shell application with sftp and ssh support'
  depends=(
    erlang-28-core
    erlang-28-public_key
  )
  provides=(erlang-ssh)
  conflicts=(erlang-ssh)
  cp -va -t "$pkgdir" "erlang-ssh/"*
}

package_erlang-28-ssl() {
  pkgdesc='Secure Socket Layer support'
  depends=(
    erlang-28-core
    erlang-28-inets
    erlang-28-public_key
  )
  provides=(erlang-ssl)
  conflicts=(erlang-ssl)
  cp -va -t "$pkgdir" "erlang-ssl/"*
}

package_erlang-28-syntax_tools() {
  pkgdesc='A set of tools for dealing with erlang sources'
  depends=(erlang-28-core)
  provides=(erlang-syntax_tools)
  conflicts=(erlang-syntax_tools)
  cp -va -t "$pkgdir" "erlang-syntax_tools/"*
}

package_erlang-28-tftp() {
  pkgdesc='TFTP client'
  depends=(erlang-28-core)
  provides=(erlang-tftp)
  conflicts=(erlang-tftp)
  cp -va -t "$pkgdir" "erlang-tftp/"*
}

package_erlang-28-tools() {
  pkgdesc='A set of programming tools including a coverage analyzer etc'
  depends=(
    erlang-28-core
    erlang-28-inets
    erlang-28-runtime_tools
  )
  provides=(erlang-tools)
  conflicts=(erlang-tools)
  cp -va -t "$pkgdir" "erlang-tools/"*
}

package_erlang-28-wx() {
  pkgdesc='A library for wxWidgets support in Erlang'
  depends=(
    erlang-28-core
    glib2
    glibc
    glu
    libgcc
    libglvnd
    libstdc++
    webkit2gtk-4.1
    wxwidgets-common
    wxwidgets-gtk3
  )
  provides=(erlang-wx)
  conflicts=(erlang-wx)
  cp -va -t "$pkgdir" "erlang-wx/"*
}

package_erlang-28-xmerl() {
  pkgdesc='Provides support for XML 1.0'
  depends=(erlang-28-core)
  provides=(erlang-xmerl)
  conflicts=(erlang-xmerl)
  cp -va -t "$pkgdir" "erlang-xmerl/"*
}
