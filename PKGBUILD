# Maintainer: tjbp (archlinux@tjbp.net)

pkgname='openwebrx'
pkgver='0.15'
pkgrel='1'
pkgdesc='Open source, multi-user SDR receiver software with a web interface'
arch=('i686' 'x86_64')
url='http://openwebrx.org'
license=('AGPL3')
depends=('csdr' 'rtl-sdr')
install="$pkgname.install"
source=("https://github.com/simonyiszk/openwebrx/archive/$pkgver.tar.gz")
sha256sums=('92e64bb63bcfdb4803fd9ef77c88ca68dd65141f75c204e51383645e49d0ddac')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    sed -i "s/import plugins/import openwebrx.plugins/g" openwebrx.py
    sed -i "s/import rxws/import openwebrx.rxws/g" openwebrx.py
    sed -i "s/import sdrhu/import openwebrx.sdrhu/g" openwebrx.py
    sed -i "s/plugins\/dsp/\/usr\/lib\/python2.7\/openwebrx\/plugins\/dsp/g" openwebrx.py
    sed -i "s/\"config_webrx\"/\"openwebrx.config_webrx\"/g" openwebrx.py
    sed -i "s/__import__/importlib.import_module/g" openwebrx.py
    sed -i "s/importname=(directory+subdir+\"\/plugin\").replace(\"\/\",\"\.\")/importname=\"\/\".join((directory+subdir+\"\/plugin\").split(\"\/\")[4:]).replace(\"\/\",\".\")/g" openwebrx.py
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm 0755 openwebrx.py ${pkgdir}/usr/bin/openwebrx
    install -Dm 0644 plugins/__init__.py ${pkgdir}/usr/lib/python2.7/openwebrx/plugins/__init__.py
    install -Dm 0644 plugins/dsp/__init__.py ${pkgdir}/usr/lib/python2.7/openwebrx/plugins/dsp/__init__.py
    install -Dm 0644 plugins/dsp/csdr/plugin.py ${pkgdir}/usr/lib/python2.7/openwebrx/plugins/dsp/csdr/plugin.py
    install -Dm 0644 plugins/dsp/csdr/__init__.py ${pkgdir}/usr/lib/python2.7/openwebrx/plugins/dsp/csdr/__init__.py
    install -Dm 0644 rxws.py ${pkgdir}/usr/lib/python2.7/openwebrx/rxws.py
    install -Dm 0644 sdrhu.py ${pkgdir}/usr/lib/python2.7/openwebrx/sdrhu.py
    install -Dm 0644 config_webrx.py ${pkgdir}/etc/openwebrx/config_webrx.py
    touch ${pkgdir}/usr/lib/python2.7/openwebrx/__init__.py
}
