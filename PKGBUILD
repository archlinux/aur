# Maintainer: Dylan <dylan@psilly.com>

_pkgbase=dogecoin
pkgname=('dogecoin-daemon' 'dogecoin-cli' 'dogecoin-tx')
pkgver=1.14.9
pkgrel=2
arch=('x86_64')
url='https://dogecoin.com/'
makedepends=(
  boost
  boost-libs
  db
  libevent
  libzmq.so
)
license=('MIT')
source=("$_pkgbase-$pkgver.tar.gz::https://github.com/dogecoin/dogecoin/releases/download/v$pkgver/$_pkgbase-$pkgver.tar.gz"
        "$_pkgbase-$pkgver.SHA256SUMS::https://github.com/dogecoin/dogecoin/releases/download/v$pkgver/SHA256SUMS.asc"
        "$_pkgbase.sysusers"
        "$_pkgbase.tmpfiles"
        "https://github.com/dogecoin/dogecoin/pull/3928.patch")
sha256sums=('d763b16c810d673b1fe84c2df0bd8f36feedfa0a5b31bb8a2dc5fdc8bb6dcb85'
            '070673a1c9fdf271829fefb4a794c6b040e3275a319d2ae4ed2959298406020f'
            '9946c415ffb7d7189c81a349bd92020aeb658706adb74215630339daf00a6c96'
            '0fc1bf30a981dca11f7fa7cb81c87bbc5342c3dbcd63b9ef6e0bff766c78eb31'
            '1988c97baf15bc7118f6e818fdda5243c9428f1223fb15415cb725491e1bd45e')
b2sums=('a6cc319c8a4c0a3335f721b8d9ec63a07680a8661115895c2db94ad297bc9d02503f50ab1c7052426e839b2badda4bd6d5b978f289ef275c311a5eaae78776b5'
        '9a9e40e10d3099e907957a2d7f2b658f3fa8a806e2a0697408bb8dcb66ec7d71079986c8ec2401746760f0ed1d6bf11d30cfa94ae7eadb50419900b82d188db7'
        '83580709bab7080658e29c50d1d463d028bd36f46ed14f5209a4b52b8e7a3603737c2322b130a399710fa443f009ab66ab23ebea28e3c2a2e4449819c7d98037'
        'b7ff737de45edfca7e5ec05076f3df4106da42790ba7f6210be6622ba005ef6f5bf4e2e55919ec2ac25e1612b0a8964bf022b68591a1b38c9a0c1dc4337fd054'
        '5e79efeadf3416cef50b7171e9a5b9949e5bfbf852e7aa47a855d232a41e864186ea47362e7ac44ba525e07c4a733aab4a30fa98fc68142a90f03f3c0c8f3e06')
validpgpkeys=(DC6EF4A8BF9F1B1E4DE1EE522D3A345B98D0DC1F)

prepare() {
  gpg --decrypt "$_pkgbase-$pkgver.SHA256SUMS" | sha256sum -c --ignore-missing
  cd "$_pkgbase-$pkgver"
  patch -p1 -i "../3928.patch"
}

build() {
  cd $_pkgbase-$pkgver

  # remove already defined _FORTIFY_SOURCE from CXXFLAGS
  CXXFLAGS=${CXXFLAGS/-Wp,-D_FORTIFY_SOURCE=?/}

  ./autogen.sh
  ./configure --prefix=/usr --enable-c++17 \
    --with-incompatible-bdb \
    --with-gui=no \
    --without-miniupnpc
  make
}

package_dogecoin-daemon() {
  pkgdesc="Dogecoin is a peer-to-peer network based digital currency - daemon"
  depends=(
    db
    gcc-libs
    glibc
    libevent
    libzmq.so
  )

  cd $_pkgbase-$pkgver
  install -Dm755 src/dogecoind "$pkgdir"/usr/bin/dogecoind
  install -Dm644 contrib/dogecoind.bash-completion \
    "$pkgdir"/usr/share/bash-completion/completions/dogecoind
  install -Dm644 doc/man/dogecoind.1 \
    "$pkgdir"/usr/share/man/man1/dogecoind.1
  install -Dm644 contrib/init/dogecoind.service \
    "$pkgdir/usr/lib/systemd/system/dogecoind.service"
  install -Dm644 "$srcdir/dogecoin.sysusers" \
    "$pkgdir/usr/lib/sysusers.d/dogecoin.conf"
  install -Dm644 "$srcdir/dogecoin.tmpfiles" \
    "$pkgdir/usr/lib/tmpfiles.d/dogecoin.conf"

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

package_dogecoin-cli() {
  pkgdesc="Dogecoin is a peer-to-peer network based digital currency - RPC client"
  depends=(
    db
    gcc-libs
    glibc
    libevent
  )

  cd $_pkgbase-$pkgver
  install -Dm755 src/dogecoin-cli "$pkgdir"/usr/bin/dogecoin-cli
  install -Dm644 contrib/dogecoin-cli.bash-completion \
    "$pkgdir"/usr/share/bash-completion/completions/dogecoin-cli
  install -Dm644 doc/man/dogecoin-cli.1 \
    "$pkgdir"/usr/share/man/man1/dogecoin-cli.1

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

package_dogecoin-tx() {
  pkgdesc="Dogecoin is a peer-to-peer network based digital currency - Transaction tool"
  depends=(
    db
    gcc-libs
    glibc
  )

  cd $_pkgbase-$pkgver
  install -Dm755 src/dogecoin-tx "$pkgdir"/usr/bin/dogecoin-tx
  install -Dm644 contrib/dogecoin-tx.bash-completion \
    "$pkgdir"/usr/share/bash-completion/completions/dogecoin-tx
  install -Dm644 doc/man/dogecoin-tx.1 \
    "$pkgdir"/usr/share/man/man1/dogecoin-tx.1

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
