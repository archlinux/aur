
# Maintainer: Mikata Riko <sanbikappa@qq.com>

pkgname=krita-plugin-pythonplugindevelopertools-git
pkgver=r37.46a671a
pkgrel=3
epoch=
pkgdesc="Python plugin for Krita that assists with making python plugins for Krita"
arch=('any')
url="https://github.com/KnowZero/Krita-PythonPluginDeveloperTools"
license=('unknow')
depends=('krita' 'python-pyqt5')
provides=('krita-plugin-pythonplugindevelopertools' 'krita-plugin-pythonplugindevelopertools-bin')
conflicts=('krita-plugin-pythonplugindevelopertools' 'krita-plugin-pythonplugindevelopertools-bin')
install=.install
source=("$pkgname-$pkgver::git+https://github.com/KnowZero/Krita-PythonPluginDeveloperTools")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname-$pkgver"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

append_patch() {
    search="$1"
    old="$2"
    new="$3"
    sedCommand="s|$2|$3|"
    echo old="$2"
    echo new="$3"
    echo "$search" | while read -r line;do
        file="$(echo "$line" | awk '{sub(/:/,"<mySeparator>")}1' | awk '{sub(/:/,"<mySeparator>")}1' | awk -F'<mySeparator>' '{print $1}')"
        line_number="$(echo "$line" | awk '{sub(/:/,"<mySeparator>")}1' | awk '{sub(/:/,"<mySeparator>")}1' | awk -F'<mySeparator>' '{print $2}')"
        line_content="$(echo "$line" | awk '{sub(/:/,"<mySeparator>")}1' | awk '{sub(/:/,"<mySeparator>")}1' | awk -F'<mySeparator>' '{print $3}')"
        line_replace="$(echo "$line_content" | sed "$sedCommand")"
        echo "${line_number}c${line_number}" >> ${file}.patch
        echo "< $line_content" >> ${file}.patch
        echo "---" >> ${file}.patch
        echo "> $line_replace" >> ${file}.patch
    done 
}

prepare() {
    # General users can not download API files to /usr/share/krita/pykrita/ if they do not have sudo permission
    # set the save path of PluginDevTools.KritaAPI.*.zip files to ~/.cache/krita/

    rm -f "$srcdir"/*.patch

    # create patches
	cd "$srcdir/$pkgname-$pkgver/plugindevtools/PluginDevTools"
    search=$(grep -n os.path.dirname *.py | grep os.path.realpath | grep .KritaAPI. | grep .zip)
    append_patch "$search" 'os.path.dirname(os.path.realpath(__file__))' 'os.path.join(os.path.expanduser("~"),".cache","krita","PluginDevTools")'

    search=$(grep -n self.tempFilePath *.py | grep os.path.dirname | grep os.path.realpath | grep .console.temp.py)
    append_patch "$search" 'os.path.dirname(os.path.realpath(__file__))' 'os.path.join(os.path.expanduser("~"),".cache","krita","PluginDevTools")'


    # patch files
	cd "$srcdir/$pkgname-$pkgver/plugindevtools/PluginDevTools"
    for i in $(ls *.patch);do
    patch ${i%.patch} $i
    done
    mv *.patch $srcdir/
    cd $srcdir
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
    mkdir -p "$pkgdir/usr/share/krita/pykrita/"
    cp -r plugindevtools/{PluginDevTools,PluginDevTools.desktop} "$pkgdir/usr/share/krita/pykrita/"

}
