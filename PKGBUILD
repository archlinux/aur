# Maintainer:  HoleHolo <hola0_o@qq.com>
# Contributor: Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: carstene1ns <url/mail: arch carsten-teibes de>
# Contributor: josephgbr <rafael.f.f1@gmail.com>
# Contributor: Josef Lusticky <evramp@gmail.com>
# Contributor: Jorge Barroso <jorge.barroso.11 at gmail dot com>
# Contributor: Moses Miller <Majora320@gmail.com>

pkgname=counter-strike-2d
pkgver=1.0.1.5
_ver=${pkgver//./}
pkgrel=1
pkgdesc="More than just a freeware clone of the well known game Counter-Strike"
arch=('i686' 'x86_64')
url="https://www.unrealsoftware.de"
license=('custom')
install=cs2d.install
if [ "$CARCH" == "x86_64" ]; then
  depends=('lib32-libx11' 'lib32-libxxf86vm' 'lib32-libglvnd' 'lib32-freetype2' 'lib32-glibc' 'lib32-gcc-libs' 'lib32-libxcb' 'lib32-libxext' 'lib32-zlib' 'lib32-bzip2' 'lib32-libpng' 'lib32-harfbuzz' 'lib32-brotli' 'lib32-libxau' 'lib32-libxdmcp' 'lib32-glib2' 'lib32-pcre2')
  optdepends=('lib32-nvidia-utils: video acceleration for NVIDIA GPUs'
              'lib32-mesa: video acceleration'
              'lib32-openal: audio output'
              'lib32-pipewire: audio output')
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
sha512sums=('838bb0d3cd3cde72d155d1ec859c00f2119be68a2e365fbe88af5a5dab176335f89a0eeecbbe6e4aa0bc8a25bec36c99e2be752e4fcafac79a10b2fab8fd428e'
            'b31b14cb97fcfef718dd2e15fe3d50cecbf875d1d71c794f0568491e497ddc7efad56749d5d4fc34ec1c645e670b9a6a72e4f893b50f0b5e01d5e3baeb0803db'
            '0c7c91ad4050543635e56ce0ecd9b55e5dc917c87655c69e0dc7e4252655223b7346106f54f2a550e09952cb0ec8afaedfab8dd3b18324b545485ba4fd4b07a4'
            '318e12d0be3a2cc48c70e34688d861a89db811c960a76439730c420b159d0a99718403806cfc546bf243627e91ad6f34a65c97ef77e3d9592b5baaaed24e34c2')
_url="https://www.unrealsoftware.de/get.php?get"

grabcid() {
  local file=cs2d_${_ver}_linux.zip
  echo "$(curl -Ss "$_url=${file}&p=1" | sed -n 's/.*cid=\([0-9]\+\).*/\1/p' | head -n 1)"
}

_cid=$(grabcid) # this will hide the cmd line above from AUR interface
source=(cs2d_${_ver}_linux.zip::"${_url}=cs2d_${_ver}_linux.zip&p=1&cid=${_cid}"
        "cs2d.desktop"
        "cs2d.png"
        ubuntu_libs.zip::"https://github.com/Lyrecoul/cs2d_aur_package_host/raw/refs/heads/master/ubuntu_libs.zip")
options=(emptydirs)

package() {
  # create folders
  install -d "$pkgdir"/{opt/cs2d,usr/{share/{doc,licenses}/$pkgname,bin}}

  # data
  cp -R bots gfx help logos maps mods screens sfx sys "$pkgdir"/opt/cs2d

  # executable
  install CS2D lib* "$pkgdir"/opt/cs2d
  chmod +x "$pkgdir"/opt/cs2d/CS2D
  cat > "$pkgdir/usr/bin/cs2d" <<EOF
#!/bin/bash
export LD_LIBRARY_PATH=/opt/cs2d
/opt/cs2d/CS2D
EOF
  chmod +x "$pkgdir"/usr/bin/cs2d

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
