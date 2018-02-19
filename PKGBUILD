# Maintainer: Anton Hvornum <anton.feeds+AUR@gmail.com>
# makepkg --printsrcinfo > .SRCINFO
_owner=Torxed
_name=slimimap
#_dbuser_passwd=$(</dev/urandom tr -dc 'A-Za-z0-9!"#$%&()*+,-./:;<=>?@[\]^_`{|}~' | head -c 25  ; echo)
pkgname=$_name-git
pkgver=v0.0.1.r2.b8e8c21
pkgrel=1
pkgdesc="A simple, light weight IMAP server"
arch=('x86_64')
url="https://hvornum.se"
license=('custom:BSD' 'cc-by-nc-sa-3.0')
depends=('python' 'python-systemd' 'postgresql')
makedepends=('python')
#optdepends=('')
provides=('slimimap-git' 'slimimap')
conflicts=('slimimap-git' 'slimimap')
source=("git+https://github.com/$_owner/$_name.git")
sha256sums=('SKIP')

pkgver() {
    cd $_name
    #r=$(git log --pretty=oneline | cut -d' ' -f1 | wc -l)
    #h=$(git rev-parse --short HEAD)
    #v0.0.1.r$r.g$h
    printf $pkgver
}

prepare() {
    cd $_name

    # Create the .service file.
    cat > slimIMAP.service <<EOL
[Unit]
Description=$pkgdesc
Requires=postgresql
After=postgresql

[Service]
Type=simple
ExecStart=/usr/bin/slimIMAP
EOL

#    # Create the postgresql-user (if not exist)
#    sudo -i -u postgres psql postgres -tAc "SELECT 1 FROM pg_roles WHERE rolname='slimIMAP'" | grep -q 1 || createuser -D -R -S slimIMAP; sudo -i -u postgres psql postgres -tAc "ALTER USER slimIMAP WITH PASSWORD '$_dbuser_passwd';"

#    # And create the database if it doesn't excist
#    sudo -i -u postgres psql postgres -tAc "SELECT 1 FROM pg_roles WHERE rolname='slimIMAP'" | grep -q 1 || sudo -i -u postgres psql postgres -tAc "SELECT 1 FROM pg_database WHERE datname = 'slimIMAP'" | grep -q 1 || psql -U postgres -c "CREATE DATABASE slimIMAP OWNER slimIMAP;"
    
}

#build() {
#    Nothing to build
#}

package() {
    cd $_name

    # Install main application
    install -d -m755 "$pkgdir/usr/bin"

    install -m755 slimIMAP.py         "$pkgdir/usr/bin/slimIMAP"

    # Install dependencies
    install -d -m755 "$pkgdir/usr/lib/slimIMAP"

    install -m755 authentication.py   "$pkgdir/usr/lib/slimIMAP/"
    install -m755 helpers.py          "$pkgdir/usr/lib/slimIMAP/"
    install -m755 storages.py         "$pkgdir/usr/lib/slimIMAP/"

    # Install the sample configuration
    install -d -m755 "$pkgdir/etc/slimIMAP/"

    install -m755 configuration.py    "$pkgdir/etc/slimIMAP/"

    # Install the .service file
    install -d -m755 "$pkgdir/etc/systemd/system"
    install -m755 slimIMAP.service     "$pkgdir/etc/systemd/system/"

    # Install license files
    #install -Dm644 ../$_name/license.txt "$pkgdir/usr/share/licenses/$pkgname/license.txt"

#    echo
#    echo "The password for slimIMAP db-password is: $_dbuser_passwd"
}
