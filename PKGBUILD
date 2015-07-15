# Contributor: Babken Vardanyan <483ken 4tgma1l
# Contributor: Tom Boshoven <tomboshoven@gmail.com>
# Contributor: Zachary A. Jones <jazzplayerl9@gmail.com>

pkgname=dungeons-of-dredmor
pkgver=1.1.3
pkgrel=1
pkgdesc="Rogue-like game with hilarity as the centerpiece.  Requires purchase from Humble Store (or Bundle)."
arch=(i686 x86_64)
url="http://dungeonsofdredmor.com/"
license=(unknown)
depends=(sdl_mixer sdl_image sdl_ttf gcc-libs openal)
source=(dredmor.desktop dredmor.png)
md5sums=('cc0659ad114563dd1122910f78b27dbb'
		 'a629a7939c0a8f4ef86fb351e72d6be9')
PKGEXT='.pkg.tar'
_gamepkg="dungeonsofdredmor-linux-${pkgver}.tgz"
_gamedir="dungeons-of-dredmor"
_execu="Dredmor-amd64"
[ "$CARCH" = 'x86_64' ] && _execu="Dredmor-x86"
package() {

   cd "${srcdir}"
   msg "You need a full copy of this game in order to install it"
   msg "Searching for ${_gamepkg} in dir: $(readlink -f `pwd`/..)"
   if [[ -f "../${_gamepkg}" ]]; then
       msg "Found game package, installing..."
       ln -fs "../${_gamepkg}" .
   elif [[ -f "${_gamepkg}" ]]; then
	   msg "Found game package in ${srcdir}, installing..."
   elif [ -n "${_humbleintbundlekey}" ]; then
	   msg "Game package not found, trying to download..."
	   rm -f index.html\?key\=${_humbleintbundlekey}*
	   wget http://www.humblebundle.com/?key=${_humbleintbundlekey}
	   wget $(cat index.html\?key\=${_humbleintbundlekey} | grep "${_gamepkg}" | cut -d "'" -f 10)
	   mv ${_gamepkg}* ${_gamepkg}
   else
	   msg "Game package not found and download failed."
	   msg "You can add \'export _humbleintbundlekey\=\<Your key here\>\' to \.bashrc if you want automated download ability."
       error "Please type absolute path to ${_gamepkg} (/home/joe):"
       read pkgpath
       if [[ -f "${pkgpath}/${_gamepkg}" ]]; then
           msg "Found game package, installing..."
		   ln -fs "${pkgpath}/${_gamepkg}" .
	   else
	       error "Unable to find game package."
	       return 1
       fi
   fi

  mkdir "$srcdir/dredmor"
  tar xvf "$srcdir/${_gamepkg}" -C "$srcdir/dredmor"
  cd "$srcdir"
  install -d "$pkgdir/opt/dredmor"
  
  #remove non-native libraries
  rm -rf "$srcdir/dredmor/x86"
  rm -rf "$srcdir/dredmor/amd64"
  rm "$srcdir/dredmor/${_execu}"
  
  # Fix mode
  chmod a+x "$srcdir/dredmor/Dredmor"
  
  cp -R "$srcdir/dredmor" "$pkgdir/opt"

  cd "$pkgdir"
  
  #Install Desktop File
  install -m 644 -D "$srcdir/dredmor.desktop" usr/share/applications/dredmor.desktop

  #Install Icon
  install -m 644 -D "$srcdir/dredmor.png" usr/share/icons/dredmor.png
  
  #Link Executable
  install -d usr/bin
  ln -s "/opt/dredmor/Dredmor" usr/bin/dredmor
}
