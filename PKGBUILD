# Maintainer: smls <smls75@gmail.com>
# Inspired by the netbeans-nightly PKGBUILD by Pavol Hluchy (Lopo) <lopo at losys dot eu>

pkgname=openttd-opengfx-snapshot
pkgver=0.5.1+s20141109
pkgrel=1
pkgdesc='A free graphics set for openttd (latest snapshot release)'
arch=('any')
url='http://dev.openttdcoop.org/projects/opengfx'
license=('GPL')
conflicts=('openttd-opengfx')

_webroot="http://bundles.openttdcoop.org/opengfx/nightlies/LATEST/"

pkgver() {
  cd "${SRCDEST}"
  rm -f changelog.txt && download_file "${_webroot}/changelog.txt"
  rm -f custom_tags.txt && download_file "${_webroot}/custom_tags.txt"
  
  _lastrelease="$(grep -Pom1 'OpenGFX\s+\K[^\s]+' changelog.txt)"
  _snapshotdate="$(grep -Po '^VERSION_STRING.*?:\K[0-9-]+' custom_tags.txt |
                   sed -e 's/\-//g' )"
  
  echo "${_lastrelease}+s${_snapshotdate}"
}

prepare() {
    cd "${SRCDEST}"
    _snapshotnum="$(grep -Po '^NEWGRF_VERSION.*?:\K.*' custom_tags.txt)"
    _file="opengfx-${_snapshotnum}.zip"
    download_file "${_webroot}/${_file}"
    
    cd "$srcdir"
    extract_file "${_file}"
}

package() {
    cd "${srcdir}"
    tar xvf "opengfx.tar"
    cd opengfx
    install -d "${pkgdir}"/usr/share/openttd/data   
    install -m644 *.grf "${pkgdir}"/usr/share/openttd/data
    install -m644 *.obg "${pkgdir}"/usr/share/openttd/data
}
