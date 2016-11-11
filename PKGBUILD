pkgname=animewatch-pyqt5
_pkgname=AnimeWatch
pkgver=3.0.0
pkgrel=0
pkgdesc="An Audio/Video Manager and Front End for mpv/mplayer with special emphasis on Anime Collection"
arch=(any)
conflicts=('animewatch-pyqt4' 'animewatch-pyqt5.git')
license=('GPL3')
depends=('python' 'qt5-webengine' 'python-pyqt5' 'python-pycurl' 'python-urllib3' 'curl' 'libnotify' 'python-dbus' 'libtorrent-rasterbar'
        'python-beautifulsoup4' 'python-psutil' 'python-pillow' 'python-lxml' 'mpv' 'mplayer' 'ffmpegthumbnailer' 'sqlite3' 'python-pytaglib' 
	 'youtube-dl' 'wget')
#optdepends=('livestreamer' 'youtube-dl' 'wget')
makedepends=('git')

#source=("git+https://github.com/kanishka-linux/AnimeWatch.git")
source=("https://github.com/kanishka-linux/${_pkgname}/releases/download/v${pkgver}-${pkgrel}/${_pkgname}-${pkgver}-${pkgrel}.tar.bz2")
md5sums=('e35db3e93b36b444e32d80fcf08430cf')
_gitname=AnimeWatch-PyQt5


package() {

  _bpath="${srcdir}/${_pkgname}-${pkgver}-${pkgrel}/${_gitname}"

  install -d "${pkgdir}/usr/share/${_pkgname}/"
  install -d "${pkgdir}/usr/share/${_pkgname}/Plugins/"
  install -d "${pkgdir}/usr/share/applications/"
  install -d "${pkgdir}/usr/bin/"
  
  for file in "${_bpath}/"*;do
  	nm=$(echo $file | rev | cut -d'/' -f1 | rev)
  	if [ -d "$file" ];then
		if [ $nm == 'Plugins' ];then
			_plugin_path="$file/"
			for plugins in "${_plugin_path}"*;do
				plugin_name=$(echo $plugins | rev | cut -d'/' -f1 | rev)
				if [ plugin_name != 'installPlugins.py' ];then
					echo $plugins
					echo 'Plugins copying'
					install -Dm755 "$plugins" "${pkgdir}/usr/share/${_pkgname}/Plugins/"
				fi
			done
		fi
  	else
		if [ $nm == 'AnimeWatch.desktop' ];then
			echo $file
			echo 'desktop file copying'
			cat "$file" | sed 's/Exec=/Exec=python -B \/usr\/share\/AnimeWatch\/animeWatch.py \%u/g' > "${pkgdir}/usr/share/applications/AnimeWatch.desktop"
		elif [ $nm == 'anime-watch' ];then
			echo $file
			echo 'anime-watch script'
			install -Dm755 "$file" "${pkgdir}/usr/bin/anime-watch"
			chmod +x "${pkgdir}/usr/bin/anime-watch"
		else 
			if [ $nm != 'install.py' ];then
				echo $file
				echo 'source files copying'
				install -Dm755 "$file" "${pkgdir}/usr/share/${_pkgname}/"
			fi
		fi
	fi
  done
  
}
