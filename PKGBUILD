# Maintainer: FirstAirBender <noblechuk5 [at] web [dot] de>
# Contributor: Jean Lucas <jean@4ray.co>
# Contributor: Pieter Goetschalckx <3.14.e.ter [at] gmail [dot] com>
# Contributor: Eric Engestrom <aur [at] engestrom [dot] ch>
# Contributor: Attila Bukor <r1pp3rj4ck [at] w4it [dot] eu>

# https://jlk.fjfi.cvut.cz/arch/manpages/man/PKGBUILD.5
pkgname=popcorntime-git
pkgver=v0.4.0+r6485+g597a9871
pkgrel=1
pkgdesc='Popcorn Time is a multi-platform, free software BitTorrent client that includes an integrated media player.'
arch=(i686 x86_64)
url=https://popcorntime.app
license=(GPL3)
depends=(gtk3 libxss nss nodejs)
makedepends=(git yarn npm)
provides=(popcorntime)
conflicts=(popcorntime popcorntime-bin)
options=(!emptydirs)
source=(git+https://github.com/popcorn-official/popcorn-desktop#branch=development
        popcorntime.desktop)
sha512sums=('SKIP'
            '81a447cd3365b439964c1b9eba14bcf31de05e62123ce032590ac2109a447c5db0306bf4c593fe30f075d2b3674a1611a81b7554e43acba152ef34652c819a33')

pkgver() {
  cd popcorn-desktop
  echo "$(git describe --abbrev=0)+r$(git rev-list --count HEAD)+g$(git rev-parse --short HEAD)"
}

build() {
  cd popcorn-desktop
  yarn config set yarn-offline-mirror ./node_modules/
  yarn install --ignore-engines
  yarn build
}

# https://wiki.archlinux.org/index.php/creating_packages
package() {
  cd popcorn-desktop

  install -d "$pkgdir"/usr/{share,bin}

  cp -a build/Popcorn-Time/$([ $CARCH = x86_64 ] && echo linux64 || echo linux32) \
    "$pkgdir/usr/share/popcorntime"

  # Fix file permissions
  find "$pkgdir/usr/share/popcorntime" -type f -not -name 'Popcorn-Time' -exec chmod 644 {} +
  find "$pkgdir/usr/share/popcorntime" -type d -exec chmod 755 {} +

  # Symlink binary to /usr/bin/popcorntime
  # See: https://bbs.archlinux.org/viewtopic.php?id=143970
  ln -sv /usr/share/popcorntime/Popcorn-Time "$pkgdir/usr/bin/popcorntime"

  install -Dm 644 "$srcdir/popcorntime.desktop" -t "$pkgdir/usr/share/applications"
  install -Dm 644 src/app/images/icon.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/popcorntime.png"
}
