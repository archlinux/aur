# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# -*- sh -*-

pkgname='slxfig-snapshot'
_pkgname="${pkgname%-snapshot}"
_pkgver='0.2.0-137'
_prever="pre$_pkgver"
pkgver="${_pkgver/-/.}"
pkgrel='3'
pkgdesc='Xfig-based publication quality plotting package for the S-Lang interpreter (development snapshot)'
arch=('aarch64' 'x86_64')
url='https://jedsoft.org/snapshots/'
license=('GPL')
depends=('glibc' 'slang')
provides=('slxfig')
conflicts=('slxfig')
options=('lto' '!makeflags')
source=("${url}${_pkgname}-$_prever.tar.gz")
md5sums=('46775f193f6ad206e554176b23a13c1c')               # Taken from $url
validpgpkeys=('AE962A02D29BFE4A4BB2805FDE401E0D5873000A')  # John E. Davis
changelog="$pkgname.changelog"

build() {
  cd "$_pkgname-$_prever"

  # RFC-0023
  # 🔗 https://rfc.archlinux.page/0023-pack-relative-relocs/
  #
  # ld(1) says: “Supported for i386 and x86-64.”
  case "${CARCH:-unknown}" in
    'x86_64' | 'i386' )
      export LDFLAGS="$LDFLAGS -Wl,-z,pack-relative-relocs"
    ;;
    * ) : pass ;;
  esac

  ./configure --prefix=/usr
  make
}

package() {
  cd "$_pkgname-$_prever"

  make DESTDIR="$pkgdir" install
  # Change permissions of the gcontour module: 0644 → 0755
  chmod 0755 "$pkgdir/usr/lib/slang/v2/modules/gcontour-module.so"

  # Install extra documentation
  for _doc in changes.txt INSTALL README TODO doc/text/slxfig.txt; do
    install -Dm0644 "$_doc" "$pkgdir/usr/share/doc/$pkgname/${_doc##*/}"
  done
  cp -fax examples "$pkgdir/usr/share/doc/$pkgname/"
}

sha256sums=(
  '8c75f674f57cd190e1d7ac8f02f90ea02acddc865b0f6cd5cf35f3d03de18084'
)
b2sums=(
  '688b46643506e86e537592c5b3a4a471014a70c46f0ea4c063cfe5a083283751008bbb48e60c96d0762b7140f74f437f8463adeb91d0772c68bfdacf5908a422'
)

# eof
