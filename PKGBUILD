# Maintainer: Yakov Till <yakov.till@gmail.com>
# Contributor: HoleHolo <hola0_o@qq.com>
# Contributor: Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: carstene1ns <url/mail: arch carsten-teibes de>
# Contributor: josephgbr <rafael.f.f1@gmail.com>
# Contributor: Josef Lusticky <evramp@gmail.com>
# Contributor: Jorge Barroso <jorge.barroso.11 at gmail dot com>
# Contributor: Moses Miller <Majora320@gmail.com>

pkgname=counter-strike-2d
pkgver=1.0.1.6
_ver=${pkgver//./}
pkgrel=4
pkgdesc="More than just a freeware clone of the well known game Counter-Strike"
arch=('i686' 'x86_64')
url="https://www.unrealsoftware.de"
license=('custom')
install=cs2d.install
depends=('freetype2' 'libx11' 'libxxf86vm' 'libglvnd' 'gcc-libs' 'glibc')
optdepends=('openal: audio output'
            'libpulse: audio output'
            'alsa-lib: audio output'
            'steam: Steam client integration')

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
sha512sums=('46a6210983ecca33cd0a406c7f5301a310f2d436601474e87e994f77ff7d16b0c4b1f5af0ee5cf903f79dbb52486f8894db984a13ab84096e3d92b3cd680c7ff'
            'b31b14cb97fcfef718dd2e15fe3d50cecbf875d1d71c794f0568491e497ddc7efad56749d5d4fc34ec1c645e670b9a6a72e4f893b50f0b5e01d5e3baeb0803db'
            '0c7c91ad4050543635e56ce0ecd9b55e5dc917c87655c69e0dc7e4252655223b7346106f54f2a550e09952cb0ec8afaedfab8dd3b18324b545485ba4fd4b07a4')
sha512sums_x86_64=('42b0e05c2fefad24b79dbfe4ff99e80278717d5351624650a9b10a859dd33b591e759f1ee813ba9aebb84449e29267f72c53ac75d78765541b2239f80c04dd95')
_url="https://www.unrealsoftware.de/get.php?get"

grabcid() {
  local file=cs2d_${_ver}_linux.zip
  echo "$(curl -Ss "$_url=${file}&p=1" | sed -n 's/.*cid=\([0-9]\+\).*/\1/p' | head -n 1)"
}

_cid=$(grabcid) # this will hide the cmd line above from AUR interface
source=(cs2d_${_ver}_linux.zip::"${_url}=cs2d_${_ver}_linux.zip&p=1&cid=${_cid}"
        "cs2d.desktop"
        "cs2d.png")
# 64-bit build overlays the 32-bit release; both zips ship libsteam_api.so,
# so keep it out of $srcdir and extract to its own directory
source_x86_64=(cs2d_linux_64.zip::"https://stuff.unrealsoftware.de/cs2d_linux_64.zip")
noextract=(cs2d_linux_64.zip)
options=(emptydirs !debug)

prepare() {
  if [ "$CARCH" == "x86_64" ]; then
    rm -rf cs2d64
    mkdir cs2d64
    bsdtar -xf cs2d_linux_64.zip -C cs2d64
  fi
}

package() {
  # create folders
  install -d "$pkgdir"/{opt/cs2d,usr/{share/{doc,licenses}/$pkgname,bin}}

  # data
  cp -R bots gfx help logos maps mods screens sfx sys "$pkgdir"/opt/cs2d

  # executables + Steam API runtime
  if [ "$CARCH" == "x86_64" ]; then
    install -m755 cs2d64/CS2D64 "$pkgdir"/opt/cs2d/CS2D
    install -m755 cs2d64/cs2d_dedicated64 "$pkgdir"/opt/cs2d/cs2d_dedicated
    install -m644 cs2d64/libsteam_api.so "$pkgdir"/opt/cs2d
  else
    install -m755 CS2D "$pkgdir"/opt/cs2d
    install -m644 libsteam_api.so "$pkgdir"/opt/cs2d
  fi

  # launchers
  printf '%s\n' '#!/bin/sh' 'exec env LD_LIBRARY_PATH=/opt/cs2d /opt/cs2d/CS2D "$@"' \
    > "$pkgdir"/usr/bin/cs2d
  chmod 755 "$pkgdir"/usr/bin/cs2d
  if [ "$CARCH" == "x86_64" ]; then
    printf '%s\n' '#!/bin/sh' 'exec env LD_LIBRARY_PATH=/opt/cs2d /opt/cs2d/cs2d_dedicated "$@"' \
      > "$pkgdir"/usr/bin/cs2d-dedicated
    chmod 755 "$pkgdir"/usr/bin/cs2d-dedicated
  fi


  # desktop launcher
  install -Dm644 cs2d.png "$pkgdir"/usr/share/pixmaps/cs2d.png
  install -Dm644 cs2d.desktop "$pkgdir"/usr/share/applications/cs2d.desktop

  # license
  sed -n 93,117p Readme.txt > "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

  # doc
  install -m644 *.txt "$pkgdir"/usr/share/doc/$pkgname

  # custom
  chmod g+w -R "$pkgdir"/opt/cs2d/{maps,mods,gfx,sfx,sys}
  chgrp games -R "$pkgdir"/opt/cs2d/{maps,mods,gfx,sfx,sys}

  # allow saving u.s.g.n. password
  touch "$pkgdir"/opt/cs2d/sys/usgn_upw
  chmod g+w "$pkgdir"/opt/cs2d/sys/usgn_upw
  chgrp games "$pkgdir"/opt/cs2d/sys/usgn_upw
}
