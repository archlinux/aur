# Maintainer: Thomas Jost <schnouki@schnouki.net>
pkgname=git-annex-standalone
pkgver=8.20200309
pkgrel=1
pkgdesc="Manage files with git, without checking their contents into git. Standalone version, with no Haskell dependency."
arch=(x86_64)
url="https://git-annex.branchable.com/"
license=('GPL')
depends=("file" "git" "lsof" "rsync" "sqlite")
optdepends=()
provides=("git-annex")
conflicts=("git-annex")
source=("git-annex-standalone-amd64-$pkgver.tar.gz::https://downloads.kitenet.net/git-annex/linux/current/git-annex-standalone-amd64.tar.gz"
        "git-annex-standalone-amd64-$pkgver.tar.gz.sig::https://downloads.kitenet.net/git-annex/linux/current/git-annex-standalone-amd64.tar.gz.sig")
md5sums=('SKIP'
         'SKIP')
_info_source="https://downloads.kitenet.net/git-annex/linux/current/git-annex-standalone-amd64.tar.gz.info"
validpgpkeys=("40055C6AFD2D526B2961E78F5EE1DBA789C809CB")

pkgver() {
  curl "$_info_source" | awk 'NR==4'
}

package() {
  cd "$srcdir/git-annex.linux"

  for lib in libffi.so.7; do
    install -Dm644 usr/lib/x86_64-linux-gnu/$lib "$pkgdir/usr/share/$pkgname/lib/$lib"
  done

  for exe in git-annex git-annex-shell; do
    install -Dm755 shimmed/$exe/$exe "$pkgdir/usr/share/$pkgname/bin/$exe"
    install -d "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/$exe" <<EOF
#!/bin/bash
export LD_LIBRARY_PATH="/usr/share/$pkgname/lib":\$LD_LIBRARY_PATH
exec "/usr/share/$pkgname/bin/$exe" "\$@"
EOF
    chmod +x "$pkgdir/usr/bin/$exe"
  done

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 logo.svg "$pkgdir/usr/share/pixmaps/git-annex.svg"
  install -Dm644 logo_16x16.png "$pkgdir/usr/share/pixmaps/git-annex_16x16.png"

  for f in usr/share/man/man1/*.1; do
    install -Dm644 $f "$pkgdir/$f"
  done
}

# Local Variables:
# pkgbuild-update-sums-on-save: nil
# End:
