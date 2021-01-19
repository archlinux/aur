# Contributor: vantu5z <vantu5z@mail.ru>

pkgname=vasisualy-git
pkgver=r85.20210115
pkgrel=1
pkgdesc="Vasisualy is a simple Russian voice assistant written on python 3 for GNU/Linux and Windows."
arch=('i686' 'x86_64')
url="https://github.com/Oknolaz/vasisualy"
license=('GPL3')
depends=('python>3' 'rhvoice' 'speech-dispatcher' 'python-pyqt5' 'python-vlc'
         'python-shell' 'python-pyowm' 'python-mss' 'python-wikipedia'
         'python-geocoder' 'python-googletrans' 'python-lxml'
         'python-beautifulsoup4' 'python-qt-material' 'python-speechrecognition')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=($pkgname::'git+https://github.com/Oknolaz/vasisualy.git'
        'vasisualy-pi' 'vasisualy-qt')
sha256sums=('SKIP'
            'd3a24f37d7c5012d33f52a7042ea4ae022d61f4e5f55a25e5e1515d63f4eecef'
            '0e477f3fca6b51af6822c1c67e2e48e2d1b1c95b608025b64c9d9132e0c8aea3')

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
    site_pkg=$(python -c "import site; print(site.getsitepackages()[0])")
    modulename=${pkgname%-git}

    cd $srcdir

    install -Dm0644 "vasisualy-pi" "${pkgdir}/usr/bin/vasisualy-pi"
    install -Dm0644 "vasisualy-qt" "${pkgdir}/usr/bin/vasisualy-qt"

    cd $pkgname

    install -Dm0644 "vasisualy-pi.py" "${pkgdir}/${site_pkg}/${modulename}/vasisualy-pi.py"
    install -Dm0644 "vasisualy-qt.py" "${pkgdir}/${site_pkg}/${modulename}/vasisualy-qt.py"
    cp -R "assets" "${pkgdir}/${site_pkg}/${modulename}"
    cp -R "music" "${pkgdir}/${site_pkg}/${modulename}"
    cp -R "ui" "${pkgdir}/${site_pkg}/${modulename}"

    install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${modulename}/LICENSE"
}
