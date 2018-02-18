# Maintainer: Anton Hvornum <anton.feeds+AUR@gmail.com>
_owner=Torxed
_name=slimsmtp
#_dbuser_passwd=$(</dev/urandom tr -dc 'A-Za-z0-9!"#$%&()*+,-./:;<=>?@[\]^_`{|}~' | head -c 25  ; echo)
pkgname=$_name-git
pkgver=0.r36.792a9e9
pkgrel=1
pkgdesc="A simple, light weight SMTP server"
arch=('x86_64')
url="https://hvornum.se"
license=('custom:BSD' 'cc-by-nc-sa-3.0')
depends=('python', 'python-systemd' 'postgresql')
makedepends=('python')
#optdepends=('')
provides=('slimsmtp-git' 'slimsmtp')
conflicts=('slimsmtp-git' 'slimsmtp')
source=("git+https://github.com/$_owner/$_name.git")
sha256sums=('SKIP')

pkgver() {
    cd $_name
    r=$(git log --pretty=oneline | cut -d' ' -f1 | wc -l)
    h=$(git rev-parse --short HEAD)
    printf v0.r$r.g$h
}

prepare() {
    cd $_name

    # Create the .service file.
    cat > slimSMTP.service <<EOL
[Unit]
Description=$pkgdesc
Requires=postgresql
After=postgresql

[Service]
Type=simple
ExecStart=/usr/bin/slimSMTP
EOL

#    # Create the postgresql-user (if not exist)
#    sudo -i -u postgres psql postgres -tAc "SELECT 1 FROM pg_roles WHERE rolname='slimSMTP'" | grep -q 1 || createuser -D -R -S slimSMTP; sudo -i -u postgres psql postgres -tAc "ALTER USER slimSMTP WITH PASSWORD '$_dbuser_passwd';"

#    # And create the database if it doesn't excist
#    sudo -i -u postgres psql postgres -tAc "SELECT 1 FROM pg_roles WHERE rolname='slimSMTP'" | grep -q 1 || sudo -i -u postgres psql postgres -tAc "SELECT 1 FROM pg_database WHERE datname = 'slimSMTP'" | grep -q 1 || psql -U postgres -c "CREATE DATABASE slimSMTP OWNER slimSMTP;"
    
}

#build() {
#    Nothing to build
#}

package() {
    cd $_name

    # Install main application
    install -d -m755 "$pkgdir/usr/bin"

    install -m755 slimSMTP.py         "$pkgdir/usr/bin/slimSMTP"

    # Install dependencies
    install -d -m755 "$pkgdir/usr/lib/slimSMTP"

    install -m755 authentication.py   "$pkgdir/usr/lib/slimSMTP/"
    install -m755 helpers.py          "$pkgdir/usr/lib/slimSMTP/"
    install -m755 storages.py         "$pkgdir/usr/lib/slimSMTP/"

    # Install the sample configuration
    install -d -m755 "$pkgdir/etc/slimSMTP/"

    install -m755 configuration.py    "$pkgdir/etc/slimSMTP/"

    # Install the .service file
    install -d -m755 "$pkgdir/etc/systemd/system"
    install -m755 slimSMTP.service     "$pkgdir/etc/systemd/system/"

    # Install license files
    #install -Dm644 ../$_name/license.txt "$pkgdir/usr/share/licenses/$pkgname/license.txt"

#    echo
#    echo "The password for slimSMTP db-password is: $_dbuser_passwd"
}
