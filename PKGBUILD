# Contributor: vantu5z <vantu5z@mail.ru>

pkgname=vasisualy-git
pkgver=r110.20210302
pkgrel=2
pkgdesc="Vasisualy is a simple Russian voice assistant written on python 3 for GNU/Linux and Windows."
arch=('i686' 'x86_64')
url="https://github.com/Oknolaz/vasisualy"
license=('GPL3')
depends=('python>3' 'rhvoice' 'speech-dispatcher' 'python-pyqt5' 'python-vlc'
         'python-shell' 'python-pyowm' 'python-mss' 'python-wikipedia'
         'python-geocoder' 'python-translate' 'python-lxml'
         'python-beautifulsoup4' 'python-qt-material' 'python-speechrecognition')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=($pkgname::'git+https://github.com/Oknolaz/vasisualy.git'
        ${pkgname}-pi::'git+https://github.com/Oknolaz/vasisualy-pi.git'
        ${pkgname}-files::'git+https://github.com/Oknolaz/vasisualy-additional-files.git')
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

pkgver() {
	cd $pkgname
	# get number of last git commit
	_commitCount=$(git rev-list --count HEAD)
	# get time of last git commit
	_commitTime=$(git show -s --format="%ci" | grep -o "....-..-.." | sed "s/-//g")
	# add "r*.*" from package version
	echo "r$_commitCount.$_commitTime"
}

package()
{
    #site_pkg=$(python -c "import site; print(site.getsitepackages()[0])")
    site_pkg="usr/share"
    modulename=${pkgname%-git}
    modulename_pi=${pkgname%-git}-pi

    cd ${pkgname}-files
    install -Dm0755 "vasisualy"    "${pkgdir}/usr/bin/vasisualy"
    install -Dm0755 "vasisualy-pi" "${pkgdir}/usr/bin/vasisualy-pi"
    install -Dm0755 "vasisualy.desktop" "${pkgdir}/usr/share/applications/vasisualy.desktop"

    cd $srcdir/$pkgname
    install -Dm0755 "main.py" "${pkgdir}/${site_pkg}/${modulename}/main.py"
    cp -R "assets" "${pkgdir}/${site_pkg}/${modulename}"
    cp -R "core"   "${pkgdir}/${site_pkg}/${modulename}"
    cp -R "music"  "${pkgdir}/${site_pkg}/${modulename}"
    cp -R "skills" "${pkgdir}/${site_pkg}/${modulename}"
    cp -R "ui"     "${pkgdir}/${site_pkg}/${modulename}"
    install -Dm0644 "ui/vas.png" "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/vasisualy.png"
    install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${modulename}/LICENSE"

    cd $srcdir/${pkgname}-pi
    install -Dm0755 "main.py" "${pkgdir}/${site_pkg}/${modulename_pi}/main.py"
    cp -R "assets" "${pkgdir}/${site_pkg}/${modulename_pi}"
    cp -R "core"   "${pkgdir}/${site_pkg}/${modulename_pi}"
    cp -R "music"  "${pkgdir}/${site_pkg}/${modulename_pi}"
    cp -R "skills" "${pkgdir}/${site_pkg}/${modulename_pi}"
    cp -R "ui"     "${pkgdir}/${site_pkg}/${modulename_pi}"
    install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${modulename_pi}/LICENSE"
}
