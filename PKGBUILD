# Maintainer: eggfriedrice <eggfriedricew.g.o@gmail.com>

# Prebuilt x86_64 release binaries from upstream's GitHub releases, built on the
# GitHub ubuntu-latest runner with Zig 0.16.0 for the ghostty screen backend.
# They link only libc.so.6, libm.so.6 and libgcc_s.so.1 (no RPATH); any current
# Arch glibc satisfies them. The efr-code package builds the same version from source.
pkgname=efr-code-bin
pkgver=0.0.3
pkgrel=1
pkgdesc='Terminal-first AI agent harness that lives in zsh, with a daemon that owns the state'
arch=('x86_64')
url='https://github.com/eggfriedrice24/eggfriedrice.code'
license=('MIT')
depends=('glibc' 'libgcc' 'zsh')
optdepends=('bubblewrap: the kernel sandbox of the auto mode (also needs Linux 7.1 or newer)'
            'git: project roots and the git facts of a turn'
            'xdg-utils: let efr login openai open the browser with EFR_OPEN_BROWSER=1')
provides=("${pkgname%-bin}=$pkgver")
conflicts=("${pkgname%-bin}")
# The same file as packaging/efr-code/efr-code.install.
install=efr-code.install
# The upstream binaries carry no debug info, so a -debug split would be empty.
options=('!debug')
_dist="${pkgname%-bin}-$pkgver-$CARCH-linux"
source_x86_64=("$url/releases/download/v$pkgver/$_dist.tar.gz")
# Filled in for each release by .github/workflows/aur.yml with the value that
# upstream publishes in $_dist.tar.gz.sha256 next to the tarball.
sha256sums_x86_64=('92872bb28cdff0800f2064701b1319271e55f6d1df09ad1a42352228a42a3c78')

package() {
  cd "$_dist"
  install -Dm0755 -t "$pkgdir/usr/bin/" efr efrd
  # efrd finds its sandbox launcher in ../lib/efr/ next to its own directory. It is
  # never on PATH.
  install -Dm0755 -t "$pkgdir/usr/lib/efr/" efr-sbx
  install -Dm0644 -t "$pkgdir/usr/share/zsh/plugins/efr/" shell/zsh/efr.plugin.zsh
  # release.yml already points this unit at /usr/bin/efrd.
  install -Dm0644 -t "$pkgdir/usr/lib/systemd/user/" systemd/efrd.service
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
  install -Dm0644 -t "$pkgdir/usr/share/doc/efr-code/" README.md \
    docs/config.md docs/permissions.md docs/sandbox.md
  install -Dm0644 -t "$pkgdir/usr/share/doc/efr-code/examples/" examples/config.toml
}
