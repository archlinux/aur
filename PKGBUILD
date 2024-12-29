# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: SamWhited <sam@samwhited.com>
# Contributor: HLFH <gaspard@dhautefeuille.eu>

pkgname="odoo-venv"
_major=18.0
pkgrel=1
# updated automatically via pkgver()
pkgver=18.0.20241229
pkgdesc="Open Source Apps To Grow Your Business"
url="https://odoo.com/"
arch=("any")
license=("LGPL-3.0-only")
provides=("odoo" "odoo${_major/.*/}")
replaces=("odoo")
conflicts=("odoo" "odoo-nightly" "odoo18-nightly")
depends=("python")
optdepends=("postgresql: local database"
            "wkhtmltopdf: generate PDFs")
makedepends=("python-build"
             "python-wheel"
             "python-setuptools")
source=("https://nightly.odoo.com/$_major/nightly/src/odoo_$_major.latest.tar.gz"
        "odoo.conf"
        "odoo.logrotate"
        "odoo.service"
        "odoo.sysusers"
        "odoo.tmpfiles")
noextract=("odoo_$_major.latest.tar.gz")
b2sums=('SKIP'
        '72c131dc68f82047c52347b909a82073356a95c6f8817dc4f2faab93b4c17e978414897b7b831b25ed6a2e2fe3cb16892f5176ae8ad5880255d7bb7fdaacd5d6'
        '1ef682d87ba12dd8a185ba36701b737f8feb0c1e6eb4b23302a0dc5930ef63c990af65bc45a36313f879a29a23cbdb602e7fc34ba9cee2e46d9a3d8407d5751a'
        '93d51bda841f970694afa21c5246fe81ae558bde5ae4b29e8343b641f6295d9433fa64da8c990f72f83d7aceb48c3d7a50fd46900d2cc916deebc1821796b45b'
        '311757f40c9de2845482ebf22e36469cc1058396bba9edaa2265a2bd085e2bcdd22115b098af3aaa037f7dac3a81212ae8b249df0b268f6bf2d798ee01698aae'
        'f899025f7637aaed2d231de33e5c2d2a831f21f038cb86b9794f9f75224f6eb14b6c9baf95663278ae15568a80ac49354446202232f38577991a24d332373b53')
backup=("etc/odoo/odoo.conf")
install="odoo.install"
options=("!strip")

pkgver(){
 # retrieve date from the most recent archive
 curl "https://nightly.odoo.com/$_major/nightly/src/" | grep -oP 'odoo_\K(\d{2}\.\d{1}.\d{8})'| sort | tail -1
}

prepare(){
 # extract manually to avoid a folder name that includes the download date
 rm -rf "odoo-$_major"
 tar -xzf "odoo_$_major.latest.tar.gz" --one-top-level="odoo-$_major" --strip-components 1
}

build(){
 # generate the wheel using the system python-build
 cd "odoo-$_major"
 python -m build --no-isolation --wheel
}

package(){
 cd "odoo-$_major"

 # create virtual environment
 export PIP_DISABLE_PIP_VERSION_CHECK=1
 export PYTHONDONTWRITEBYTECODE=1
 python -m venv "$pkgdir/usr/share/odoo/venv"
 source "$pkgdir/usr/share/odoo/venv/bin/activate"

 # install odoo and dependencies using pip
 "$pkgdir/usr/share/odoo/venv/bin/"pip install --upgrade pip installer
 "$pkgdir/usr/share/odoo/venv/bin/"pip install -r "requirements.txt"
 "$pkgdir/usr/share/odoo/venv/bin/"python -m installer dist/*.whl

 # remove references to pkgdir
 find "$pkgdir/usr/share/odoo/venv/bin" -maxdepth 1 -type f -exec sed -i "s|${pkgdir}/|/|g" {} +
 find "$pkgdir/usr/share/odoo/venv/pyvenv.cfg" -maxdepth 1 -type f -exec sed -i "s|${pkgdir}/|/|g" {} +
 find "$pkgdir/usr/share/odoo/venv" -type f -name "*.py[co]" -delete
 find "$pkgdir/usr/share/odoo/venv" -type d -name "__pycache__" -delete

 # exit virtual environment
 deactivate

 # executable
 install -d "$pkgdir/usr/bin"
 ln -s "/usr/share/odoo/venv/bin/odoo" "$pkgdir/usr/bin/odoo"

 # configuration file
 install -d -m 750 "$pkgdir/etc/odoo"
 install -D -m 640 "$srcdir/odoo.conf" "$pkgdir/etc/odoo/odoo.conf"

 # log file
 install -D -m 644 "$srcdir/odoo.logrotate" "$pkgdir/etc/logrotate.d/odoo"

 # systemd files
 install -D -m 644 "$srcdir/odoo.service" "$pkgdir/usr/lib/systemd/system/odoo.service"
 install -D -m 644 "$srcdir/odoo.sysusers" "$pkgdir/usr/lib/sysusers.d/odoo.conf"
 install -D -m 644 "$srcdir/odoo.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/odoo.conf"
}
