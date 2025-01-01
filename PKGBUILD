# Maintainer:  HoleHolo <hola0_o@qq.com>
# Contributor: Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: carstene1ns <url/mail: arch carsten-teibes de>
# Contributor: josephgbr <rafael.f.f1@gmail.com>
# Contributor: Josef Lusticky <evramp@gmail.com>
# Contributor: Jorge Barroso <jorge.barroso.11 at gmail dot com>
# Contributor: Moses Miller <Majora320@gmail.com>

pkgname=counter-strike-2d-wine
pkgver=1.0.1.4
_ver=${pkgver//./}
pkgrel=4
pkgdesc="More than just a freeware clone of the well known game Counter-Strike"
arch=('i686' 'x86_64')
url="https://www.unrealsoftware.de"
license=('custom')
conflicts=('counter-strike-2d')
install=cs2d.install
if [ "$CARCH" == "x86_64" ]; then
  depends=('wine') # Since this game requires an older environment and cannot run natively on Arch Linux, using Wine could be a better choice.
  optdepends=('lib32-nvidia-utils: video acceleration for NVIDIA GPUs'
              'lib32-mesa: video acceleration')
elif [ "$CARCH" == "i686" ]; then
  optdepends=('ati-dri: video acceleration'
              'intel-dri: video acceleration'
              'nouveau-dri: video acceleration')
fi

makedepends=('curl')
backup=(opt/cs2d/sys/autobuy.cfg    opt/cs2d/sys/autoexec.cfg
        opt/cs2d/sys/config.cfg     opt/cs2d/sys/controls.cfg
        opt/cs2d/sys/editor.cfg     opt/cs2d/sys/filters.cfg
        opt/cs2d/sys/mapcycle.cfg   opt/cs2d/sys/mods.cfg 
        opt/cs2d/sys/more.cfg       opt/cs2d/sys/server.cfg 
        opt/cs2d/sys/weapons.cfg    opt/cs2d/sys/weapons_recoil.cfg
        opt/cs2d/sys/favorites.lst  opt/cs2d/sys/bans.lst 
        opt/cs2d/sys/serverinfo.txt opt/cs2d/sys/servertransfer.lst
        opt/cs2d/sys/usgn_upw       opt/cs2d/sys/core/dls.cache)
sha512sums=('c89b74392a5da2a007509c0a72a0c6a47a6e79d6819fb62ec04e597d6abc03d7146900c149dc6b4e0b535f2d28e400371331cdbaad4c7b1d80f013660c0c8547'
            'b31b14cb97fcfef718dd2e15fe3d50cecbf875d1d71c794f0568491e497ddc7efad56749d5d4fc34ec1c645e670b9a6a72e4f893b50f0b5e01d5e3baeb0803db'
            '0c7c91ad4050543635e56ce0ecd9b55e5dc917c87655c69e0dc7e4252655223b7346106f54f2a550e09952cb0ec8afaedfab8dd3b18324b545485ba4fd4b07a4')
_url="https://www.unrealsoftware.de/get.php?get"

grabcid() {
  local file=cs2d_${_ver}_win.zip
  echo "$(curl -Ss "$_url=${file}&p=1" | sed -n 's/.*cid=\([0-9]\+\).*/\1/p' | head -n 1)"
}

_cid=$(grabcid) # this will hide the cmd line above from AUR interface
source=(cs2d_${_ver}_win.zip::"${_url}=cs2d_${_ver}_win.zip&p=1&cid=${_cid}"
        "cs2d.desktop"
        "cs2d.png")
options=(emptydirs)

package() {
  # create folders
  install -d "$pkgdir"/{opt/cs2d/wineprefix,usr/{share/{doc,licenses}/$pkgname,bin}}

  # data
  cp -R bots gfx help logos maps mods screens sfx sys "$pkgdir"/opt/cs2d

  # executable
  install CS2D.exe *.dll "$pkgdir"/opt/cs2d
  cat > "$pkgdir/usr/bin/cs2d" <<EOF
#!/bin/bash
USERDIR="/opt/cs2d/wineprefix/\$(whoami)"
mkdir -p \$USERDIR
WINEPREFIX=\$USERDIR wine /opt/cs2d/CS2D.exe
EOF
  chmod +x $pkgdir/usr/bin/cs2d $pkgdir/opt/cs2d/wineprefix

  # desktop launcher
  install -Dm644 cs2d.png "$pkgdir"/usr/share/pixmaps/cs2d.png
  install -Dm644 cs2d.desktop "$pkgdir"/usr/share/applications/cs2d.desktop

  # license
  sed -n 93,117p Readme.txt > "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

  # doc
  install -m644 *.txt "$pkgdir"/usr/share/doc/$pkgname

  # custom
  chmod g+w -R "$pkgdir"/opt/cs2d/{maps,mods,gfx,sys}
  chgrp games -R "$pkgdir"/opt/cs2d/{maps,mods,gfx,sys}

  # allow updating wine runtime directory
  chmod g+w "$pkgdir"/opt/cs2d/wineprefix
  chgrp games -R "$pkgdir"/opt/cs2d/wineprefix

  # allow saving u.s.g.n. password
  touch "$pkgdir"/opt/cs2d/sys/usgn_upw
  chmod g+w "$pkgdir"/opt/cs2d/sys/usgn_upw
  chgrp games "$pkgdir"/opt/cs2d/sys/usgn_upw
}
