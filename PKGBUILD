# Maintainer: sfs <sfslinux@gmail.com>

pkgname=gftp-smb-git
pkgver=2.9.1b.r53.gf64d27b
pkgrel=1
pkgdesc="Free multithreaded file transfer client, with an SMB/CIFS backend and an updated Russian translation"
arch=('i686' 'x86_64')
url="https://www.gftp.org/"
license=('MIT')
depends=('glibc' 'gtk3' 'libsmb2' 'openssl' 'readline')
makedepends=('git' 'meson')
provides=("gftp=$pkgver" "gftp-git=$pkgver")
conflicts=('gftp' 'gftp-git')
# Both patches ship inside this package repository, so they carry real
# checksums. Do not replace them with SKIP, and do not pull the Russian one
# from the attachment on https://github.com/masneyb/gftp/issues/202 - an
# unverified download would silently change the build on other machines.
source=("git+https://github.com/masneyb/gftp.git"
        'gftp-ru-translation.patch'
        'gftp-cifs.patch'
        'gftp-wayland-icon.patch'
        'gftp-smb-ru.patch'
        'README.ru.md'
        'README.md'
        )
sha256sums=('SKIP'
            '5b957f66ccd1d612d6c99dc343dc5ebec919b32009185e24aa58a6db48d933b4'
            'c023db3bc194760c3282bc2047837be13923d937bb04c72d89d8fa75ccb6dcc7'
            '436e43a77508b7205ef195465061b2492b9b66879c427bf9721885c69620455f'
            '50be56e1831810921775404a85797a7621b3472bd60b01ea5595cc1e51fc52c6'
            '022236af1ba0a3f9e40066b640d8e8b7288355d6ba155f24229107b104a1fdbf'
            '9b1aa7914212e65de1fe8664a586953bce7ee14eedb6b4b9d7ed4b9a46f25eb6'
            )

pkgver() {
  cd "gftp"

  # The trailing [a-z]? is load-bearing: every real gFTP release is tagged
  # 2.9.1b, 2.9.0b, 2.8.0b ... A digits-only filter matches only the 2008 tag
  # 2.0.19 and reports the package as 2.0.19.rNNN instead of 2.9.1b.rNN.
  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9][0-9.]*[a-z]?$' | head -n1)
  _rev=$(git rev-list --count "$_tag"..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

prepare() {
   cd "gftp"
   patch -Np1 -i "$srcdir/gftp-ru-translation.patch"
   patch -Np1 -i "$srcdir/gftp-cifs.patch"
   patch -Np1 -i "$srcdir/gftp-wayland-icon.patch"
   # must come last: it translates strings that gftp-cifs.patch introduces,
   # against the po/ru.po that gftp-ru-translation.patch rewrites
   patch -Np1 -i "$srcdir/gftp-smb-ru.patch"
}


build() {
  cd "gftp"

  meson setup \
    --buildtype=plain \
    --prefix="/usr" \
    --sbindir="bin" \
    -Dgtk2="false" \
    -Dgtk3="true" \
    -Dsmb="true" \
    "_build"
  meson compile -C "_build"
}

package() {
  cd "gftp"

  meson install -C "_build" --destdir "$pkgdir"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 "../README.ru.md" -t "$pkgdir/usr/share/doc/smb"
  install -Dm644 "../README.md" -t "$pkgdir/usr/share/doc/smb"
}
