# Maintainer: Your Name <your@email>
# Contributor: lingzolabs

_pkgbase=vibetype
pkgbase=$_pkgbase
pkgname=("$_pkgbase" "$_pkgbase-fcitx5" "$_pkgbase-ibus")
pkgver=0.1.3
pkgrel=1
pkgdesc="Voice-to-text input method backend with IBus and Fcitx5 frontends"
arch=('x86_64')
url="https://github.com/lingzolabs/vibetype"
license=('MIT')
depends=('gcc-libs' 'glibc' 'python')
options=('!strip')
source=("$_pkgbase-$pkgver-x86_64.tar.gz::https://github.com/lingzolabs/vibetype/releases/download/v$pkgver/$_pkgbase-$pkgver-x86_64.tar.gz"
        "$_pkgbase-fcitx5-$pkgver-x86_64.tar.gz::https://github.com/lingzolabs/vibetype/releases/download/v$pkgver/$_pkgbase-fcitx5-$pkgver-x86_64.tar.gz"
        "$_pkgbase-ibus-$pkgver-x86_64.tar.gz::https://github.com/lingzolabs/vibetype/releases/download/v$pkgver/$_pkgbase-ibus-$pkgver-x86_64.tar.gz")
sha256sums=('71ed029620ee1442714f16fae78af367b3a99be20faad01c8b8162db2ed9a8e3'
            '0a75ec6d7f8d4ede02afa45cfab213b1cb7a63cb0db276f8ffb1212b3757e0a8'
            '56d9a9292c292d80455fa17bbfe0391b6b8c1ea478a1b0bc053405934586eab7')

# The tar.gz archives have no top-level directory, so we extract each into
# its own subdirectory in prepare() to avoid file overlaps.
# The three variants are mutually exclusive; each ships a full backend + CLI.

prepare() {
  # Source naming: source entry index 0 → vibetype-<ver>-x86_64.tar.gz, etc.
  local _base_src="${srcdir}/${_pkgbase}-${pkgver}-x86_64.tar.gz"
  local _fcitx5_src="${srcdir}/${_pkgbase}-fcitx5-${pkgver}-x86_64.tar.gz"
  local _ibus_src="${srcdir}/${_pkgbase}-ibus-${pkgver}-x86_64.tar.gz"

  local _base_dir="${srcdir}/${_pkgbase}"
  local _fcitx5_dir="${srcdir}/${_pkgbase}-fcitx5"
  local _ibus_dir="${srcdir}/${_pkgbase}-ibus"

  mkdir -p "$_base_dir" "$_fcitx5_dir" "$_ibus_dir"

  bsdtar -C "$_base_dir"   -xf "$_base_src"
  bsdtar -C "$_fcitx5_dir" -xf "$_fcitx5_src"
  bsdtar -C "$_ibus_dir"   -xf "$_ibus_src"
}

package_vibetype() {
  pkgdesc="Voice-to-text input method backend and CLI (standalone, no input method frontend)"

  cd "$srcdir/$_pkgbase"

  # Install binaries
  install -Dm755 bin/vibetype-backend "$pkgdir/usr/bin/vibetype-backend"
  install -Dm755 bin/vibetype-cli      "$pkgdir/usr/bin/vibetype-cli"

  # Install systemd user service
  install -Dm644 lib/x86_64-linux-gnu/systemd/user/vibetype-backend.service \
    "$pkgdir/usr/lib/systemd/user/vibetype-backend.service"

  # Install documentation
  install -Dm644 share/doc/vibetype/README.md    "$pkgdir/usr/share/doc/$_pkgbase/README.md"
  install -Dm644 share/doc/vibetype/README.en.md "$pkgdir/usr/share/doc/$_pkgbase/README.en.md"
  install -Dm644 share/doc/vibetype/cli.md       "$pkgdir/usr/share/doc/$_pkgbase/cli.md"
  install -Dm644 share/doc/vibetype/install.md   "$pkgdir/usr/share/doc/$_pkgbase/install.md"
  install -Dm644 share/doc/vibetype/vibetype-spec.md "$pkgdir/usr/share/doc/$_pkgbase/vibetype-spec.md"

  # Install Python client library
  install -Dm644 share/vibetype/python/vibetype_client.py \
    "$pkgdir/usr/share/$_pkgbase/python/vibetype_client.py"
}

