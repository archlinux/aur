# Maintainer Eray Aydın <eray@erayaydin.me>

pkgname=counter-strike-2d-dev
pkgver=0.1.2.7
_ver=0127
pkgrel=1
pkgdesc="More than just a freeware clone of the well known game Counter-Strike"
arch=('i686' 'x86_64')
url="http://www.cs2d.com/"
license=('custom')
changelog=$pkgname.ChangeLog
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
backup=(opt/cs2d/sys/autobuy.cfg  opt/cs2d/sys/autoexec.cfg
        opt/cs2d/sys/config.cfg   opt/cs2d/sys/controls.cfg
        opt/cs2d/sys/editor.cfg   opt/cs2d/sys/filters.cfg
        opt/cs2d/sys/mapcycle.cfg opt/cs2d/sys/more.cfg
        opt/cs2d/sys/server.cfg   opt/cs2d/sys/usgn.dat
        opt/cs2d/sys/usgn_pw.dat)
sha512sums=('738be401192a795e76404cf3a97986fcfba2dc082dcec5c546a1c133a50b0a651b2d1f94885f77d830c90b0c37612e615e47fbf51a6f677a56034be62a8c5a6a'
            'cbc3c7c8246907d8c8d8143679e13144449048df09398b4f25cc50ecae0473d8bc186752418727297da0f79b4b323d272a9e1b97a0b0249243bb9098abc23897'
            '9db3ccddf9180461de5bfea671d52f5d7fe3ef9eb00bef69853362983b227315f75f931d8d4ed9e541a56872b461cb8a1864bbbf1cc88b3e9ed3a52c32a01238'
            '18cee40fd348ffba864d22f6a1c3e20aeaeba031b0ac0d288885b0d8f82aa553a37047b9793e66440d7e6a008077bd11aeff6cecf6681a38b0a835a1bccf971a'
            'dfe79598af30797195fad38461119f7d611021577a1e1e624567adeceade8f9bc4c97cd110515e492d612d09b740f78faf7dce55448f64a9a698e7748f121a80')
        # hack for generated id, see also https://bbs.archlinux.org/viewtopic.php?id=141195
_url=http://www.unrealsoftware.de/get.php?get

grabcid() {
  local file=cs2d_${_ver}_linux.zip
  echo "$(curl -Ss "$_url=${file}&p=1" | 
            grep -o '"get.php[^"]\+"' | cut -d'"' -f2 | sed 's/&amp;/\&/g')"
}
_cid=$(grabcid) # this will hide the cmd line above from AUR interface
source=(cs2d_${_ver}_linux.zip::"$_url=cs2d_${_ver}_linux.zip&p=1&cid=${_cid}"
        cs2d_${_ver}_win.zip::"$_url=cs2d_${_ver}_win.zip&p=1&cid=${_cid}"
        "cs2d.desktop"
        "cs2d-fs.desktop"
        "cs2d.png")
options=(emptydirs)

package() {
  # create folders
  install -d "$pkgdir"/{opt/cs2d,usr/{share/{doc,licenses}/$pkgname,bin}}

  # data
  cp -R bots gfx help logos maps screens sfx sys "$pkgdir"/opt/cs2d

  # executable
  install -m755 CounterStrike2D "$pkgdir"/opt/cs2d
  ln -s /opt/cs2d/CounterStrike2D "$pkgdir"/usr/bin/cs2d

  # desktop launcher
  install -Dm644 cs2d.png "$pkgdir"/usr/share/pixmaps/cs2d.png
  install -Dm644 cs2d.desktop "$pkgdir"/usr/share/applications/cs2d.desktop

  # license
  sed -n 84,106p Readme.txt > "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

  # doc
  install -m644 *.txt "$pkgdir"/usr/share/doc/$pkgname

  # allow editing of configs
  chmod g+w "$pkgdir"/opt/cs2d/sys/*.{cfg,dat}
  chgrp games "$pkgdir"/opt/cs2d/sys/*.{cfg,dat}

  # allow logging and caching
  chmod -R g+w "$pkgdir"/opt/cs2d/sys/{logs,core}
  chgrp games -R "$pkgdir"/opt/cs2d/sys/{logs,core}
}
