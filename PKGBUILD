# maintainer: so wieso <sowieso@dukun.de>
pkgname=starbound-client-server-gog
pkgver=1.0.5
pkgrel=1
pkgdesc="Starbound, an extraterrestrial sandbox adventure game (client + server, GOG-Version)"
url="http://playstarbound.com/"
license=('custom')
arch=('i686' 'x86_64')
depends=('')
optdepends=('sdl2: needed for client')
source=("gog://gog_starbound_2.5.0.6.sh"
        "starbound"
	"starbound_server"
	"starbound_server.service"
       )
        
md5sums=('e38aaceaa3247e2674e3ff5265663525'
         'b1edfe9aec35bc36d7fc8eb010cfdb05'
         'a4da1d6f3638765fec7fa8bfebac6086'
	 '80ebdcf3780e0ca8c93feaf5ee8d4eec')
install=$pkgname.install

# Download the GoG install script manually and place it in next to PKGBUILD, or setup a dlagent
DLAGENTS+=("gog::/usr/bin/echo %u - This is is not a real URL, you need to download the GOG file manually to \"$PWD\" or setup a gog:// DLAGENT. Read the wiki for more information.")
options=('!strip')
# Prevent compressing final package
PKGEXT='.pkg.tar'

package(){
  staticdir="$pkgdir/usr/share/starbound"
  configdir="$pkgdir/etc/conf.d/starbound/"
  mkdir -p "$staticdir"
  mkdir -p "$configdir"
  mkdir -p "$pkgdir/usr/share/licenses/starbound"
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/"{applications,pixmaps}
  cp -r "$srcdir"/data/noarch/game/{assets,linux,tiled} "$staticdir"
  cp -r "$srcdir"/data/noarch/game/{storage,mods} "$configdir"
  ln -s /etc/conf.d/starbound/mods "$staticdir/"
  ln -s /etc/conf.d/starbound/storage "$staticdir/"
  cp "$srcdir/data/noarch/docs/End User License Agreement.txt" "$pkgdir/usr/share/licenses/starbound/"
  cp starbound{,_server} "$pkgdir/usr/bin"
  chmod +x "$pkgdir/usr/bin"/starbound{,_server} 

  install -Dm644 starbound_server.service "${pkgdir}/usr/lib/systemd/system/starbound_server.service"

  cat > "$pkgdir/usr/share/applications/starbound.desktop" <<EODesktopfile
[Desktop Entry]
Encoding=UTF-8
Value=1.0
Type=Application
Name=Starbound
GenericName=Starbound
Comment=Starbound, an extraterrestrial sandbox adventure game
Icon=starbound.png
Exec=starbound
Categories=Game;
Path=/tmp
EODesktopfile
  cp "$srcdir/data/noarch/support/icon.png" "$pkgdir/usr/share/pixmaps/starbound.png"

}

