# Maintainer: Fat German <fatgerman [at] gmail [dot] com>
# Contributor: der_FeniX <derfenix [at] gmail [dot] com>

pkgname=tardis
pkgver=0.07
pkgrel=3
pkgdesc="Backup system that makes your disc bigger on the inside than on the outside"
arch=('any')
url="http://sourceforge.net/p/ktardis/wiki/Home/"
license=(custom:"SpongWare")
depends=('python2' 'perl' 'perl-datetime' 'perl-filesys-df' 'perl-module-implementation')
optdepends=('kde')
source=(http://sourceforge.net/projects/ktardis/files/${pkgname}-${pkgver}.zip/download)
install=tardis.install
md5sums=('969287290a254a0201a1b9f069c595e1')

build() {
   cd ${srcdir}
   install -dm755 ${pkgdir}/usr/share/apps/plasma/plasmoids/tardis || return 1
   cp -R {contents,metadata.desktop} ${pkgdir}/usr/share/apps/plasma/plasmoids/tardis || return 1
   install -Dm644 metadata.desktop ${pkgdir}/usr/share/kde4/services/plasma-applet-tardis.desktop || return 1
   cd ${pkgdir}/usr/share/apps/plasma/plasmoids/tardis/contents/code
   
   (
   cat <<'EOF'
--- main.py     2012-01-07 01:56:12.871416735 +0400
+++ main.py.new 2012-01-07 01:56:27.867988301 +0400
@@ -39,6 +39,7 @@
 from crontab import CronTab
 from tardis import *
 import subprocess
+from subprocess import CalledProcessError
 import time

 DEBUG = 2
EOF
) > ${srcdir}/patch.patch

   patch -p0 <${srcdir}/patch.patch || return 1

   echo "#!/usr/bin/python2"|cat - ${pkgdir}/usr/share/apps/plasma/plasmoids/tardis/contents/code/main.py > /tmp/out && mv /tmp/out ${pkgdir}/usr/share/apps/plasma/plasmoids/tardis/contents/code/main.py || return 1
   echo "#!/usr/bin/python2"|cat - ${pkgdir}/usr/share/apps/plasma/plasmoids/tardis/contents/code/tardis.py > /tmp/out && mv /tmp/out ${pkgdir}/usr/share/apps/plasma/plasmoids/tardis/contents/code/tardis.py
   echo "#!/usr/bin/python2"|cat - ${pkgdir}/usr/share/apps/plasma/plasmoids/tardis/contents/code/crontab.py > /tmp/out && mv /tmp/out ${pkgdir}/usr/share/apps/plasma/plasmoids/tardis/contents/code/crontab.py
   cd ${srcdir}
   (
   cat <<'EOF'
This program is SpongWare.
The use of SpongWare is entirely according to the following conditions:
1) You may use it or not, I don't care. Just don't winge at me, I hate that
2) It is provided 'as is'. Nobody is responsible for anything it might or might not do.
   Take your lawyers and stuff 'em up your USB port
3) You may distribute it freely, although I would advise against printing it out and
   throwing it out of the window, that stuff gets you fined
4) You may alter it if you wish, and distribute the altered version if you wish but
   you must include this license
5) Before installing this software, smile at someone you like
6) There is no rule 6
7) This notice must be included with any copy of the software you distribute
8) Adherence to 'coding standards' is to be regarded with suspicion.
9) Let me reiterate clause 2. If this program goes wrong in any way, for example
   it deletes all your data or perhaps it wipes the entire internet overnight and
   leaves the world a dead place, nobody is responsible. Deal with it.
   Sometimes, shit happens
EOF
)>LICENSE
   install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

