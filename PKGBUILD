#PKGBUIL for 0.6

# Set this to true to build and install retroshare-nogui
_build_nogui=true

# Set this to true to build and install the plugins
_build_linkscloud=false
_build_feedreader=false
_build_voip=false



### Nothing to be changed below this line ###

_branch="trunk"
_svnmod=trunk


pkgname=retroshare-v0.6-svn-beta
pkgver=8612
pkgrel=1
pkgdesc="Serverless encrypted instant messenger with filesharing, chatgroups, e-mail."
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="http://retroshare.sourceforge.net/"
license=('GPL' 'LGPL')

depends=('qt4' 'libupnp' 'libgnome-keyring' 'libxss' 'sqlcipher' 'libmicrohttpd')
conflicts=('retroshare06')


makedepends=('subversion')
provides=('retroshare06')





install='retroshare-v0.6-svn-beta.install'
source=('svn://svn.code.sf.net/p/retroshare/code/'$_branch
  	'retroshare-v0.6-svn-beta.install')
sha256sums=('SKIP'
	    'SKIP')



		

# Add missing dependencies if needed
[[ $_build_nogui == true ]] && depends=(${depends[@]} 'libssh' 'protobuf')
[[ $_build_voip == true ]] && depends=(${depends[@]} 'speex' 'opencv')
[[ $_build_feedreader == true ]] && depends=(${depends[@]} 'curl' 'libxslt')

pkgver() {
  LANG=C svn info "$SRCDEST/$_svnmod" | awk '/Last Changed Rev/ {print $4}'
}

prepare() {
  # Since makepkg 4.1.0 uses svn export, version_detail.sh doesnâ€™t work
  # unless we copy the needed .svn directory first
  cp -a "$SRCDEST/$_svnmod/.svn" "$srcdir/$_svnmod/"
}

build() {
  cd "$srcdir/$_svnmod"

  _qmake='qmake-qt4'
  #_qmake='qmake'

  #
  # BUILD HERE
  #
  msg "Compiling OpenPGP-SDK..."
  cd openpgpsdk/src
  $_qmake
  make
  cd ../..

  msg "Compiling libbitdht..."
  cd libbitdht/src
  $_qmake
  make
  cd ../..
  
  msg "Compiling support libs (pegmarkdown)..."
  cd supportlibs/pegmarkdown
  $_qmake
  make
  cd ../..	

  msg "Change default directory (home and /usr/Share..."
  cd libretroshare/src/rsserver
  sed -i.bak -e s:/usr/share/RetroShare:/usr/share/RetroShare06:g -e s:'/.retroshare':'/.retroshare06':g rsaccounts.cc
  sed -i.bak -e s:/usr/lib/retroshare:/usr/lib/retroshare06:g rsinit.cc
  cd ../../..						       

  msg "Compiling libretroshare..."
  cd libretroshare/src
  $_qmake
  LANG=C ./version_detail.sh
  make
  cd ../..

  msg "Clean for next svn update"
  cd libretroshare/src/rsserver
  mv rsaccounts.cc.bak rsaccounts.cc
  mv rsinit.cc.bak rsinit.cc
  cd ../../..						       

  msg "Compiling retroshare-resapi..."
  cd libresapi/src
  $_qmake
  make
  cd ../..

  msg "Compiling retroshare-gui..."
  cd retroshare-gui/src
  $_qmake
  LANG=C ./version_detail.sh
  make
  cd ../..

  if [[ "$_build_voip" == "true" ]] ; then
  	msg "Compiling VOIP plugin..."
  	cd "plugins/VOIP"
  	$_qmake
  	make
  	cd ../..
  fi

  if [[ "$_build_feedreader" == "true" ]] ; then
  	msg "Compiling FeedReader plugin..."
  	cd "plugins/FeedReader"
  	$_qmake
  	make
  	cd ../..
  fi

  if [[ "$_build_linkscloud" == "true" ]] ; then
  	msg "Compiling LinksCloud plugin..."
  	cd "plugins/LinksCloud"
  	$_qmake
  	make
  	cd ../..
  fi

  



  if [[ "$_build_nogui" == "true" ]]; then
  	msg "Compiling retroshare-nogui..."
  	cd rsctrl/src
  	make
  	cd ../../retroshare-nogui/src
  	$_qmake
  	make
	cd ../..
  fi





}

package() {
#set -x

  cd "$srcdir/$_svnmod"

  # Binaries
  install -D -m 755 retroshare-gui/src/RetroShare "$pkgdir/usr/bin/retroshare06"
  if [[ "$_build_nogui" == "true" ]]; then
  	install -D -m 755 \
  		"retroshare-nogui/src/retroshare-nogui" \
  		"${pkgdir}/usr/bin/retroshare-nogui06"
  fi

  # Plugins
  if [[ "$_build_linkscloud" == "true" ]] ; then
  	install -D -m 755 \
  		"plugins/LinksCloud/libLinksCloud.so" \
  		"${pkgdir}/usr/lib/retroshare06/extensions6/libLinksCloud.so"
  fi
  if [[ "$_build_voip" == "true" ]] ; then
  	install -D -m 755 \
  		"plugins/VOIP/libVOIP.so" \
  		"${pkgdir}/usr/lib/retroshare06/extensions6/libVOIP.so"
  fi
  if [[ "$_build_feedreader" == "true" ]] ; then
  	install -D -m 755 \
  		"plugins/FeedReader/libFeedReader.so" \
  		"${pkgdir}/usr/lib/retroshare06/extensions6/libFeedReader.so"
  fi

  

  # Applications menu entry
  mkdir -p "$pkgdir/usr/share/applications"
  cat >"$pkgdir/usr/share/applications/retroshare06.desktop" <<EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=RetroShare06
GenericName=Sharing Network
Comment=Secure communication with your friends
Icon=/usr/share/pixmaps/retroshare_blue06.png
Exec=/usr/bin/retroshare06
Terminal=false
StartupNotify=true
Categories=Network;InstantMessaging;FileTransfer;Chat;Email;
EOF
  install -D -m 644 \
  	"retroshare-gui/src/gui/images/logo/logo_512.png" \
  	"${pkgdir}/usr/share/pixmaps/retroshare_blue06.png"

  # bdboot (needed to bootstrap the DHT)
  install -D -m 644 \
  	"libbitdht/src/bitdht/bdboot.txt" \
  	"${pkgdir}/usr/share/RetroShare06/bdboot.txt"

  # Skins
  cp -r "retroshare-gui/src/qss" "${pkgdir}/usr/share/RetroShare06/"
}
 
