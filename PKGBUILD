# shellcheck disable=SC2034 # unused var
# shellcheck disable=SC2164 # cd might fail
# Maintainer: Štěpán Němec <stepnem@smrk.net>

pkgname=exman
pkgver=2065.05
pkgrel=1
pkgdesc="manuals for other systems"
arch=(any)
url="https://git.causal.agency/$pkgname"
license=(ISC)
depends=(man sh)
makedepends=(bmake git)
source=("https://git.causal.agency/$pkgname/snapshot/$pkgname-$pkgver.tar.gz")
sha256sums=('31ac2be6fdf77efee2564e26752283002b8ee8a56f6b934a7fc46a55c5c1779f')
# zipman autocompression took 40m(!?) on my machine (4-core i7),
# parallelized and all (compared to ~20s with the custom package()
# below)
# the other options prevent searching for stuff that doesn't exist,
# leading to further speedup
options=(libtool staticlibs !strip !zipman)

prepare() {
  cd "$pkgname-$pkgver"
  # these two are better obtained via the 'man-pages' package, exclude
  # them
  sed -i -e '/^SYSTEMS += \(Linux\|POSIX\)/d' Makefile
}

build() {
  cd "$pkgname-$pkgver"
  bmake PREFIX=/usr TAR=bsdtar
}

package() {
  cd "$pkgname-$pkgver"
  # shellcheck disable=SC2154
  bmake DESTDIR="$pkgdir"/ PREFIX=/usr TAR=bsdtar install

  find "$pkgdir" -empty -delete

  # macOS ships two perl(1) man pages...?
  if [[ -f "$pkgdir"/usr/share/exman/macOS/man1/perl.1.gz &&
          -f "$pkgdir"/usr/share/exman/macOS/man1/perl.1 ]]; then
    echo 'Removing stray macOS perl.1 man page...'
    rm "$pkgdir"/usr/share/exman/macOS/man1/perl.1.gz
    echo 'Removing stray macOS perl.1 man page...done'
  fi

  echo 'Compressing uncompressed man pages...'
  find "$pkgdir"/usr/share/{,ex}man -type f ! -name '*.gz' \
       -exec gzip --best '{}' + 2>&1 | tee log
  echo 'Compressing uncompressed man pages...done'

  # gzip (still) can't handle links...?
  # cf. e.g. http://www.argon.org/~roderick/gzip-links
  echo 'Compressing and fixing multiply (hard-)linked files...'
  local -a sources
  local inode path sOurce
  sed -ne 's/^gzip: \(.*\) has [^ ]\{1,\} other link.*$/\1/p' log |
    while IFS= read -r path; do
      inode=$(stat --printf='%i' "$path")
      sOurce=${sources[$inode]}
      if [[ -n "$sOurce" ]]; then
        # we've already compressed one of the links; just link to it
        # from the other path(s)
        ln "$sOurce" "$path".gz
        rm "$path"
      elif gzip --best --force "$path"; then
        sources[$inode]=$path.gz
      else
        printf 'WARNING: failed to compress %s\n' "$path"
      fi
    done
  echo 'Compressing and fixing multiply (hard-)linked files...done'

  echo 'Fixing symbolic links...'
  # re-link to the newly compressed targets
  find "$pkgdir"/usr/share/{,ex}man -xtype l -exec \
       sh -c 'ln -sf "$(readlink "$1")".gz "$1".gz && rm "$1"' sh {} \;
  echo 'Fixing symbolic links...done'

  install -dm755 "$pkgdir"/usr/share/licenses/"$pkgname"
  sed -ne '/^# Copyright (C) /,/^# PERFORMANCE OF THIS / p' exman.in \
      >"$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE

  chown -R root:root "$pkgdir"
}
