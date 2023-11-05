# Maintainer:
# Contributor: Marco Cirillo <maranda@lightwitch.org>
# Contributor: Maxime “pep” Buquet <archlinux@bouah.net>

_pkgname="metronome"
pkgname="$_pkgname-git"
pkgver=4.0.3.r0.gc05ffc4
pkgrel=1
pkgdesc="Metronome IM XMPP Server Development"
url="https://github.com/maranda/metronome"
license=('MIT' 'ISC')
arch=('i686' 'x86_64')

depends=(
  'lua52'
  'lua52-socket'
  'lua52-expat'
  'lua52-filesystem'
  'lua52-event'
  'lua52-sec'
  'libidn'
  'openssl'
  'libevent'
)
makedepends=('git')
optdepends=(
  'lua52-zlib: compression support'
)

backup=('etc/metronome/metronome.cfg.lua')

if [ x"$pkgname" == x"$_pkgname" ] ; then
  # normal package
  _pkgsrc="$_pkgname"
  source+=("$_pkgsrc"::"git+$url.git#tag=v${pkgver%%.r*}")
  sha256sums+=('SKIP')

  pkgver() {
    # cat metronome.release
    echo "${pkgver%%.r*}"
  }
else
  # git package
  provides=("$_pkgname=${pkgver%%.r*}")
  conflicts=("$_pkgname")

  _pkgsrc="$_pkgname"
  source+=("$_pkgsrc"::"git+$url.git")
  sha256sums+=('SKIP')

  pkgver() {
    cd "$_pkgsrc"
    git describe --long --tags --exclude='*[a-zA-Z][a-zA-Z]*' \
      | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
  }
fi

source+=(
  'metronome.service'
  'metronome.sysusers'
  'metronome.tmpfiles'
)
sha256sums+=(
  '86fe5add63a84762433219969a914dd3e680cc4bd6e73904b72ada470666c541'
  '6b1fed75dd6fcd23023cb0da1509afc7f12eb9d3948cf9f328a22608acdcb889'
  '378ca207ffc02824282de9c477f945c4cb9cabc41b73a39eeeb136e7e9178a36'
)

prepare() {
  # fix openssl config; oid already defined
  sed -E \
    -e 's@^(SRVName\s+=\s+.*)$@#\1@' \
    -e 's@xmppAddr@XmppAddr@g' \
    -e 's@^(XmppAddr\s+=\s+.*)$@#\1@' \
    -i "${srcdir:?}/$_pkgsrc/certs/openssl.cnf"
}

build() {
  local _configure_options=(
    --ostype=linux
    --prefix=/usr
    --with-lua-include=/usr/include/lua5.2
    --with-lua=/usr/bin/lua5.2
    --with-lua-lib=/usr/lib/lua/5.2
    --lua-suffix=5.2
    --sysconfdir=/etc/metronome
    --datadir=/var/lib/metronome
  )

  cd "$_pkgsrc"
  ./configure "${_configure_options[@]}"
  make
}

package() {
  make -C "$_pkgsrc" DESTDIR="${pkgdir:?}" install

  install -dm755 "${pkgdir:?}/var/log/metronome" "${pkgdir:?}/run/metronome"
  install -Dm644 "$_pkgsrc/scripts/logrotate" "${pkgdir:?}/etc/logrotate.d/metronome"

  install -Dm644 "$_pkgsrc/LICENSE" -t "${pkgdir:?}/usr/share/licenses/$pkgname/"

  install -Dm644 "metronome.service" -t "${pkgdir:?}/usr/lib/systemd/system/"
  install -Dm644 "metronome.sysusers" "${pkgdir:?}/usr/lib/sysusers.d/$_pkgname.conf"
  install -Dm644 "metronome.tmpfiles" "${pkgdir:?}/usr/lib/tmpfiles.d/$_pkgname.conf"
}

# vim:set ts=2 sw=2 et:
