# Maintainer:  Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: carstene1ns <url/mail: arch carsten-teibes de>
# Contributor: josephgbr <rafael.f.f1@gmail.com>
# Contributor: Josef Lusticky <evramp@gmail.com>
# Contributor: Jorge Barroso <jorge.barroso.11 at gmail dot com>
# Contributor: Moses Miller <Majora320@gmail.com>

pkgname=counter-strike-2d
pkgver=1.0.1.1
_ver=${pkgver//./}
pkgrel=1
pkgdesc="More than just a freeware clone of the well known game Counter-Strike"
arch=('i686' 'x86_64')
url="https://www.unrealsoftware.de"
license=('custom')
if [ "$CARCH" == "x86_64" ]; then
  depends=('lib32-freetype2' 'lib32-libtxc_dxtn' 'lib32-glu')
  optdepends=('lib32-openal: audio output'
              'lib32-ati-dri: video acceleration'
              'lib32-intel-dri: video acceleration'
              'lib32-nouveau-dri: video acceleration')
elif [ "$CARCH" == "i686" ]; then
  depends=('freetype2' 'libtxc_dxtn' 'glu')
  optdepends=('openal: audio output'
              'ati-dri: video acceleration'
              'intel-dri: video acceleration'
              'nouveau-dri: video acceleration')
fi

makedepends=('curl')
install=cs2d.install
backup=(opt/cs2d/sys/autobuy.cfg    opt/cs2d/sys/autoexec.cfg
        opt/cs2d/sys/config.cfg     opt/cs2d/sys/controls.cfg
        opt/cs2d/sys/editor.cfg     opt/cs2d/sys/filters.cfg
        opt/cs2d/sys/mapcycle.cfg   opt/cs2d/sys/mods.cfg 
        opt/cs2d/sys/more.cfg       opt/cs2d/sys/server.cfg 
        opt/cs2d/sys/weapons.cfg    opt/cs2d/sys/weapons_recoil.cfg
        opt/cs2d/sys/favorites.lst  opt/cs2d/sys/bans.lst 
        opt/cs2d/sys/serverinfo.txt opt/cs2d/sys/servertransfer.lst)
sha512sums=('ae69edb5ff2afc3104f045dd403112b4bc094b35deedf0aaf6a2a2441493556912e40954d189bde7ab489c05a98d2a077f95d30e876ddafaff95b38d37e20833'
            'd7d452fa4a2310ec2ac68c2c500e2a66f3a6df2291ad6615f9a957cbc6cb4ccd7f00f9578ccebeb1367aa21205e3743b16463d841c63c73f9b0bfbbf37bd6992'
            'dfe79598af30797195fad38461119f7d611021577a1e1e624567adeceade8f9bc4c97cd110515e492d612d09b740f78faf7dce55448f64a9a698e7748f121a80')
_url=http://www.unrealsoftware.de/get.php?get

grabcid() {
  local file=cs2d_${_ver}_linux.zip
  echo "$(curl -Ss "$_url=${file}&p=1" | grep -o '"get.php[^"]\+"' | cut -d'"' -f2 | sed 's/&amp;/\&/g')"
}

_cid=$(grabcid) # this will hide the cmd line above from AUR interface
source=(cs2d_${_ver}_linux.zip::"$_url=cs2d_${_ver}_linux.zip&p=1&cid=16245"
        "cs2d.desktop"
        "cs2d.png")
options=(emptydirs)

package() {
  # create folders
  install -d "$pkgdir"/{opt/cs2d,usr/{share/{doc,licenses}/$pkgname,bin}}

  # data
  cp -R bots gfx help logos maps mods screens sfx sys "$pkgdir"/opt/cs2d

  # executable
  install -m755 CS2D "$pkgdir"/opt/cs2d
  ln -s /opt/cs2d/CS2D "$pkgdir"/usr/bin/cs2d

  # desktop launcher
  install -Dm644 cs2d.png "$pkgdir"/usr/share/pixmaps/cs2d.png
  install -Dm644 cs2d.desktop "$pkgdir"/usr/share/applications/cs2d.desktop

  # license
  sed -n 93,117p Readme.txt > "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

  # doc
  install -m644 *.txt "$pkgdir"/usr/share/doc/$pkgname

  # allow editing of configs
  chmod g+w "$pkgdir"/opt/cs2d/sys/*.{cfg,dat}
  chgrp games "$pkgdir"/opt/cs2d/sys/*.{cfg,dat}

  # allow saving maps
  chmod g+w "$pkgdir"/opt/cs2d/maps
  chgrp games "$pkgdir"/opt/cs2d/maps 

  # allow logging and caching
  chmod -R g+w "$pkgdir"/opt/cs2d/sys/{logs,core}
  chgrp games -R "$pkgdir"/opt/cs2d/sys/{logs,core}
}
