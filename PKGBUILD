# Maintainer: AlphaJack <alphajack at tuta dot io>

# https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=funkwhale-venv
# https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=octoprint-venv
# https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=pretix-venv
# https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=python-ffsubsync-venv

pkgname="superset-venv"
_pkgname="apache-superset"
pkgver=4.1.1
pkgrel=1
pkgdesc="A modern, enterprise-ready business intelligence web application (venv installation type)"
url="https://superset.apache.org/"
license=("Apache-2.0")
arch=("any")
provides=("superset")
conflicts=("superset")
depends=("python")
makedepends=("jq")
source=("superset.bin"
        "superset.env"
        "superset.conf"
        "superset.sysusers"
        "superset.tmpfiles"
        "superset.service")
b2sums=('4cf278dd529b778356452eeb6e6d9c105dae977a28eadc1c7fbed3755eaaa1aa853fcb461d019b57879ed8512b819604ec46380719805de06ff14388552dc79a'
        '415e3b03382f043685f3080b5adde24cc55cd56da3b767e232673029afb500ec8f23ed7b9b48420cc757e73edfa6c07de00cbd2c9ecafa047645e2dbae017368'
        '5d99b11cd9ae415d5da4b828a3d1b29686f349cc7d3739f1f7aecef26dab82fb214761733e8f4bc88c1386f75457116ae71c3bf9d722b4e028b0b3eff0a50048'
        '85a1d4232a1901d00becf06ef5cbf139477209b93f3738add436f4243aa58d1b16a99dd6342c9f45f4b4efd2e10db337525d183f7f27c708420df406f31e6e09'
        '6580456589b3176aafa30a805fb63afc04401d1fb7e9c2ec9ee9f6b087c69ea54d4f854a5142783ea6a2566a4fe49f1222217071eed0fd2b04b370473d67748a'
        '90f6eab47fd21a9c062490e1d3add85245125d7809afe260d0dada93f336a5b41a5ce003923bf1fc392ab4e6002db76f3d1e8296ed23ffec79c9a02c6ec9012d')
backup=("etc/superset/env"
        "etc/superset/superset_config.py")
options=("!strip")
install="superset.install"

pkgver(){
 curl -s "https://pypi.org/pypi/apache-superset/json" | jq -r ".info.version"
}

package(){
 install -d -m 750 "$pkgdir/etc/superset"
 install -d -m 750 "$pkgdir/var/lib/superset"
 install -d -m 755 "$pkgdir/usr/share/superset" 
 install -D -m 755 "$srcdir/superset.bin"       "$pkgdir/usr/bin/superset"
 install -D -m 640 "$srcdir/superset.env"       "$pkgdir/etc/superset/env"
 install -D -m 640 "$srcdir/superset.conf"      "$pkgdir/etc/superset/superset_config.py"
 install -D -m 644 "$srcdir/superset.sysusers"  "$pkgdir/usr/lib/sysusers.d/superset.conf"
 install -D -m 644 "$srcdir/superset.tmpfiles"  "$pkgdir/usr/lib/tmpfiles.d/superset.conf"
 install -D -m 644 "$srcdir/superset.service"   "$pkgdir/usr/lib/systemd/system/superset.service"
 
 # create virtual environment
 export PIP_DISABLE_PIP_VERSION_CHECK=1
 export PYTHONDONTWRITEBYTECODE=1
 python -m venv "$pkgdir/usr/share/superset/venv"
 source "$pkgdir/usr/share/superset/venv/bin/activate"
 # install superset and dependencies using pip
 "$pkgdir/usr/share/superset/venv/bin/"pip install -I apache-superset gevent Pillow
 # remove references to pkgdir
 find "$pkgdir/usr/share/superset/venv/bin" -maxdepth 1 -type f -exec sed -i "s#${pkgdir}/#/#g" {} +
 find "$pkgdir/usr/share/superset/venv/pyvenv.cfg" -maxdepth 1 -type f -exec sed -i "s#${pkgdir}/#/#g" {} +
 find "$pkgdir/usr/share/superset/venv" -type f -name "*.py[co]" -delete
 find "$pkgdir/usr/share/superset/venv" -type d -name "__pycache__" -delete
 # exit virtual environment
 deactivate
}