package_vibetype-fcitx5() {
  pkgdesc="Voice-to-text input method backend with Fcitx5 frontend"
  depends=('gcc-libs' 'glibc' 'python' 'fcitx5')
  conflicts=("$_pkgbase" "$_pkgbase-ibus")
  provides=("$_pkgbase")

  cd "$srcdir/$_pkgbase-fcitx5"

  # Install binaries
  install -Dm755 bin/vibetype-backend       "$pkgdir/usr/bin/vibetype-backend"
  install -Dm755 bin/vibetype-cli           "$pkgdir/usr/bin/vibetype-cli"
  install -Dm755 bin/vibetype-fcitx5-helper "$pkgdir/usr/bin/vibetype-fcitx5-helper"

  # Install fcitx5 plugin
  install -Dm644 lib/x86_64-linux-gnu/fcitx5/vibetype.so "$pkgdir/usr/lib/fcitx5/vibetype.so"

  # Install fcitx5 config files
  install -Dm644 share/fcitx5/addon/vibetype.conf         "$pkgdir/usr/share/fcitx5/addon/vibetype.conf"
  install -Dm644 share/fcitx5/inputmethod/vibetype-inputmethod.conf \
    "$pkgdir/usr/share/fcitx5/inputmethod/vibetype-inputmethod.conf"

  # Install systemd user service
  install -Dm644 lib/x86_64-linux-gnu/systemd/user/vibetype-backend.service \
    "$pkgdir/usr/lib/systemd/user/vibetype-backend.service"

  # Install documentation
  install -Dm644 share/doc/vibetype/README.md          "$pkgdir/usr/share/doc/$_pkgbase/README.md"
  install -Dm644 share/doc/vibetype/README.en.md       "$pkgdir/usr/share/doc/$_pkgbase/README.en.md"
  install -Dm644 share/doc/vibetype/cli.md             "$pkgdir/usr/share/doc/$_pkgbase/cli.md"
  install -Dm644 share/doc/vibetype/fcitx5-frontend.md "$pkgdir/usr/share/doc/$_pkgbase/fcitx5-frontend.md"
  install -Dm644 share/doc/vibetype/install.md         "$pkgdir/usr/share/doc/$_pkgbase/install.md"
  install -Dm644 share/doc/vibetype/vibetype-spec.md   "$pkgdir/usr/share/doc/$_pkgbase/vibetype-spec.md"

  # Install Python client library
  install -Dm644 share/vibetype/python/vibetype_client.py \
    "$pkgdir/usr/share/$_pkgbase/python/vibetype_client.py"
}

package_vibetype-ibus() {
  pkgdesc="Voice-to-text input method backend with IBus frontend"
  depends=('gcc-libs' 'glibc' 'python' 'ibus' 'python-gobject' 'gtk3')
  conflicts=("$_pkgbase" "$_pkgbase-fcitx5")
  provides=("$_pkgbase")

  cd "$srcdir/$_pkgbase-ibus"

  # Install binaries
  install -Dm755 bin/vibetype-backend "$pkgdir/usr/bin/vibetype-backend"
  install -Dm755 bin/vibetype-cli     "$pkgdir/usr/bin/vibetype-cli"
  install -Dm755 bin/vibetype-ibus    "$pkgdir/usr/bin/vibetype-ibus"

  # Install ibus component config
  install -Dm644 share/ibus/component/vibetype.xml "$pkgdir/usr/share/ibus/component/vibetype.xml"

  # Install systemd user service
  install -Dm644 lib/x86_64-linux-gnu/systemd/user/vibetype-backend.service \
    "$pkgdir/usr/lib/systemd/user/vibetype-backend.service"

  # Install documentation
  install -Dm644 share/doc/vibetype/README.md        "$pkgdir/usr/share/doc/$_pkgbase/README.md"
  install -Dm644 share/doc/vibetype/README.en.md     "$pkgdir/usr/share/doc/$_pkgbase/README.en.md"
  install -Dm644 share/doc/vibetype/cli.md           "$pkgdir/usr/share/doc/$_pkgbase/cli.md"
  install -Dm644 share/doc/vibetype/ibus-frontend.md "$pkgdir/usr/share/doc/$_pkgbase/ibus-frontend.md"
  install -Dm644 share/doc/vibetype/install.md       "$pkgdir/usr/share/doc/$_pkgbase/install.md"
  install -Dm644 share/doc/vibetype/vibetype-spec.md "$pkgdir/usr/share/doc/$_pkgbase/vibetype-spec.md"

  # Install Python client library
  install -Dm644 share/vibetype/python/vibetype_client.py \
    "$pkgdir/usr/share/$_pkgbase/python/vibetype_client.py"
}

# vim: ts=2 sw=2 et:
