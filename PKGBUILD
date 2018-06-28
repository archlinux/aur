pkgname=husky-all
_realpkg=husky
pkgver=1.9_20170406
pkgrel=2
pkgdesc="Husky Fido Tosser: Complete bundle"
arch=('x86_64')
license=('GPL')
url="http://husky.sourceforge.net/hpt.html"
source=('huskymak.cfg'
  'areastat_makefile'
  'nltools_makefile'
  'smapi_makefile'
  'msged_makefile'
  'msged_maps_makefile'
  "https://datapacket.dl.sourceforge.net/project/husky/husky/1.9-current/2017.04.06/husky-all-1.9-source-20170406.tgz"
)
_buildModules="huskylib fidoconf smapi areafix hpt areastat bsopack sqpack nltools hptkill hptsqfix htick msged"
prepare() {
    cp -f huskymak.cfg ${_realpkg}/
    cp -f areastat_makefile ${_realpkg}/areastat/Makefile
    cp -f nltools_makefile ${_realpkg}/nltools/Makefile
    cp -f smapi_makefile ${_realpkg}/smapi/Makefile
    cp -f msged_makefile ${_realpkg}/msged/Makefile
    cp -f msged_maps_makefile ${_realpkg}/msged/maps/makefile.husky
}

build() {
    export LD_BACKUP="$LD_LIBRARY_PATH"
    export LD_LIBRARY_PATH="$LD_BACKUP:${srcdir}/${_realpkg}/huskylib:${srcdir}/${_realpkg}/fidoconf"
    for i in $_buildModules; do
         cd "${srcdir}/${_realpkg}/${i}"
         # if more than -j1, then build fails. Say hello to upstream
         make -j1
    done
    # We need original LD_LIBRARY_PATH for package() and further
    export LD_LIBRARY_PATH="$LD_BACKUP"
    export LD_BACKUP=""
}

package() {
    for i in $_buildModules; do
        cd "${srcdir}/${_realpkg}/${i}"
        make DESTDIR="$pkgdir" install
    done
}

md5sums=('799c230ec374e22abcdb0b5452dce37c'
         '0ec212f2bb31d149cd1717ab681f519a'
         '48ba1f5f4ded114e500ef83ce1fe407a'
         'c7238eec644bd1aeaf0a0c993f5dd8fc'
         '0d09d7d863f9511d6ab9c49c636a8ad3'
         '4c66c7fcb56605e9a691a085c85e1080'
         '2b67ff873321f2d526818db7c440dca6')
