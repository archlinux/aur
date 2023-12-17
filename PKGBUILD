# Maintainer:
# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Franziskus Kiefer <franziskuskiefer@gmail.com>

_pkgname="nss"
pkgname="$_pkgname-hg"
pkgver=3.96beta1.r0.g0bef0903c5cb
pkgrel=1
pkgdesc="Network Security Services"
url="https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS"
license=('MPL-2.0')
arch=(x86_64)

_pacver_nspr=$(
  LANG=C LC_ALL=C pacman -Qi nspr \
    | grep -Po '^Version\s*: \K.+' \
    | sed -E 's/-[0-9.]+$//'
)
_pacver_p11kit=$(
  LANG=C LC_ALL=C pacman -Qi p11-kit \
    | grep -Po '^Version\s*: \K.+' \
    | sed -E 's/-[0-9.]+$//'
)

depends=(
  "nspr>=${_pacver_nspr%%.r*}"
  "p11-kit>=${_pacver_p11kit%%.r*}"
  sh
  sqlite
  zlib
)
makedepends=(
  gyp
  mercurial
  perl
  python
)

provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"hg+https://hg.mozilla.org/projects/nss")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  hg log -r . --template '{latesttag}.r{latesttagdistance}.g{node|short}\n' \
    | sed 's/^[a-zA-Z_]*//;s/_RTM//;s/_\([a-zA-Z][a-zA-Z0-9]\+\)/\1/;s/_/./g' \
    | tr '[:upper:]' '[:lower:]'
}

build() {
  local buildsh_options=(
    --disable-tests
    --enable-libpkix
    --opt
    --system-nspr
    --system-sqlite
    --target x64
  )

  cd "$_pkgsrc"
  ./build.sh "${buildsh_options[@]}"
}

package() {
  local nsprver="$(pkg-config --modversion nspr)"
  local libdir=/usr/lib includedir="/usr/include/$_pkgname"

  sed "$_pkgsrc"/pkg/pkg-config/nss.pc.in \
    -e "s,%prefix%,/usr,g" \
    -e "s,%exec_prefix%,\${prefix},g" \
    -e "s,%libdir%,$libdir,g" \
    -e "s,%includedir%,$includedir,g" \
    -e "s,%NSPR_VERSION%,$nsprver,g" \
    -e "s,%NSS_VERSION%,${pkgver%.r*},g" \
    | install -Dm644 /dev/stdin "$pkgdir$libdir/pkgconfig/nss.pc"

  ln -s nss.pc "$pkgdir$libdir/pkgconfig/mozilla-nss.pc"

  install -Dt "$pkgdir$libdir" dist/Release/lib/*.so

  local vmajor vminor vpatch
  { read vmajor; read vminor; read vpatch; } \
    < <(awk '/#define.*NSS_V(MAJOR|MINOR|PATCH)/ {print $3}' "$_pkgsrc"/lib/nss/nss.h)

  sed "$_pkgsrc"/pkg/pkg-config/nss-config.in \
    -e "s,@prefix@,/usr,g" \
    -e "s,@exec_prefix@,/usr,g" \
    -e "s,@libdir@,$libdir,g" \
    -e "s,@includedir@,$includedir,g" \
    -e "s,@MOD_MAJOR_VERSION@,$vmajor,g" \
    -e "s,@MOD_MINOR_VERSION@,$vminor,g" \
    -e "s,@MOD_PATCH_VERSION@,$vpatch,g" \
    | install -D /dev/stdin "$pkgdir/usr/bin/nss-config"

  install -D dist/Release/bin/{*util,shlibsign,signtool,signver,ssltap} \
    -t "$pkgdir/usr/bin"

  install -Dm644 dist/public/nss/*.h \
    -t "$pkgdir$includedir"

  install -Dm644 nss/doc/nroff/{*util,signtool,signver,ssltap}.1 \
    -t "$pkgdir/usr/share/man/man1"

  # Replace built-in trust with p11-kit connection
  ln -s pkcs11/p11-kit-trust.so "$pkgdir$libdir/p11-kit-trust.so"
  ln -sf p11-kit-trust.so "$pkgdir$libdir/libnssckbi.so"
}
