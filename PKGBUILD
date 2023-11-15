# Maintainer: Thomas Jost <schnouki@schnouki.net>
# Contributor: Yann Büchau <nobodyinperson at posteo de>
pkgname=git-annex-standalone
pkgver=10.20230926
pkgrel=1
pkgdesc="Manage files with git, without checking their contents into git. Standalone version, with no Haskell dependency."
arch=(x86_64 aarch64)
url="https://git-annex.branchable.com/"
license=('GPL')
depends=("bzip2" "file" "git" "gmp" "libffi" "libyaml" "lsof" "rsync" "sqlite" "xz" "zlib")
depends_aarch64=("libffi7")
provides=("git-annex")
conflicts=("git-annex")

# Fetch info about the last release before setting the source URL
_info_source_x86_64="https://downloads.kitenet.net/git-annex/linux/current/git-annex-standalone-amd64.tar.gz.info"
_last_info_x86_64=$(curl -s "${_info_source_x86_64}")
_last_sha256_x86_64=$(echo "${_last_info_x86_64}" | awk 'NR==3' | cut -d- -f 4 | cut -d. -f1)
_info_source_aarch64="https://downloads.kitenet.net/git-annex/linux/current/git-annex-standalone-arm64.tar.gz.info"
_last_info_aarch64=$(curl -s "${_info_source_aarch64}")
_last_sha256_aarch64=$(echo "${_last_info_aarch64}" | awk 'NR==3' | cut -d- -f 4 | cut -d. -f1)

_last_pkgver=$(echo "${_last_info_x86_64}" | awk 'NR==4')

source_x86_64=("git-annex-standalone-amd64-${_last_pkgver}.tar.gz::https://downloads.kitenet.net/git-annex/linux/current/git-annex-standalone-amd64.tar.gz"
               "git-annex-standalone-amd64-${_last_pkgver}.tar.gz.sig::https://downloads.kitenet.net/git-annex/linux/current/git-annex-standalone-amd64.tar.gz.sig")
source_aarch64=("git-annex-standalone-arm64-${_last_pkgver}.tar.gz::https://downloads.kitenet.net/git-annex/linux/current/git-annex-standalone-arm64.tar.gz"
               "git-annex-standalone-arm64-${_last_pkgver}.tar.gz.sig::https://downloads.kitenet.net/git-annex/linux/current/git-annex-standalone-arm64.tar.gz.sig")
sha256sums_x86_64=("${_last_sha256_x86_64}"
                   'SKIP')
sha256sums_aarch64=("${_last_sha256_aarch64}"
                   'SKIP')
validpgpkeys=("40055C6AFD2D526B2961E78F5EE1DBA789C809CB")

pkgver() {
  echo "${_last_pkgver}"
}

package() {
  cd "$srcdir/git-annex.linux"

  for exe in git-annex git-annex-shell; do
    install -Dm755 shimmed/$exe/$exe "$pkgdir/usr/bin/$exe"
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
