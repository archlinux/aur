# Contributor: Babken Vardanyan <483ken 4tgma1l>
# Contributor: Tom Boshoven <tomboshoven@gmail.com>
# Contributor: Zachary A. Jones <jazzplayerl9@gmail.com>

pkgname=dod-digglegods
pkgver=1.1.3
pkgrel=1
pkgdesc="Realm of the Diggle Gods:  DLC expansion for Dungeons of Dredmor"
arch=(i686 x86_64)
url="http://dungeonsofdredmor.com/"
license=(unknown)
depends=(dungeons-of-dredmor)
PKGEXT='.pkg.tar'
_gamepkg="Dredmor_humble-linux-realmofthedigglegods-${pkgver}.tar.gz"
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
  
  cp -R "$srcdir/dredmor" "$pkgdir/opt"

  }
