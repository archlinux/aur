# Contributor: vantu5z <vantu5z@mail.ru>
pkgname=rhvoice-dictionary-git
pkgver=r1734.20210109
pkgrel=1
pkgdesc="Русский словарь для RHVoice. Дополнительные иструменты (Python)."
arch=('i686' 'x86_64')
url="https://github.com/vantu5z/RHVoice-dictionary"
license=('GPL3')
depends=('rhvoice')
optdepends=("python>3: for text preprocessing support"
            "python-pymorphy2: morphology tool for text preprocessing")
makedepends=('git' 'python>3')

source=($pkgname::git+https://github.com/vantu5z/RHVoice-dictionary.git)
sha256sums=('SKIP')

pkgver() {
	cd $pkgname
	# get number of last git commit
	_commitCount=$(git rev-list --count HEAD)
	# get time of last git commit
	_commitTime=$(git show -s --format="%ci" | grep -o "....-..-.." | sed "s/-//g")
	# add "r*.*" from package version
	echo "r$_commitCount.$_commitTime"
}

build() {
    cd $pkgname/tools
    python build.py
}

package()
{
    cd $pkgname
    mkdir -p ${pkgdir}/etc/RHVoice/dicts/Russian/
    cp -R phrase_dict.txt "$pkgdir/etc/RHVoice/dicts/Russian/"
    cp -R locations_dict.txt "$pkgdir/etc/RHVoice/dicts/Russian/"
    cp -R names_dict.txt "$pkgdir/etc/RHVoice/dicts/Russian/"
    cp -R person_names_dict.txt "$pkgdir/etc/RHVoice/dicts/Russian/"
    cp -R abbr_dict.txt "$pkgdir/etc/RHVoice/dicts/Russian/"
    cp -R yo_dict.txt "$pkgdir/etc/RHVoice/dicts/Russian/"

    mkdir -p ${pkgdir}/usr/bin/
    cp -R "tools/rhvoice_say" "$pkgdir/usr/bin/"
    cp -R "tools/rhvoice_config" "$pkgdir/usr/bin/"
    cp -R "tools/build/lib/" "$pkgdir/usr/"
}
