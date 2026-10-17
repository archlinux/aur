# Maintainer: Aaron Esau <git at aaronesau dot com>
#
# Repackages the static musl release tarball: no runtime dependencies. fsblame needs
# Linux >= 5.17 with BTF and CAP_BPF + CAP_PERFMON (sudo, or setcap); see the README.
# fsblame-record.service is installed but not enabled: set FSBLAME_PATHS in
# /etc/default/fsblame, then `systemctl enable --now fsblame-record`.

pkgname=fsblame-bin
_pkgname=fsblame
pkgver=0.1.1
pkgrel=1
pkgdesc="Which command changed this file? Live eBPF attribution of file changes to the full process lineage"
arch=(x86_64 aarch64)
url=https://github.com/Arinerron/fsblame
license=(MIT)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
backup=(etc/default/fsblame)
options=(!debug)
source_x86_64=("$url/releases/download/v$pkgver/$_pkgname-v$pkgver-x86_64-linux-musl.tar.gz")
source_aarch64=("$url/releases/download/v$pkgver/$_pkgname-v$pkgver-aarch64-linux-musl.tar.gz")
sha256sums_x86_64=('ffcfa0630fa4eeddeedecffeaad2954a1cfd341d1de4722e52d488b313a1535d')
sha256sums_aarch64=('32b86075d8853860d84ab8b0201894ca9e52bad0f8c4414a04a261bab8eb28f6')

package() {
  cd "$_pkgname-v$pkgver-$CARCH-linux-musl"
  install -Dm755 fsblame -t "$pkgdir/usr/bin"
  install -Dm644 man/*.1 -t "$pkgdir/usr/share/man/man1"
  install -Dm644 completions/fsblame.bash "$pkgdir/usr/share/bash-completion/completions/fsblame"
  install -Dm644 completions/_fsblame -t "$pkgdir/usr/share/zsh/site-functions"
  install -Dm644 completions/fsblame.fish -t "$pkgdir/usr/share/fish/vendor_completions.d"
  # The unit runs /usr/local/bin/fsblame, the README's path for a tarball install.
  sed '/^ExecStart=/s|/usr/local/bin/fsblame|/usr/bin/fsblame|' systemd/fsblame-record.service |
    install -Dm644 /dev/stdin "$pkgdir/usr/lib/systemd/system/fsblame-record.service"
  install -Dm644 systemd/fsblame.default "$pkgdir/etc/default/fsblame"
  install -Dm644 LICENSE THIRD_PARTY_LICENSES.md -t "$pkgdir/usr/share/licenses/$pkgname"
}
