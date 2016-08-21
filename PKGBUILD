# Maintainer: Seth Barberee <seth.barberee@gmail.com>

pkgname=animewatch-pyqt4
_pkgname=AnimeWatch
pkgver=2.6.0
pkgrel=0
pkgdesc="An Audio/Video Manager and Front End for mpv/mplayer with special emphasis on Anime Collection based on PyQt4"
arch=(any)
conflicts=('animewatch-pyqt5')
license=('GPL3')
url="https://github.com/kanishka-linux/AnimeWatch"
depends=('python' 'python-pyqt4' 'python-pycurl' 'python-urllib3' 'curl' 'libnotify' 'python-dbus' 'libtorrent-rasterbar'
        'python-beautifulsoup4' 'python-psutil' 'python-pillow' 'python-lxml' 'mpv' 'mplayer' 'ffmpegthumbnailer' 'sqlite3' 'python-pytaglib')

#source=("git+https://github.com/kanishka-linux/AnimeWatch.git")
source=("https://github.com/kanishka-linux/"${_pkgname}"/archive/v"${pkgver}-${pkgrel}".zip")
md5sums=('bfe6588428c67ee69531e90ab5e00a52')
_gitname=AnimeWatch-PyQt4-Stable


package() {

  _bpath="${srcdir}/${_pkgname}-${pkgver}-${pkgrel}/${_gitname}"

  install -d "${pkgdir}/usr/share/${_pkgname}/"
  install -d "${pkgdir}/usr/share/${_pkgname}/Plugins/"
  install -d "${pkgdir}/usr/share/applications/"
  install -d "${pkgdir}/usr/bin/"
  
  install -Dm755 "${_bpath}"/{animeWatch.py,musicArtist.py,adb.py,1.png,input.conf,default.jpg,introspect.xml,stream.py,tray.png} "${pkgdir}/usr/share/${_pkgname}/"
  cat "${_bpath}/AnimeWatch.desktop" | sed 's/Exec=/Exec=python -B \/usr\/share\/AnimeWatch\/animeWatch.py \%u/g' > "${pkgdir}/usr/share/applications/AnimeWatch.desktop"
  echo '#!/bin/bash' > "${pkgdir}/usr/bin/anime-watch"
  echo 'if [ -z "$1" ]; then python -B /usr/share/AnimeWatch/animeWatch.py; else python -B /usr/share/AnimeWatch/animeWatch.py "$(pwd)/$1"; fi' >> "${pkgdir}/usr/bin/anime-watch"
  chmod +x "${pkgdir}/usr/bin/anime-watch"
  
  for file in "${_bpath}/Plugins/"*;do
  	nm=$(echo $file | rev | cut -d'/' -f1 | rev)
  	if [ $nm != "installPlugins.py" ];then
  		#echo $nm
		install -Dm755 "$file" "${pkgdir}/usr/share/${_pkgname}/Plugins/"
	fi
  done	
}
