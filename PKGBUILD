# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="deemix-server-git"
pkgver=r465.2204471b8b
pkgrel=2
pkgdesc="Standalone server packaged with headless components of deemix-pyweb"
arch=("any")
url="https://gitlab.com/RemixDev"
license=("GPL3")
depends=("python>=3.6" "deemix" "python-flask" "python-flask-socketio>=5.0" "python-eventlet" "python-bidict")
makedepends=("git")
provides=("deemix-pyweb")
source=("example-nginx-subdomain.conf"
        "example-nginx-subdirectory.conf"
        "config.json"
        "deemix-server.service"
        "deemix-server.sysusers"
        "deemix-server.tmpfiles"
        "deemix-pyweb::git+https://gitlab.com/RemixDev/deemix-gui-pyweb.git"
        "deemix-webui::git+https://gitlab.com/RemixDev/deemix-webui.git")
sha256sums=("551b9ff0da56f75b29f259a2c995d3d590bd157a07a6de2f15a902cebd779681"
            "ece609805c5240e2bbb4ec96b571de9343649ea958538a6b7b9b1509a89979bb"
            "093c445f5a27044f648ab997e477ff6fd41789a3d940eb7f27d64c230de20681"
            "e9de7e9637b47bbd9054ff8a1ad0d8febd6ce2cdd66fc4c71b6a212b0295fe75"
            "12860b6fd3ade371ce4c2d81e645d29dbf02267ff9c299059621014b4e0e0614"
            "ad69a84e0d51df2418c71b24e262e5128f0661ebc09abc719e6d7aec309e7599"
            "SKIP"
            "SKIP")
backup=("var/lib/deemix-server/.config/deemix/config.json" "var/lib/deemix-server/.config/deemix/.arl")
install="deemix-server.install"

# hardcode the desired subdirectory, disabled by default
#prepare(){
#
# _subdirectory="deemix"
# sed -i "deemix-webui/public/js/bundle.js" \
#     -e "s|\"/socket.io\",k.opts=v|\"/$_subdirectory/socket.io\",k.opts=v|" \
#     -e "s|path:\"/|path:\"/$_subdirectory/|g"
#}

pkgver(){
 cd "deemix-pyweb"
 printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=10 HEAD)"
}

package(){
 install -d -m 755 "$pkgdir/usr/lib/deemix-server"
 install -d -m 755 "$pkgdir/var/lib/deemix-server/.config/deemix"
 cp -dr "deemix-pyweb"/* "$pkgdir/usr/lib/deemix-server/"
 cp -dr "deemix-webui"/* "$pkgdir/usr/lib/deemix-server/webui"

 chmod +x "$pkgdir/usr/lib/deemix-server/server.py"
 install -d -m 755 "$pkgdir/usr/bin"
 ln -s "/usr/lib/deemix-server/server.py" "$pkgdir/usr/bin/deemix-server"

 echo "CHANGEME" > "$pkgdir/var/lib/deemix-server/.config/deemix/.arl"
 install -m 644 "config.json" "$pkgdir/var/lib/deemix-server/.config/deemix"
 install -m 644 "example-nginx-subdomain.conf" "$pkgdir/usr/lib/deemix-server"
 install -m 644 "example-nginx-subdirectory.conf" "$pkgdir/usr/lib/deemix-server"
 install -D -m 644 "deemix-server.service" "$pkgdir/usr/lib/systemd/system/deemix-server.service"
 install -D -m 644 "deemix-server.sysusers" "$pkgdir/usr/lib/sysusers.d/deemix-server.conf"
 install -D -m 644 "deemix-server.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/deemix-server.conf"
}
