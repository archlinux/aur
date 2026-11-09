# Maintainer: Miguel Palencia <mike@qtum.org>
# Based on the AUR bitcoin-git PKGBUILD (Luis Aranguren / Raansu), adapted for Qtum.

pkgname=qtum-git
_gitname=qtum
pkgver=30.3.0.r52981.g493ab77
pkgrel=1
pkgdesc="Qtum Core (git master): qtumd, qtum-qt, qtum-cli, qtum-tx, qtum-util, qtum-wallet, with the EVM (evmone) submodule"
arch=('x86_64')
url="https://qtum.org/"
license=('MIT')
depends=('boost-libs' 'libevent' 'sqlite' 'zeromq' 'qt6-base' 'qrencode' 'capnproto'
         'hicolor-icon-theme')
makedepends=('git' 'cmake' 'boost' 'qt6-tools' 'python' 'pkgconf')
optdepends=('python: rpcauth helper')
provides=('qtum' 'qtumd' 'qtum-qt' 'qtum-cli' 'qtum-tx' 'qtum-util' 'qtum-wallet' 'qtum-daemon')
conflicts=('qtum' 'qtumd' 'qtum-qt' 'qtum-cli' 'qtum-tx' 'qtum-util' 'qtum-wallet' 'qtum-daemon' 'qtum-bin')
backup=('etc/qtum/qtum.conf')
source=("$_gitname::git+https://github.com/qtumproject/qtum.git"
        "qtumd.service"
        "qtum.sysusers"
        "qtum.tmpfiles"
        "qtum-qt.desktop"
        "boost-1.91-multi_index.patch")
sha256sums=('SKIP'
            '220a5868ed78f4f4856b6606449884c2d7902a05ce55428ba23c857e7e88c42a'
            'f9e8b767db3c06ceb32d21d49c5927c65c423d556b4ced966447521f0ea97477'
            '08110b78e3535dff793becf3cef7bf175a426908de770265dd75ae85d71f9f30'
            '2f1b6f4485753df641e30ed7e879fbf25b6bfd7865dcf55e6e8e7de33701de8b'
            'd4777187dd2100735264f615a4f82028f738764c309ae1e11f958e34438792ff')

pkgver() {
  cd "$srcdir/$_gitname"
  local major minor build
  major=$(sed -n 's/^set(CLIENT_VERSION_MAJOR \([0-9]*\)).*/\1/p' CMakeLists.txt)
  minor=$(sed -n 's/^set(CLIENT_VERSION_MINOR \([0-9]*\)).*/\1/p' CMakeLists.txt)
  build=$(sed -n 's/^set(CLIENT_VERSION_BUILD \([0-9]*\)).*/\1/p' CMakeLists.txt)
  printf "%s.%s.%s.r%s.g%s" "$major" "$minor" "$build" \
    "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "$srcdir/$_gitname"
  # makepkg can't do `git clone --recursive`, so pull the submodules here.
  # This brings in src/evmone (qtum-evmone, the Ethereum VM) and its nested submodules.
  git submodule sync --recursive
  git submodule update --init --recursive
  test -f src/evmone/CMakeLists.txt || { echo "evmone submodule missing" >&2; return 1; }
  # Boost >= 1.91: indexed_by is an Mp11 list and can no longer be a base class.
  # Same fix as Bitcoin Core (reverts a3cb309e); applied only if not already upstream.
  if git apply --check "$srcdir/boost-1.91-multi_index.patch" 2>/dev/null; then
    git apply "$srcdir/boost-1.91-multi_index.patch"
  fi
}

build() {
  cd "$srcdir/$_gitname"
  cmake -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_GUI=ON \
    -DBUILD_TX=ON \
    -DBUILD_UTIL=ON \
    -DBUILD_WALLET_TOOL=ON \
    -DBUILD_TESTS=ON \
    -DWITH_ZMQ=ON \
    -DWITH_QRENCODE=ON \
    -DENABLE_IPC=ON \
    -DWITH_CCACHE=OFF \
    -DINSTALL_MAN=ON
  cmake --build build
}

check() {
  cd "$srcdir/$_gitname"
  ctest --test-dir build --output-on-failure -j"$(nproc)"
}

package() {
  cd "$srcdir/$_gitname"
  DESTDIR="$pkgdir" cmake --install build

  # test binaries don't belong in the package
  rm -f "$pkgdir"/usr/bin/test_qtum* "$pkgdir"/usr/libexec/test_qtum*

  install -Dm644 share/examples/qtum.conf "$pkgdir/etc/qtum/qtum.conf"
  local b
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
