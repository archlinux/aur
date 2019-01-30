pkgname=(husky-tosser-git husky-msged-git)
_realpkg=husky
pkgver=20190108
pkgrel=1
pkgdesc="Husky Fido Tosser"
arch=('x86_64')
license=('GPL')
url="http://husky.sourceforge.net/hpt.html"
conflicts=(husky-tosser husky-msged)
source=('huskymak.cfg'
  'areastat_makefile'
  'nltools_makefile'
  'smapi_makefile'
  'msged_makefile'
  'msged_maps_makefile'
  'hpt::git+https://github.com/huskyproject/hpt.git'
  'huskylib::git+https://github.com/huskyproject/huskylib.git'
  'fidoconf::git+https://github.com/huskyproject/fidoconf.git'
  'smapi::git+https://github.com/huskyproject/smapi.git'
  'areastat::git+https://github.com/huskyproject/areastat.git'
  'areafix::git+https://github.com/huskyproject/areafix.git'
  'bsopack::git+https://github.com/huskyproject/bsopack.git'
  'sqpack::git+https://github.com/huskyproject/sqpack.git'
  'nltools::git+https://github.com/huskyproject/nltools.git'
  'hptkill::git+https://github.com/huskyproject/hptkill.git'
  'htick::git+https://github.com/huskyproject/htick.git'
  'hptsqfix::git+https://github.com/huskyproject/hptsqfix.git'
  'msged::git+https://github.com/huskyproject/msged.git'
)
_tosserModules="huskylib fidoconf smapi areafix hpt areastat bsopack sqpack nltools hptkill hptsqfix htick"
_buildModules="${_tosserModules} msged"
prepare() {
    cp -f ${srcdir}/areastat_makefile ${srcdir}/areastat/Makefile
    cp -f ${srcdir}/nltools_makefile ${srcdir}/nltools/Makefile
    cp -f ${srcdir}/smapi_makefile ${srcdir}/smapi/Makefile
    cp -f ${srcdir}/msged_makefile ${srcdir}/msged/Makefile
    cp -f ${srcdir}/msged_maps_makefile ${srcdir}/msged/maps/makefile.husky
}

pkgver() {
    cd ${srcdir}/hpt/
    head -n 1 ./hpt.spec | awk '{print $3;}'
}

build() {
    export LD_BACKUP="$LD_LIBRARY_PATH"
    export LD_LIBRARY_PATH="$LD_BACKUP:${srcdir}/huskylib:${srcdir}/fidoconf"
    for i in $_buildModules; do
         cd "${srcdir}/${i}"
         # if more than -j1, then build fails. Say hello to upstream
         make -j1
    done
    # We need original LD_LIBRARY_PATH for package() and further
    export LD_LIBRARY_PATH="$LD_BACKUP"
    export LD_BACKUP=""
}

package_husky-tosser-git() {
    pkgdesc="Husky Fido Tosser: hpt (tosser) and netmail/echomail tools"
    provides=("husky-tosser=${pkgver}")
    conflicts=("husky-all" "husky-tosser" "husky-all-git")
    for i in $_tosserModules; do
        cd "${srcdir}/${i}"
        make DESTDIR="$pkgdir" install
    done
}
package_husky-msged-git() {
    pkgdesc='Husky Fido Tosser: msged (message editor)'
    provides=("husky-tosser=${pkgver}")
    depends=('husky-tosser-git')
    conflicts=("husky-all" "husky-msged" "husky-all-git")
    cd "${srcdir}/msged"
    make DESTDIR="$pkgdir" install
}

md5sums=('799c230ec374e22abcdb0b5452dce37c'
         '0ec212f2bb31d149cd1717ab681f519a'
         '48ba1f5f4ded114e500ef83ce1fe407a'
         'c7238eec644bd1aeaf0a0c993f5dd8fc'
         '0d09d7d863f9511d6ab9c49c636a8ad3'
         '4c66c7fcb56605e9a691a085c85e1080'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         )
