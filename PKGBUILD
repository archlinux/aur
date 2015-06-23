pkgname=cairo-dock-plug-ins-extras-git
pkgver=3.4.0.r5.g429fe72 
pkgrel=1 
pkgbranch=cairo-dock-plug-ins-extras 
pkgdesc="Extra plugins for cairo-dock, git version" 
arch=('i686' 'x86_64') 
url="http://www.glx-dock.org" 
license=('GPL') 
depends=('cairo-dock-plugins-git' 'python' 'python-dbus') 
optdepends=('python2-dbus'
	'vala' 
	'python-sgmllib: Google'
	'bsdmainutils: calendar[AUR]'
        'gtg: GTG [AUR]'
        'kdeplasma-addons-applets-lancelot: lancelot'
        'deluge: Deluge'
        'ktorrent: KTorrent'
        'mintmenu: MintMenu[AUR]'
) 
provides=(${pkgbranch}) 
conflicts=(${pkgbranch}) 
install=${pkgname}.install
source=('git://github.com/Cairo-Dock/cairo-dock-plug-ins-extras.git')
md5sums=('SKIP') 

pkgver() { 
 cd "$srcdir/$pkgbranch" 
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
} 

build() { 
  rm -rf "${srcdir}/${pkgbranch}-build" 
  cp -r "${srcdir}/${pkgbranch}" "${srcdir}/${pkgbranch}-build" 
  cd "${srcdir}/${pkgbranch}-build" 

  # generate .mo files 
  ./make_locale.sh 0 

## force python2 ## 
  # some applets are not compatible with python3/gtk3, force the use of python 2 
   for i in `cat Applets-python2.list`; do 
    if [ -x $i/$i ]; then 
       sed --follow-symlinks -i "1s/python/python2/"  $i/$i 
    fi 
   done 

  # removed useless files/dirs 
  rm -rf locale.bak po .bzr .bzrignore *.sh Applets-python2.list demos 

  # generate last-modif file to avoid auto-update 
  curr_date=$(date -d "1 month" +%Y%m%d) 
  for i in */; do 
    echo -n ${curr_date} > ${i}last-modif 
  done 

  
} 

package() { 
  cd "${srcdir}/${pkgbranch}-build" 

  cd_pluginsdatadir=$(pkg-config gldi --variable=pluginsdatadir) 

  rm -rf "${pkgdir}${cd_pluginsdatadir}/Dbus/" 
  mkdir -p "${pkgdir}${cd_pluginsdatadir}/Dbus/" 
  cp -r "${srcdir}/${pkgbranch}-build" "${pkgdir}${cd_pluginsdatadir}/Dbus/third-party" 
}