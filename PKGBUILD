# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Franziskus Kiefer <arch@franziskuskiefer.de>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: kfgz <kfgz at interia pl>
# Contributor: Ionut Biru <ibiru at archlinux dot org>

pkgname=lib32-nss-hg
pkgver=3.60
pkgrel=1
pkgdesc="Network Security Services (32-bit)"
url="https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS"
arch=(x86_64)
license=(MPL GPL)
depends=(lib32-nspr lib32-sqlite lib32-zlib 'lib32-p11-kit')
makedepends=(perl python gyp)
provides=(lib32-nss)
conflicts=(lib32-nss)
source=("hg+https://hg.mozilla.org/projects/nss"
        "0001-Hack-mpi_x64.s-to-work-with-fno-plt.patch")
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  local vmajor vminor vpatch
  cd nss

  { read vmajor; read vminor; read vpatch; } \
  < <(awk '/#define.*NSS_V(MAJOR|MINOR|PATCH)/ {print $3}' lib/nss/nss.h)

  printf "%s.%s.%sr%s.%s" "$vmajor" "$vminor" "$vpatch" "$(hg identify -n)" "$(hg identify -i)"
}

prepare() {
  cd nss

  # https://bugzilla.mozilla.org/show_bug.cgi?id=1382942
  patch -Np1 -i "$srcdir/0001-Hack-mpi_x64.s-to-work-with-fno-plt.patch"
}

build() {
  cd nss
  ./build.sh \
    --target ia32 \
    --opt \
    --system-sqlite \
    --system-nspr \
    --enable-libpkix \
    --disable-tests
}

package() {
  depends+=(nss)

  cd nss

  local libdir=/usr/lib32 nsprver="$(i686-pc-linux-gnu-pkg-config --modversion nspr)"
  sed nss/pkg/pkg-config/nss.pc.in \
    -e "s,%libdir%,$libdir,g" \
    -e "s,%prefix%,/usr,g" \
    -e "s,%exec_prefix%,/usr/bin,g" \
    -e "s,%includedir%,/usr/include/nss,g" \
    -e "s,%NSPR_VERSION%,$nsprver,g" \
    -e "s,%NSS_VERSION%,$pkgver,g" |
    install -Dm644 /dev/stdin "$pkgdir$libdir/pkgconfig/nss.pc"

  ln -s nss.pc "$pkgdir$libdir/pkgconfig/mozilla-nss.pc"

  install -Dt "$pkgdir$libdir" dist/Release/lib/*.so
  install -Dt "$pkgdir$libdir" -m644 dist/Release/lib/*.chk


  # Replace built-in trust with p11-kit connection
  ln -s pkcs11/p11-kit-trust.so "$pkgdir$libdir/p11-kit-trust.so"
  ln -sf p11-kit-trust.so "$pkgdir$libdir/libnssckbi.so"
}

# vim:set sw=2 et:
