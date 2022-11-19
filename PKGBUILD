# Maintainer: AntiCompositeNumber <anticompositenumber@gmail.com>
# Contributor: Laurent Carlier <lordheavym@gmail.com>
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Chris Brannon <cmbrannon79@gmail.com>
# Contributor: Abhishek Dasgupta <abhidg@gmail.com>
# Contributor: SmackleFunky <smacklefunky@optusnet.com.au>

pkgname=bsd-games2
pkgver=2.17
pkgrel=19
pkgdesc='Linux port of the collection of BSD command line games, "junk pile" included'
url='https://ibiblio.org/pub/linux/games/'
arch=('x86_64')
install="$pkgname.install"
license=('BSD')
depends=('gcc-libs' 'words' 'sh')
makedepends=('flex' 'bison' 'm4')
provides=('bsd-games')
conflicts=('bsd-games')
source=(
  "$pkgname-$pkgver.tar.gz::https://www.ibiblio.org/pub/linux/games/bsd-games-$pkgver.tar.gz"
  config.params 
  stdio.h.diff 
  gamescreen.h.diff 
  getline.diff
  number.c.diff 
  bsd-games-2.17-64bit.patch
  bad-ntohl-cast.diff null-check.diff)
md5sums=('238a38a3a017ca9b216fc42bde405639'
         '0d11fba067dafb30425dac49ad454df1'
         '784f68c796b9e099ac008aecef1af998'
         '9c0fa6e2345bd0a7945c9a41d5ba68aa'
         '5356bd6999ae53dd27cb2a0f837a3e70'
         '47249a90f38ccb4dd07625b245bbc728'
         '257813b76a41c8b2c02701571c804227'
         '3d21a9dad2e603ddf3842972e4ff85a1'
         'a43ca0b4b9ebc4eec26372c52014ac0a')

prepare() {
  cd "bsd-games-$pkgver"

  [ "$CARCH" = "x86_64" ] && patch -p1 < "$srcdir/bsd-games-2.17-64bit.patch"
  cp "${srcdir}/config.params" .

  # Several games use their own internal functions named getline.  All
  # are different, and none is the getline from glibc.  So we need a patch
  # in order to compile.  Each internal getline function is prefixed
  # with the name of the game.  -- Chris Brannon
  patch -p1 -i "${srcdir}/getline.diff"

  patch -p1 -i "${srcdir}/stdio.h.diff"
  patch -p1 -i "${srcdir}/gamescreen.h.diff"

  # Incorporated some fixes from Debian
  patch -p1 -i "${srcdir}/number.c.diff"
  # ntohl returns uint32_t, not unsigned long:
  patch -p1 -i "${srcdir}/bad-ntohl-cast.diff"
  # And add a NULL pointer check to the "hunt" program, fixing a segfault.
  patch -p1 -i "${srcdir}/null-check.diff"

  sed -i "s/FISH/GO-FISH/g; s/\.Nm fish/\.Nm go-fish/g" fish/fish.6
  sed -i "s/tenths/tenth/g" tests/number.-0.1
  sed -i "s/Elegy{ Written in a Country Church{-| }Yard:/Elegy{ Written in a Country Church{-| }Yard}:/g" \
     quiz/datfiles/poetry
  sed -i "s/\.tI friend/\.It friend/g" hunt/hunt/hunt.6.in
  sed -i "s/it\'s initial/its initial/g" backgammon/teachgammon/ttext1.c
  sed -i "s/two player\'s/two players/g" backgammon/teachgammon/ttext2.c
  sed -i  "s/\.I range/\.It range/g" arithmetic/arithmetic.6
  sed -i "s/game were the/game where the/g" gomoku/gomoku.6

  # The wargames script expects binaries in /usr/games, and this
  # path is hard-coded.
  # Prior to release 2.17-10 of the ArchLinux package, wargames was
  # broken, since binaries are in /usr/bin instead.
  sed -i -e 's|/usr/games|/usr/bin|g' wargames/wargames


  # Use CFLAGS from makepkg instead.
  # -Werror=format-security had to be disabled because this code was written
  # back when printf was cool and security hadn't been invented yet.
  echo "bsd_games_cfg_other_cflags='${CFLAGS} -Wno-error=format-security'" >> config.params
}

build() {
  cd "bsd-games-$pkgver"

  ./configure
  make
}

package() {
  cd "bsd-games-$pkgver"

  sed -i "s%PKGDIR%$pkgdir%g" hide-game install-man install-score Makeconfig subst.sed
  make install
  # This make install command does install to $pkgdir, because of the
  # change to config.params in the build function.

  # Fix permissions
  rmdir "${pkgdir}/tmp"
  install -dm755  "${pkgdir}/usr/share/bsdgames/data/hack/save"
  chown -R root:games "${pkgdir}/var/lib/bsdgames"
  chmod 664 "${pkgdir}"/var/lib/bsdgames/*
  chmod 664 "${pkgdir}"/var/lib/bsdgames/{hack,phantasia}/*
  chmod 775 "${pkgdir}"/var/lib/bsdgames/{hack,phantasia}

  # Remove conflict with xscreensaver and fish
  mv "${pkgdir}/usr/bin/fish" "${pkgdir}/usr/bin/go-fish"
  mv "${pkgdir}/usr/share/man/man6/fish.6.gz" "${pkgdir}/usr/share/man/man6/go-fish.6.gz"
  mv "${pkgdir}/usr/share/man/man6/worm.6.gz" \
    "${pkgdir}/usr/share/man/man6/worm-game.6.gz"

  # Install documentation and license
  install -dm755 "$pkgdir/usr/share/doc/bsd-games"
  install -m644 AUTHORS NEWS BUGS ChangeLog "$pkgdir/usr/share/doc/bsd-games" \

  rm "${pkgdir}/usr/share/doc/trek.me"
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/bsd-games/COPYING"
}

# vim:set ts=2 sw=2 et:
