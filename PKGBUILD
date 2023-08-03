# Maintainer: Yann Büchau <nobodyinperson at posteo de>
# Contributor: Thomas Jost <schnouki@schnouki.net>
pkgname=git-annex-standalone-nightly-bin
pkgver=10.20230802+gf773a89ee
pkgrel=1
pkgdesc="Manage files with git, without checking their contents into git. Standalone nightly autobuild version, with no Haskell dependency."
arch=(x86_64 aarch64)
url="https://git-annex.branchable.com/"
license=("custom")
depends=("git" "gmp" "libffi" "lsof" "rsync" "sqlite" "zlib" "libyaml")
makedepends=()
replaces=("${pkgname%-bin}")
provides=("git-annex")
conflicts=("git-annex")

# Could use source_ARCH=... here, but that doesn'T help with the potentially differing libffi version across architectures, so I'll leave it like this
case $CARCH in
     x86_64) _arch=amd64;;
    aarch64) 
        _arch=arm64
        # depends+=("libffi7")   # arm64 build might require different libffi
        ;;
    default) _arch=amd64;;
esac

_tarball="git-annex-standalone-${_arch}.tar.gz"
_tarball_url="https://downloads.kitenet.net/git-annex/autobuild/${_arch}/${_tarball}"

source=(
    "git-annex-standalone-${_arch}-$(date +%F).tar.gz::$_tarball_url"
    git-annex.desktop
    git-annex-assistant.desktop
)
sha256sums=(SKIP
            '39c60aea8b8be8bab6639614542de02c4014f43867ee2afe75737f772484178d'
            '85f0ab00bc256cfc2cf37d18296b338022a07ba03c5157d6960e8e427d8353cd')

pkgver() {
  cd "$srcdir/git-annex.linux"
  # Also not cool to execute the target program here to find the version. Don't know how to get the correct version otherwise, though. The 'strings' fallback is not as robust.
  raw_version="$(shimmed/git-annex/git-annex version --raw || (strings shimmed/git-annex/git-annex | grep -Pm1 '\d+\.\d+-g[a-z0-9]{9}'))"
  echo "$raw_version" | sed  's|-|+|g'
}

package() {
  totallyNotStartdir="$(pwd)" # one shouldn't use $startdir...
  cd "$srcdir/git-annex.linux"

  for exe in git-annex git-annex-shell; do
    install -Dm755 shimmed/$exe/$exe "$pkgdir/usr/bin/$exe"
  done

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 logo.svg "$pkgdir/usr/share/pixmaps/git-annex.svg"
  install -Dm644 logo_16x16.png "$pkgdir/usr/share/pixmaps/git-annex_16x16.png"
  install -Dm644 "$totallyNotStartdir"/git-annex.desktop -t "$pkgdir"/usr/share/applications
  install -Dm644 "$totallyNotStartdir"/git-annex-assistant.desktop "$pkgdir"/etc/xdg/autostart/git-annex.desktop

  for f in usr/share/man/man1/*.1; do
    install -Dm644 $f "$pkgdir/$f"
  done
}

# Local Variables:
# pkgbuild-update-sums-on-save: nil
# End:
