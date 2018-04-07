# Maintainer: Anton Hvornum <anton.feeds+AUR@gmail.com>
# makepkg --printsrcinfo > .SRCINFO
_owner=Torxed
_name=slimdhcp
pkgname=$_name-git
pkgver=0.0.1.r10.e1c6661
pkgrel=1
pkgdesc="A very slim DHCP server"
arch=('x86_64')
url="https://github.com/Torxed/slimDHCP"
license=('custom:BSD' 'cc-by-nc-sa-3.0')
depends=('python' 'python-systemd')
makedepends=('python')
#optdepends=('')
provides=('slimdhcp-git' 'slimdhcp')
conflicts=('slimdhcp-git' 'slimdhcp')
source=("git+https://github.com/$_owner/$_name.git")
sha256sums=('SKIP')

pkgver() {
    cd $_name
    r=$(git log --pretty=oneline | cut -d' ' -f1 | wc -l)
    h=$(git rev-parse --short HEAD)
    printf v0.0.1.r$r.g$h
}

prepare() {
    cd $_name

    # Create the .service file.
    cat > slimDHCP.service <<EOL
[Unit]
Description=$pkgdesc

[Service]
Type=simple
ExecStart=/usr/bin/slimDHCP
EOL

}

#build() {
#    Nothing to build
#}

package() {
    cd $_name

    # Install main application
    install -d -m755 "$pkgdir/usr/bin"

    install -m755 slimDHCP.py          "$pkgdir/usr/bin/slimDHCP"

    # Install dependencies
    install -d -m755 "$pkgdir/srv/tftp"

    install -m755 tftp.py              "$pkgdir/srv/tftp/"

    # Install the sample configuration
    #install -d -m755 "$pkgdir/etc/slimSMTP/"
    #
    #install -m755 configuration.py    "$pkgdir/etc/slimSMTP/"

    # Install the .service file
    install -d -m755 "$pkgdir/etc/systemd/system"
    install -m755 slimDHCP.service     "$pkgdir/etc/systemd/system/"

    # Install license files
    #install -Dm644 ../$_name/license.txt "$pkgdir/usr/share/licenses/$pkgname/license.txt"
}
