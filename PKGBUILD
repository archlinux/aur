# Maintainer: Dominic Meiser git at msrd0 dot de

pkgname=slic3r-dev
_pkgver=1.3.1_dev
pkgver=$_pkgver
pkgrel=4
pkgdesc="Development build of Slic3r, a 3D Printer Toolpath Generator"
arch=('x86_64')
url="https://slic3r.org"
license=('AGPL3')
depends=('freeglut' 'glu' 'gtk2' 'perl')
makedepends=('jq' 'wget')
conflicts=('slic3r' 'slic3r-git' 'slic3r-bin')
provides=('slic3r')
source=("master.json::https://api.github.com/repos/alexrj/slic3r/branches/master"
        "slic3r.desktop")
sha512sums=('SKIP'
            '0a3c840681077cf052fe7335d7275e2967d3f753082036f8a59bc1ab7b704874e481f33764a39ad4c481adc280ee3b9f594a0f3047659ef2c95aa708ead43593')

pkgver()
{
	cd $srcdir
	time=$(date --date=$(jq '.commit.commit.committer.date' master.json | tr -d '"') '+%Y%m%dT%H%M%S')
	sha=$(jq '.commit.sha' master.json | tr -d '"')
	echo "${_pkgver}.${time}.${sha:0:7}"
}

prepare()
{
	cd $srcdir
	sha=$(jq '.commit.sha' master.json | tr -d '"')
	wget -q --show-progress -O slic3r.tar.bz2 "https://dl.slic3r.org/dev/linux/slic3r-${_pkgver//_/-}-${sha:0:7}-linux-x64.tar.bz2"
}

package()
{
	cd $srcdir
	
	install -d "$pkgdir/opt"
	tar xfj slic3r.tar.bz2 -C "$pkgdir/opt/"
	sed -i "$pkgdir/opt/Slic3r/Slic3r" -e 's/DIR=.*$/DIR=\/opt\/Slic3r/'
	sed -i "$pkgdir/opt/Slic3r/Slic3r" -e 's/LD_LIBRARY_PATH=.*$/LD_LIBRARY_PATH=\/opt\/Slic3r\/bin/'
	
	install -d "$pkgdir/usr/bin"
	ln -s "/opt/Slic3r/Slic3r" "$pkgdir/usr/bin/slic3r"
	
	install -d "$pkgdir/usr/share/applications"
	install -m 644 $srcdir/slic3r.desktop "$pkgdir/usr/share/applications/"
}
