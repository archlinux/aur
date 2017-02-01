# Maintainer: Sergey Shatunov <me@prok.pw>
pkgname=powerdns-admin-git
pkgver=r250.e49510c
pkgrel=2
pkgdesc="Web GUI for PowerDNS autoritative server"
arch=('any')
url="https://github.com/ngoduykhanh/PowerDNS-Admin"
license=('MIT')
options=(!strip)
depends=('python2' 'python2-flask' 'python2-flask-wtf' 'python2-flask-login'
         'python2-flask-sqlalchemy'
         'python2-configobj' 'python2-bcrypt' 'python2-requests'
         'python2-ldap' 'python2-sqlalchemy' 'python2-sqlalchemy-migrate'
         'python2-pyotp' 'python2-qrcode' 'python2-flask-oauthlib'
         'python2-dnspython' 'python2-tempita')
makedepends=('git' 'libmariadbclient')
optdepends=('powerdns: autoritative server itself'
            'postgresql: postgresql backend'
            'python2-psycopg2: postgresql adapter'
            'mariadb: mysql backend'
            'mysql-python: mysql adapter')
install=powerdns-admin.install
backup=(etc/webapps/powerdns-admin/config.py)
source=('powerdns-admin-git::git+https://github.com/ngoduykhanh/PowerDNS-Admin.git'
        'powerdns-admin.install'
        'powerdns-admin.service')
md5sums=('SKIP'
         'ad4f38f9118d38cc4c9769393c339d63'
         '4bd6a642f527d8cefc06b4df26b558a0')

_uid=980
_gid=$_uid

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${pkgdir}"
    
  install -o $_uid -g $_gid -d "etc/webapps/powerdns-admin"
  install -o $_uid -g $_gid -d "var/lib/powerdns-admin"
  install -d "usr/share/webapps"
  install -d "usr/lib/systemd/system"

  rm -rf usr/share/webapps/powerdns-admin var/lib/powerdns-admin/upload
  cp -r "${srcdir}/${pkgname}" usr/share/webapps/powerdns-admin
  mv usr/share/webapps/powerdns-admin/upload var/lib/powerdns-admin
  find var/lib/powerdns-admin -name .gitignore -delete
  ln -s /var/lib/powerdns-admin usr/share/webapps/powerdns-admin/upload
  rm -rf usr/share/webapps/powerdns-admin/{.git,.gitignore,config_template.py,README.md,requirements.txt,docker-compose.yml}
  
  ln -s /etc/webapps/powerdns-admin/config.py usr/share/webapps/powerdns-admin/config.py
  cp "${srcdir}/${pkgname}/config_template.py" etc/webapps/powerdns-admin/config.py
    
  find usr/share/webapps/powerdns-admin -type f -print0 | xargs -0 sed -i \
      -e 's#/usr/bin/python$#/usr/bin/python2#g' \
      -e 's#/usr/bin/env python$#/usr/bin/env python2#g'

  chown -R $_uid:$_gid usr/share/webapps/powerdns-admin etc/webapps/powerdns-admin
  
  install ${srcdir}/powerdns-admin.service usr/lib/systemd/system/powerdns-admin.service
}
