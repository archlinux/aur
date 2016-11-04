# Maintainer: Sergey Shatunov <me@prok.pw>
pkgname=powerdns-admin-git
pkgver=r220.e18757e
pkgrel=3
pkgdesc="Web GUI for PowerDNS autoritative server"
arch=('any')
url="https://github.com/ngoduykhanh/PowerDNS-Admin"
license=('MIT')
options=(!strip)
depends=('python2')
makedepends=('git' 'python2-pip' 'python2-virtualenv')
optdepends=('powerdns: autoritative server itself'
            'postgresql: postgresql backend'
            'mariadb: mysql backend')
install=powerdns-admin.install
backup=(etc/webapps/powerdns-admin/config.py)
source=('powerdns-admin-git::git+https://github.com/ngoduykhanh/PowerDNS-Admin.git'
        'powerdns-admin.install'
        'powerdns-admin.service')
md5sums=('SKIP'
         'edde746cf96d975211b50ad649eb3b5b'
         '14f2531802ca67453bd074ce83249f30')

_uid=980
_gid=$_uid

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}"
  virtualenv2 venv
  virtualenv2 --relocatable venv
  source venv/bin/activate
  PIP_CONFIG_FILE=/dev/null pip2 install --isolated --ignore-installed -r requirements.txt psycopg2 MySQL-python
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
  
  find usr/share/webapps/powerdns-admin/venv/lib -name '*.pyc' -delete
  
  find usr/share/webapps/powerdns-admin -type f -print0 | xargs -0 sed -i \
      -e 's#/usr/bin/python$#/usr/bin/python2#g' \
      -e 's#/usr/bin/env python$#/usr/bin/env python2#g'
  find usr/share/webapps/powerdns-admin/venv -type f -print0 | xargs -0 sed -i -E \
      -e 's#(VIRTUAL_ENV=)".+"#\1"/usr/share/webapps/powerdns-admin/venv"#g' \
      -e 's#(setenv VIRTUAL_ENV )".+"#\1"/usr/share/webapps/powerdns-admin/venv"#g' \
      -e 's#(set -gx VIRTUAL_ENV )".+"#\1"/usr/share/webapps/powerdns-admin/venv"#g'
  sed -i -E -e 's#^\#!.+(venv/bin/python[0-9.]+)$#\#!/usr/share/webapps/powerdns-admin/venv\1#g' usr/share/webapps/powerdns-admin/venv/bin/{flask,migrate,migrate-repository,qr}

  install -o $_uid -g $_gid /dev/stdin usr/share/webapps/powerdns-admin/powerdns-admin <<EOF
#!/usr/bin/env sh
source venv/bin/activate
./run.py
EOF
  chown -R $_uid:$_gid usr/share/webapps/powerdns-admin etc/webapps/powerdns-admin
  
  install ${srcdir}/powerdns-admin.service usr/lib/systemd/system/powerdns-admin.service
}
