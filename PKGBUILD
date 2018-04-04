# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=bitcoin-core-git
pkgver=20180330
pkgrel=2
pkgdesc="Bitcoin Core headless P2P node"
arch=('armv6h' 'armv7h' 'i686' 'x86_64')
url="https://github.com/bitcoin/bitcoin"
depends=('boost'
         'boost-libs'
         'zeromq')
checkdepends=('python')
makedepends=('autoconf'
             'automake'
             'binutils'
             'git'
             'libtool'
             'm4'
             'make'
             'pkg-config'
             'systemd')
license=('MIT')
source=(git+https://github.com/bitcoin/bitcoin
        bitcoin.conf
        bitcoin.logrotate
        bitcoin.service
        bitcoin-reindex.service
        bitcoin-sysusers.conf
        bitcoin-core-git-01-systemd-sysusers.hook
        bitcoin-core-git-01-userdel.hook
        bitcoin-core-git-02-chown.hook
        bitcoin-core-git-02-rm-rf.hook)
sha256sums=('SKIP'
            'b1908344281498d39bfa40c3b9725f9c95bf22602cd46e6120a1f17bad9dae35'
            '8f05207b586916d489b7d25a68eaacf6e678d7cbb5bfbac551903506b32f904f'
            'e56dc913b82097acdc20374a2ae1b08323af74ccbbf63c829d4d13c9cb63ad8d'
            '4d5053ba94fa647abc6abe8b90f46d4c61d706de8fb0151f6aefed772adf317e'
            'f126b4824e43d9760ab2021460a37d859986f07e1ac9245ee4938e832739f73a'
            'c8636b95f7267c65da609bfde84cb70d7733126837e0b05b3219cb271beb634c'
            'fd51f57554bbe6df225c6773736d3941ac479e70f5573b3c373157e16a7f6484'
            '51e683fc708ba4c17da93dd70a593c7b94ba5c2f58a431c04c1b0112b52221f6'
            '35b34d87df5a58aca3c0ceb18fc31ed36c1493838cb9a3b9653f8b5bf64b2de2')
backup=('etc/bitcoin/bitcoin.conf'
        'etc/logrotate.d/bitcoin')
provides=('bitcoin-cli' 'bitcoin-core' 'bitcoin-daemon' 'bitcoin-tx')
conflicts=('bitcoin-cli' 'bitcoin-core' 'bitcoin-daemon' 'bitcoin-qt' 'bitcoin-tx')
install=bitcoin.install

# half of available processing units or one if only one is available
_nproc=$(($(nproc)/2))
[[ ${_nproc} < 1 ]] && _nproc=1

pkgver() {
  cd ${pkgname%%-*}
  git log -1 --format="%cd" --date=short --no-show-signature | sed "s|-||g"
}

build() {
  cd "${pkgname%%-*}"

  msg2 'Building...'
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

  msg2 'Testing...'
  make -j$_nproc check
}

package() {
  cd "${pkgname%%-*}"

  msg2 'Installing license...'
  install -Dm 644 COPYING -t "$pkgdir/usr/share/licenses/${pkgname%%-*}"

  msg2 'Installing man pages...'
  install -Dm 644 doc/man/*.1 -t "$pkgdir/usr/share/man/man1"

  msg2 'Installing documentation...'
  install -dm 755 "$pkgdir/usr/share/doc/bitcoin"
  for _doc in \
    $(find doc -maxdepth 1 -type f -name "*.md" -printf '%f\n') \
    release-notes; do
      cp -dpr --no-preserve=ownership "doc/$_doc" \
        "$pkgdir/usr/share/doc/bitcoin/$_doc"
  done

  msg2 'Installing essential directories'
  install -dm 700 "$pkgdir/etc/bitcoin"
  install -dm 755 "$pkgdir/srv/bitcoin"

  msg2 'Installing bitcoin...'
  make DESTDIR="$pkgdir" install

  msg2 'Installing bitcoin.conf...'
  install -Dm 600 "$srcdir/bitcoin.conf" -t "$pkgdir/etc/bitcoin"

  msg2 'Installing bitcoin.service...'
  install -Dm 644 "$srcdir/bitcoin.service" -t "$pkgdir/usr/lib/systemd/system"
  install -Dm 644 "$srcdir/bitcoin-reindex.service" \
    -t "$pkgdir/usr/lib/systemd/system"

  msg2 'Installing bitcoin-sysusers.conf...'
  install -Dm 644 "$srcdir/bitcoin-sysusers.conf" \
    "$pkgdir/usr/lib/sysusers.d/bitcoin.conf"

  msg2 'Installing bitcoin.logrotate...'
  install -Dm 644 "$srcdir/bitcoin.logrotate" "$pkgdir/etc/logrotate.d/bitcoin"

  msg2 'Installing bash completion...'
  for _compl in bitcoin-cli bitcoin-tx bitcoind; do
    install -Dm 644 "contrib/${_compl}.bash-completion" \
      "$pkgdir/usr/share/bash-completion/completions/$_compl"
  done

  # XXX: pacman hook on Remove event not firing
  msg2 'Installing pacman hooks...'
  install -Dm 644 "$srcdir"/*.hook -t "$pkgdir/usr/share/libalpm/hooks"
}
