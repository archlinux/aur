# Maintainer: mrxx <mrxx at cyberhome dot at>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=bitcoin-core-git
pkgver=20191209
pkgrel=1
pkgdesc="Bitcoin Core headless P2P node"
arch=('aarch64' 'armv6h' 'armv7h' 'i686' 'x86_64')
url="https://github.com/bitcoin/bitcoin"
depends=('boost' 'boost-libs' 'zeromq' 'libevent')
checkdepends=('python')
makedepends=('autoconf' 'automake' 'binutils' 'git' 'libtool' 'm4' 'make' 'pkg-config' 'systemd')
license=('MIT')
source=(git+https://github.com/bitcoin/bitcoin
        bitcoin.conf
        bitcoind.logrotate
        bitcoin-sysusers.conf
        bitcoin-core-git-01-systemd-sysusers.hook
        bitcoin-core-git-01-userdel.hook
        bitcoin-core-git-02-chown.hook
        bitcoin-core-git-02-rm-rf.hook)
sha256sums=('SKIP'
            'b1908344281498d39bfa40c3b9725f9c95bf22602cd46e6120a1f17bad9dae35'
            '7bf4bdad419c1ee30b88c7e4190707c5ff250da8b23d68d5adf14043f8e2ac73'
            'f126b4824e43d9760ab2021460a37d859986f07e1ac9245ee4938e832739f73a'
            'c8636b95f7267c65da609bfde84cb70d7733126837e0b05b3219cb271beb634c'
            'fd51f57554bbe6df225c6773736d3941ac479e70f5573b3c373157e16a7f6484'
            'ee5a24fe631e51df8b8314dbc5c7720ec12dbb6fcf7f834b1c811d85e0ee4795'
            'c586e4931ab01f6b6a36a44d7c6eb29a509a91d81e3b0ea24a6e4f8065a1217b')
provides=('bitcoin-cli' 'bitcoin-core' 'bitcoin-daemon' 'bitcoin-tx')
conflicts=('bitcoin-cli' 'bitcoin-core' 'bitcoin-daemon' 'bitcoin-qt' 'bitcoin-tx')
install=bitcoind.install

# half of available processing units or one if only one is available
_nproc=$(($(nproc)/2))
[[ ${_nproc} < 1 ]] && _nproc=1

pkgver() {
  cd ${pkgname%%-*}
  git log -1 --format="%cd" --date=short --no-show-signature | sed "s|-||g"
}

build() {
  cd "${pkgname%%-*}"

  ./autogen.sh
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --libexecdir=/usr/lib/bitcoin \
    --sysconfdir=/etc \
    --sharedstatedir=/usr/share/bitcoin \
    --localstatedir=/var/lib/bitcoin \
    --enable-hardening \
    --with-gui=no \
    --disable-wallet \
    --without-miniupnpc \
    --with-gnu-ld
  make -j$_nproc
}

check() {
  cd "${pkgname%%-*}"
  make -j$_nproc check
}

package() {
  cd "${pkgname%%-*}"

  install -Dm 644 COPYING -t "$pkgdir/usr/share/licenses/${pkgname%%-*}"

  install -dm 755 "$pkgdir/usr/share/doc/bitcoin"
  for _doc in $(find doc -maxdepth 1 -type f -name "*.md" -printf '%f\n') release-notes; do
      cp -dpr --no-preserve=ownership "doc/$_doc" "$pkgdir/usr/share/doc/bitcoin/$_doc"
  done

  install -dm 700 "$pkgdir/etc/bitcoin"

  make DESTDIR="$pkgdir" install

  install -Dm 600 "$srcdir/bitcoin.conf" -t "$pkgdir/etc/bitcoin"
  cat "$srcdir/bitcoin/share/examples/bitcoin.conf" >>"$pkgdir/etc/bitcoin/bitcoin.conf"

  install -Dm 644 "$srcdir/bitcoin/contrib/init/bitcoind.service" -t "$pkgdir/usr/lib/systemd/system"
  sed -i 's/StateDirectory/#StateDirectory/g' "$pkgdir/usr/lib/systemd/system/bitcoind.service"
  sed 's|\-daemon|\-daemon \-reindex|;s|Description=.*|Description=Bitcoin daemon (reindex)|' "$pkgdir/usr/lib/systemd/system/bitcoind.service" >"$pkgdir/usr/lib/systemd/system/bitcoind-reindex.service"

  install -Dm 644 "$srcdir/bitcoin-sysusers.conf" "$pkgdir/usr/lib/sysusers.d/bitcoin.conf"

  install -Dm 644 "$srcdir/bitcoind.logrotate" "$pkgdir/etc/logrotate.d/bitcoin"

  for _compl in bitcoin-cli bitcoin-tx bitcoind; do
    install -Dm 644 "contrib/${_compl}.bash-completion" \
      "$pkgdir/usr/share/bash-completion/completions/$_compl"
  done

  # NB: pacman hook on Remove event not firing
  install -Dm 644 "$srcdir"/*.hook -t "$pkgdir/usr/share/libalpm/hooks"
}
