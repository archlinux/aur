# Maintainer: Anton Hvornum <anton.feeds+AUR@gmail.com>
_owner=Torxed
_name=slimdns
_dbuser_passwd=$(</dev/urandom tr -dc 'A-Za-z0-9!"#$%&()*+,-./:;<=>?@[\]^_`{|}~' | head -c 25  ; echo)
pkgname=$_name-git
pkgver=v0.r19.5085237
pkgrel=1
pkgdesc="A simple, light weight DNS server"
arch=('x86_64')
url="https://github.com/Torxed/slimDNS"
license=('custom:BSD' 'cc-by-nc-sa-3.0')
depends=('python-dnslib' 'postgresql')
makedepends=('python')
#optdepends=('')
provides=('slimdns-git' 'slimdns')
conflicts=('slimdns-git' 'slimdns')
source=("git+https://github.com/$_owner/$_name.git")
sha256sums=('SKIP')

pkgver() {
    cd $_name
    #r=$(git log --pretty=oneline | cut -d' ' -f1 | wc -l)
    #h=$(git rev-parse --short HEAD)
    #printf v0.r$r.g$h
    printf $pkgver
}

prepare() {
    cd $_name

    # Create the .service file.
    cat > slimDNS.service <<EOL
[Unit]
Description=$pkgdesc
Requires=postgresql
After=postgresql

[Service]
Type=simple
ExecStart=/usr/bin/slimDNS
EOL

    # Create the postgresql-user (if not exist)
    sudo -i -u postgres psql postgres -tAc "SELECT 1 FROM pg_roles WHERE rolname='slimdns'" | grep -q 1 || createuser -D -R -S slimdns; sudo -i -u postgres psql postgres -tAc "ALTER USER slimdns WITH PASSWORD '$_dbuser_passwd';"

    # And create the database if it doesn't excist
    sudo -i -u postgres psql postgres -tAc "SELECT 1 FROM pg_roles WHERE rolname='slimdns'" | grep -q 1 || sudo -i -u postgres psql postgres -tAc "SELECT 1 FROM pg_database WHERE datname = 'slimdns'" | grep -q 1 || psql -U postgres -c "CREATE DATABASE slimdns OWNER slimdns;"
    
}

#build() {
#    Nothing to build
#}

package() {
    cd $_name

    # Install main application
    install -d -m755 "$pkgdir/usr/bin"
    install -m755 slimDNS.py           "$pkgdir/usr/bin/slimDNS"

    # Install extra tools
    install -m755 dnstool.py          "$pkgdir/usr/bin/dnstool"

    # Install the sample configuration
    install -d -m755 "$pkgdir/etc/slimDNS/"
    install -m755 config.py           "$pkgdir/etc/slimDNS/"

    # Install data files (for future reference)
    #install -d -m755 "$pkgdir/usr/share/slimDNS/data/"
    #cp -r data/* "$pkgdir/usr/share/slimDNS/data/"

    # Install the .service file
    install -d -m755 "$pkgdir/etc/systemd/system"
    install -m755 slimDNS.service     "$pkgdir/etc/systemd/system/"

    # Install license files
    #install -Dm644 ../$_name/license.txt "$pkgdir/usr/share/licenses/$pkgname/license.txt"

    echo
    echo "The password for slimDNS db-password is: $_dbuser_passwd"
}
