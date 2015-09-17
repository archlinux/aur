# Maintainer: lightning1141 <lightning1141@gmail.com>
pkgname=pocsuite-git
pkgdesc="Pocsuite is A remote vulnerability test framework developed by Knownsec Security Team. http://sebug.net"
pkgver=770a178.20150917
pkgrel=1
arch=('any')
url="https://github.com/knownsec/Pocsuite"
license=('GPL2')
depends=('python2')
provides=('pocsuite')
conflicts=('pocsuite')
makedepends=('git')
options=('!strip')
source=("git://github.com/knownsec/Pocsuite.git")
md5sums=(SKIP)

_repo_name=Pocsuite

pkgver() {
  cd "$srcdir/$_repo_name"
  _author_ver=$(git describe --always | sed 's|-|.|g;s|0\.9|1.0dev|')
  _last_commit_date=$(git log -1 --pretty='%cd' --date=short | tr -d '-')
  echo $_author_ver.$_last_commit_date
}

package() {
  cd "$srcdir/$_repo_name"

  install -dm755 "$pkgdir/usr/bin"
  install -dm755 "$pkgdir/opt/pocsuite"
  sed -i "s/\#\!.*python/&2/" `grep -rl "\#\!.*python"`

  cp -R --no-preserve=ownership pocsuite "$pkgdir/opt/"
  cat > "$pkgdir/usr/bin/pocsuite" << EOF
#!/bin/bash
cd /opt/pocsuite
python2 pocsuite.py "\$@"
EOF
  cat > "$pkgdir/usr/bin/pcs-console" << EOF
#!/bin/bash
cd /opt/pocsuite
python2 pcs-console.py "\$@"
EOF
  cat > "$pkgdir/usr/bin/pcs-attack" << EOF
#!/bin/bash
cd /opt/pocsuite
python2 pcs-attack.py "\$@"
EOF
  cat > "$pkgdir/usr/bin/pcs-verify" << EOF
#!/bin/bash
cd /opt/pocsuite
python2 pcs-verify.py "\$@"
EOF
  chmod 755 "$pkgdir/usr/bin/pocsuite"
  chmod 755 "$pkgdir/usr/bin/pcs-console"
  chmod 755 "$pkgdir/usr/bin/pcs-attack"
  chmod 755 "$pkgdir/usr/bin/pcs-verify"
}
