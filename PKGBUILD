# Maintainer: Carl Dong <accounts@carldong.me>

pkgbase=bitcoin-bin
_util_suffixes=('cli' 'qt' 'tx' 'util' 'wallet')
_pkgname=('bitcoin-daemon' "${_util_suffixes[@]/#/bitcoin-}")
pkgname=("${_pkgname[@]/%/-bin}")
pkgver=26.0
pkgrel=1
pkgdesc="A peer-to-peer network based digital currency (official binaries)"
arch=('x86_64')
url="https://bitcoincore.org/"
license=('MIT')
_bindirbase="${pkgbase}-${pkgver}-bin"
_srcdirbase="${pkgbase}-${pkgver}-src"
source=("${_bindirbase}.tar.gz::https://bitcoincore.org/bin/bitcoin-core-${pkgver}/bitcoin-${pkgver}-x86_64-linux-gnu.tar.gz"
        "${_srcdirbase}.tar.gz::https://bitcoincore.org/bin/bitcoin-core-${pkgver}/bitcoin-${pkgver}.tar.gz"
        "bitcoin.sysusers"
        "bitcoin.tmpfiles"
        "bitcoin-qt.desktop"
        "bitcoin-qt.appdata.xml")
# We manually extract in prepare()
noextract=("${_bindirbase}.tar.gz"
           "${_srcdirbase}.tar.gz")
sha256sums=('23e5ab226d9e01ffaadef5ffabe8868d0db23db952b90b0593652993680bb8ab'
            'ab1d99276e28db62d1d9f3901e85ac358d7f1ebcb942d348a9c4e46f0fcdc0a1'
            '7a77112fb094b9b2e6dd873e24c9a6bacb1f1c453d811a024f271f4b78f2a704'
            'ba83570b4671b18c230f23d8d93cd8faa73179a546655448c14d1644d9b49f35'
            'a020897651c03690eae3411fe401100fd1a2ffaa799247165eb71124609b7959'
            '71b125555451e9bc60b54a6658d886bad63bd18c58b5d6e3bd8977b82a70da7a')

# Usage: _extract NAME
_extract() {
  local extract_dir="${srcdir}/${1}"
  mkdir -p "$extract_dir"
  tar -C "$extract_dir" --strip-components=1 -xzf "${startdir}/${1}.tar.gz"
}

prepare() {
  _extract "$_bindirbase"
  _extract "$_srcdirbase"
}

# Usage: _package BINNAME
#   cd into the right directory before
_package() {
  install -Dm755 {,"$pkgdir"/usr/}bin/"$1"
  local _from_path=share/man/man1/"$1".1
  local _to_path="$pkgdir"/usr/"$_from_path"
  if [ -f "$_from_path" ]; then
    install -Dm644 "$_from_path" "$_to_path"
  fi
}

# Usage: _maybe_install_completion BINNAME
#   cd into the right directory before
_maybe_install_completion() {
  local _from_path=contrib/"$1".bash-completion
  local _to_path="$pkgdir"/usr/share/bash-completion/completions/"$1"
  if [ -f "$_from_path" ]; then
    install -Dm644 "$_from_path" "$_to_path"
  fi
}

package_bitcoin-daemon-bin() {
  local binname=bitcoind

  pkgdesc="A peer-to-peer network based digital currency - Daemon"
  depends=(gcc-libs)
  backup=('etc/bitcoin/bitcoin.conf')
  provides=('bitcoin-daemon')
  conflicts=('bitcoin-daemon')

  install -Dm644 "$srcdir/bitcoin.sysusers" \
    "$pkgdir/usr/lib/sysusers.d/bitcoin.conf"
  install -Dm644 "$srcdir/bitcoin.tmpfiles" \
    "$pkgdir/usr/lib/tmpfiles.d/bitcoin.conf"

  (
    cd "$_bindirbase"
    _package "$binname"
  )

  (
    cd "$_srcdirbase"

    _maybe_install_completion "$binname"
    install -Dm644 contrib/init/"$binname".service \
      "$pkgdir/usr/lib/systemd/system/"$binname".service"
    install -Dm644 share/examples/bitcoin.conf \
      "$pkgdir/etc/bitcoin/bitcoin.conf"

    install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  )
}

package_bitcoin-cli-bin() {
  local binname=bitcoin-cli

  pkgdesc="A peer-to-peer network based digital currency - RPC client"
  depends=(gcc-libs)
  provides=('bitcoin-cli')
  conflicts=('bitcoin-cli')

  (
    cd "$_bindirbase"
    _package "$binname"
  )

  (
    cd "$_srcdirbase"

    _maybe_install_completion "$binname"

    install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  )
}

package_bitcoin-qt-bin() {
  local binname=bitcoin-qt

  pkgdesc="A peer-to-peer network based digital currency - Qt"
  depends=(gcc-libs fontconfig freetype2 hicolor-icon-theme libxcb libxkbcommon)
  provides=('bitcoin-qt')
  conflicts=('bitcoin-qt')

  install -Dm644 "$srcdir/bitcoin-qt.desktop" \
    "$pkgdir"/usr/share/applications/bitcoin-qt.desktop
  install -Dm644 "$srcdir/bitcoin-qt.appdata.xml" \
    "$pkgdir"/usr/share/metainfo/bitcoin-qt.appdata.xml

  (
    cd "$_bindirbase"
    _package "$binname"
  )

  (
    cd "$_srcdirbase"

    _maybe_install_completion "$binname"
    install -Dm644 src/qt/res/src/bitcoin.svg \
      "$pkgdir"/usr/share/icons/hicolor/scalable/apps/bitcoin-qt.svg
    for i in 16 32 64 128 256; do
      install -Dm644 share/pixmaps/bitcoin${i}.png \
        "$pkgdir"/usr/share/icons/hicolor/${i}x${i}/apps/bitcoin-qt.png
    done

    install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  )
}

package_bitcoin-tx-bin() {
  local binname=bitcoin-tx

  pkgdesc="A peer-to-peer network based digital currency - Transaction tool"
  depends=(gcc-libs)
  provides=('bitcoin-tx')
  conflicts=('bitcoin-tx')

  (
    cd "$_bindirbase"
    _package "$binname"
  )

  (
    cd "$_srcdirbase"
    _maybe_install_completion "$binname"
    install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  )
}

package_bitcoin-util-bin() {
  local binname=bitcoin-util

  pkgdesc="A peer-to-peer network based digital currency - Utility"
  depends=(gcc-libs)
  provides=('bitcoin-util')
  conflicts=('bitcoin-util')

  (
    cd "$_bindirbase"
    _package "$binname"
  )

  (
    cd "$_srcdirbase"
    _maybe_install_completion "$binname"
    install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  )
}

package_bitcoin-wallet-bin() {
  local binname=bitcoin-wallet

  pkgdesc="A peer-to-peer network based digital currency - Wallet"
  depends=(gcc-libs)
  provides=('bitcoin-wallet')
  conflicts=('bitcoin-wallet')

  (
    cd "$_bindirbase"
    _package "$binname"
  )

  (
    cd "$_srcdirbase"
    _maybe_install_completion "$binname"
    install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  )
}

# vim:set ts=2 sw=2 et:
