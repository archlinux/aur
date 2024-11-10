# -*- sh -*-

#  Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>
# Contributor: éclairevoyant

_pkgname='nimdow'
pkgname="${_pkgname}-git"
pkgver=0.7.40.r1.g29a0cd2
pkgrel=1
pkgdesc='Tiling window manager written in Nim (latest commit)'
arch=('x86_64')
url="https://github.com/avahe-kellenberger/$_pkgname"
license=('GPL-2.0-or-later')
depends=('gcc-libs' 'glibc')
makedepends=('git' 'nim>=1.2.0')
source=("git+$url.git")
sha256sums=('SKIP')
options=('lto')
provides=('nimdow')
conflicts=('nimdow')

_setup() {
  _nimble_dir="$srcdir/nimbleDir"
  _path="$_nimble_dir/bin:$PATH"

  cd "$_pkgname"
}

pkgver() {
  _setup

  git describe --long --tags \
  | sed 's/^v//;s/-rc\d*//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  _setup

  # RFC-0023
  # 🔗 https://rfc.archlinux.page/0023-pack-relative-relocs/
  #
  # ld(1) says: “Supported for i386 and x86-64.”
  case "Z${CARCH:-unknown}" in
    'Zx86_64' | 'Zi386' )
      export LDFLAGS="$LDFLAGS -Wl,-z,pack-relative-relocs"
    ;;
    * ) : pass ;;
  esac

  PATH="$_path" nimble refresh -l
  PATH="$_path" nimble install -d -l
}

build() {
  _setup

  PATH="$_path" nimble install -l --verbose \
    --deepcopy:on \
    --passNim:--passC:"\"$CFLAGS\"" --passNim:--passL:"\"$LDFLAGS\""
}

package() {
  _setup

  install -vDm0755 -t "$pkgdir/usr/bin" \
    nimdow
  install -vDm0644 -t "$pkgdir/usr/share/man/man1" \
    doc/nimdow.1
  install -vDm0644 -t "$pkgdir/usr/share/$_pkgname" \
    config.default.toml
  install -vDm0644 -t "$pkgdir/usr/share/xsessions" \
    nimdow.desktop
  install -vDm0644 -t "$pkgdir/usr/share/doc/$pkgname" \
    README.md
}

# eof
