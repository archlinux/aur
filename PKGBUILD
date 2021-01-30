# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="deemix-server-git"
pkgver=r460.4308163b3f
pkgrel=1
pkgdesc="Standalone server packaged with headless components of deemix-pyweb"
arch=("any")
url="https://git.rip/RemixDev"
license=("GPL3")
depends=("python>=3.6" "deemix" "python-flask" "python-flask-socketio>=5.0" "python-eventlet" "python-bidict")
makedepends=("git")
provides=("deemix-pyweb")
source=("example-nginx.conf"
        "config.json"
        "deemix-server.service"
        "deemix-server.sysusers"
        "deemix-server.tmpfiles"
        "deemix-pyweb::git+https://git.rip/RemixDev/deemix-pyweb.git"
        "deemix-webui::git+https://git.rip/RemixDev/deemix-webui.git")
sha256sums=("07bd9e362149e1f79c5f155c01cb5c8eeaacf44715f64d168b7fdf073e702fbb"
            "093c445f5a27044f648ab997e477ff6fd41789a3d940eb7f27d64c230de20681"
            "b7a0a3940978c0242aad1a071d8676319a304d3aedff704b1941e0e441fda187"
            "12860b6fd3ade371ce4c2d81e645d29dbf02267ff9c299059621014b4e0e0614"
            "ad69a84e0d51df2418c71b24e262e5128f0661ebc09abc719e6d7aec309e7599"
            "SKIP"
            "SKIP")
backup=("var/lib/deemix-server/.config/deemix/config.json")
install="deemix-server.install"

pkgver(){
 cd "deemix-pyweb"
 printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=10 HEAD)"
}

package(){
 install -d -m 755 "$pkgdir/usr/lib/deemix-server"
 install -d -m 755 "$pkgdir/var/lib/deemix-server/.config/deemix"
 cp -dr "deemix-pyweb"/* "$pkgdir/usr/lib/deemix-server/"
 cp -dr "deemix-webui"/* "$pkgdir/usr/lib/deemix-server/webui"
 cp -dr "deemix-webui"/* "$pkgdir/usr/lib/deemix-server/webui"

 chmod +x "$pkgdir/usr/lib/deemix-server/server.py"
 install -d -m 755 "$pkgdir/usr/bin"
 ln -s "/usr/lib/deemix-server/server.py" "$pkgdir/usr/bin/deemix-server"

 echo "CHANGEME" > "$pkgdir/var/lib/deemix-server/.config/deemix/.arl"
 install -D -m 644 "config.json" "$pkgdir/var/lib/deemix-server/.config/deemix/config.json"
 install -D -m 644 "example-nginx.conf" "$pkgdir/usr/lib/deemix-server/example-nginx.conf"
 install -D -m 644 "deemix-server.service" "$pkgdir/usr/lib/systemd/system/deemix-server.service"
 install -D -m 644 "deemix-server.sysusers" "$pkgdir/usr/lib/sysusers.d/deemix-server.conf"
 install -D -m 644 "deemix-server.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/deemix-server.conf"
}
