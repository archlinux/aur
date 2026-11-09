# Maintainer: Miguel Palencia <mike@qtum.org>
# Based on the AUR bitcoin-bin split package (Carl Dong), collapsed into one package.

pkgname=qtum-core-bin
pkgver=30.3
pkgrel=1
pkgdesc="Qtum Core: qtumd, qtum-qt, qtum-cli, qtum-tx, qtum-util, qtum-wallet (official binaries)"
arch=('x86_64')
url="https://qtum.org/"
license=('MIT')
# qtumd/cli/tx/util/wallet only need glibc+gcc-libs; the rest is for qtum-qt / qtum-gui
depends=('gcc-libs' 'glibc' 'hicolor-icon-theme' 'fontconfig' 'freetype2' 'libxcb' 'libxkbcommon' 'libxkbcommon-x11'
         'xcb-util-image' 'xcb-util-keysyms' 'xcb-util-renderutil' 'xcb-util-wm')
optdepends=('python: share/qtum/rpcauth/rpcauth.py')
provides=('qtum' 'qtumd' 'qtum-qt' 'qtum-cli' 'qtum-tx' 'qtum-util' 'qtum-wallet' 'qtum-daemon')
conflicts=('qtum' 'qtumd' 'qtum-qt' 'qtum-cli' 'qtum-tx' 'qtum-util' 'qtum-wallet' 'qtum-daemon' 'qtum-git')
backup=('etc/qtum/qtum.conf')
options=('!strip' '!debug')
_bin="qtum-${pkgver}-bin"
_src="qtum-${pkgver}-src"
source=("${_bin}.tar.gz::https://github.com/qtumproject/qtum/releases/download/v${pkgver}/qtum-${pkgver}-${CARCH}-linux-gnu.tar.gz"
        "${_src}.tar.gz::https://github.com/qtumproject/qtum/releases/download/v${pkgver}/qtum-${pkgver}.tar.gz"
        "qtumd.service"
        "qtum.sysusers"
        "qtum.tmpfiles"
        "qtum-qt.desktop")
noextract=("${_bin}.tar.gz" "${_src}.tar.gz")
sha256sums=('49d20626d7941397e09484d0b0beed234ac4aa7c203e01cbb999f0e789b52198'
            '32f5cce6bfedfea3bb71d09466e66fe914ea354af2e91d4b158f6932bae381f9'
            '220a5868ed78f4f4856b6606449884c2d7902a05ce55428ba23c857e7e88c42a'
            'f9e8b767db3c06ceb32d21d49c5927c65c423d556b4ced966447521f0ea97477'
            '08110b78e3535dff793becf3cef7bf175a426908de770265dd75ae85d71f9f30'
            '2f1b6f4485753df641e30ed7e879fbf25b6bfd7865dcf55e6e8e7de33701de8b')

prepare() {
  local d
  for d in "$_bin" "$_src"; do
    mkdir -p "$srcdir/$d"
    bsdtar -xf "$srcdir/$d.tar.gz" -C "$srcdir/$d" --strip-components=1
  done
}

package() {
  local b
  cd "$srcdir/$_bin"

  # all user-facing binaries in one package
  for b in qtum qtumd qtum-qt qtum-cli qtum-tx qtum-util qtum-wallet; do
    install -Dm755 "bin/$b" "$pkgdir/usr/bin/$b"
  done
  # multiprocess helpers used by the `qtum` wrapper
  for b in qtum-node qtum-gui; do
    install -Dm755 "libexec/$b" "$pkgdir/usr/libexec/$b"
  done
  install -Dm644 -t "$pkgdir/usr/share/man/man1" share/man/man1/*.1
  install -Dm755 share/rpcauth/rpcauth.py "$pkgdir/usr/share/qtum/rpcauth/rpcauth.py"

  cd "$srcdir/$_src"
  install -Dm644 share/examples/qtum.conf "$pkgdir/etc/qtum/qtum.conf"
  for b in qtum-cli qtum-tx qtumd; do
    install -Dm644 "contrib/completions/bash/$b.bash" \
      "$pkgdir/usr/share/bash-completion/completions/$b"
  done
  install -Dm644 -t "$pkgdir/usr/share/fish/vendor_completions.d" contrib/completions/fish/*.fish
  install -Dm644 share/pixmaps/bitcoin256.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/qtum-qt.png"
  install -Dm644 share/pixmaps/bitcoin128.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/qtum-qt.png"
  install -Dm644 share/pixmaps/bitcoin64.png  "$pkgdir/usr/share/icons/hicolor/64x64/apps/qtum-qt.png"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"

  cd "$srcdir"
  install -Dm644 qtumd.service   "$pkgdir/usr/lib/systemd/system/qtumd.service"
  install -Dm644 qtum.sysusers   "$pkgdir/usr/lib/sysusers.d/qtum.conf"
  install -Dm644 qtum.tmpfiles   "$pkgdir/usr/lib/tmpfiles.d/qtum.conf"
  install -Dm644 qtum-qt.desktop "$pkgdir/usr/share/applications/qtum-qt.desktop"
}
